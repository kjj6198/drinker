source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.4'

gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'devise'
gem 'cancancan'
gem 'filestack-rails'
gem 'kaminari'
gem 'sidekiq'
gem 'paperclip'
gem 'figaro'
gem 'font-awesome-rails'
gem 'omniauth-google-oauth2'
gem 'simple_form'
gem 'rolify'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'
gem 'pry'
gem 'binding_of_caller'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'curb'
gem 'unicorn'
gem 'turbolinks', '~> 5.0.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'better_errors'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
