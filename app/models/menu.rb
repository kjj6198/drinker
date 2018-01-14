class Menu < ApplicationRecord
  include SlackWebhook


  delegate :url_helpers, to: 'Rails.application.routes'
  has_many :orders, dependent: :destroy
  belongs_to :drink_shop
  belongs_to :user

  after_create :send_notification
  after_create :start_countdown

  def remain_time
    mins = (self.end_time - DateTime.now).to_i / 60
    secs = (self.end_time - DateTime.now).to_i % 60

    if mins < 0
      return "已截止"
    end

    "#{mins}分 #{secs}秒"
  end

  def total
    return self.orders.sum(:price)
  end

  private

  def start_countdown
    if self.end_time > Time.now
      CountdownWorker.perform_at(self.end_time, self.id)
    end
  end
  def send_notification
    message = "#{self.user.username} 已經發起了訂飲料活動\n
1. *店家名稱*: #{self.drink_shop.name}
2. *開始時間*: #{self.created_at.strftime('%I:%M %p')}
3. *結束時間*: #{self.end_time.strftime('%I:%M %p')}
4. *訂餐連結*: #{url_helpers.menu_url(self)}
5. *剩餘時間*: #{self.remain_time}
6. *訂單圖片*：#{self.drink_shop.image_url}
    "
    send_to_slack message
  end
end
