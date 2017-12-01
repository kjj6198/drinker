# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

preload_app! true

before_fork do |server, worker|
  Signal.trap "TERM" do
    puts "Unicorn master intercepting TERM and sending myself QUIT instead"
    Process.kill "QUIT", Process.pid
  end
  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap "TERM" do
    puts "Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT"
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
