require 'net/http'
require 'json'

module SlackWebhook
  def send_to_slack message
    webhook_url = ENV['SLACK_WEBHOOK_URL']
    data = {
      text: message,
      username: "jack_drinker"
    }.to_json
    http = Curl.post(webhook_url, data)
    puts http.body_str
  end
end
