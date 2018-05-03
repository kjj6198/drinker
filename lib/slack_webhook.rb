require 'net/http'
require 'json'

module SlackWebhook
  def send_to_slack(message, channel)
    webhook_url = ENV['SLACK_WEBHOOK_URL']
    data = {
      text: message,
      username: "yuile",
      channel: channel
    }.to_json
    http = Curl.post(webhook_url, data)
    puts http.body_str
  end
end
