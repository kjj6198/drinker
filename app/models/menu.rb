require "slack_webhook"
class Menu < ApplicationRecord
  include SlackWebhook

  delegate :url_helpers, to: 'Rails.application.routes'
  has_many :orders, dependent: :destroy
  belongs_to :drink_shop
  belongs_to :user

  after_create :send_notification
  # after_save :start_countdown

  def remain_time
    mins = (self.end_time - DateTime.now).to_i / 60
    secs = (self.end_time - DateTime.now).to_i % 60
    "#{mins}分 #{secs}秒"
  end

  private

  def send_notification
    message = "#{self.user.username} 已經發起了訂飲料活動\n
      1. *店家名稱*: #{self.drink_shop.name}
      2. *開始時間*: #{self.created_at.strftime('%I:%M %p')}
      3. *結束時間*: #{self.end_time.strftime('%I:%M %p')}
      4. *訂餐連結*: test
      5. 剩餘時間: #{self.remain_time}
      https://www.w3schools.com/w3css/img_fjords.jpg
    "
    send_to_slack message
  end
end
