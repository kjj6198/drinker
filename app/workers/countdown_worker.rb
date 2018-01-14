require "slack_webhook"

class CountdownWorker
  include Sidekiq::Worker
  include SlackWebhook

  def perform(menu_id)
    menu = Menu.find(menu_id)
    menu.is_active = false

    menu.save
    message = "#{menu.name} 已經結束囉，沒訂到哭哭哦:jack-see-you:\n
訂單編號：#{menu.id}\n
查詢訂單：`@yuile order :order_id`
訂單金額：#{menu.total}
"
    send_to_slack message
  end
end
