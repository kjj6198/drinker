class CountdownWorker
  include Sidekiq::Worker
  include SlackWebhook

  def perform(menu_id, message)
    send_to_slack message
  end
end
