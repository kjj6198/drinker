class Menu < ApplicationRecord
  include SlackWebhook


  delegate :url_helpers, to: 'Rails.application.routes'
  has_many :orders, dependent: :destroy
  belongs_to :drink_shop
  belongs_to :user

  after_create :send_notification
  after_create :start_countdown

  def is_full?
    if self.max_count.present?
      return self.orders.count >= self.max_count
    end

    return false
  end

  def remain_time
    mins = (self.end_time - DateTime.now).to_i / 60
    secs = (self.end_time - DateTime.now).to_i % 60

    if mins < 0
      return "已截止"
    end

    "#{mins}:#{secs}"
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
    message = {
      text: "由 #{self.user.username} 所發起的 #{self.name}",
      attachments: [
        {
          title: self.name,
          title_link: url_helpers.menu_url(self),
          color: "#27cc95",
          image_url: self.drink_shop.image_url,
          fields: [
            { title: "開始時間", value: self.created_at.strftime('%I:%M %p'), short: true },
            { title: "結束時間", value: self.end_time.strftime('%I:%M %p'), short: true },
            { title: "剩餘時間", value: self.remain_time, short: true },
            { title: "限量杯數", value: self.max_count.present? ? self.max_count : "無限制", short: true }
          ]
        }
      ],
    }
    send_to_slack message, self.channel
  end
end
