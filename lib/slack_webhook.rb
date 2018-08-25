require 'net/http'
require 'json'

module SlackWebhook
  def send_to_slack(message = {}, channel)
    webhook_url = ENV['SLACK_WEBHOOK_URL']
    data = {
      username: "yuile",
      channel: channel,
      color: "#27cc95"
    }.merge(message).to_json

    http = Curl.post(webhook_url, data)
    puts http.body_str
  end
end
