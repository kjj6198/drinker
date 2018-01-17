class Order < ApplicationRecord
  belongs_to :menu
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :price
  validates_numericality_of :price, :greater_than => 10
end
