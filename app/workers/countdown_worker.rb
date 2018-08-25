require "slack_webhook"

class CountdownWorker
  include Sidekiq::Worker
  include SlackWebhook

  def perform(menu_id)
    menu = Menu.find(menu_id)
    menu.is_active = false

    menu.save
    message = {
      text: "#{menu.name} 已經結束囉，沒訂到哭哭哦:jack-see-you:",
      attachments: [
        {
          color: "#fe6565",
          fields: [
            { title: "訂單編號", value: menu.id, short: true },
            { title: "查詢訂單", value: "`@yuile order #{menu.id}`", short: true },
            { title: "訂單金額", value: menu.total },
            { title: "杯數", value: menu.orders.length }
          ]
        }
      ]  
    }

    send_to_slack message, menu.channel
  end
end
