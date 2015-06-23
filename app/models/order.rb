class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status: { ordered: 0, paid: 1, cancelled: 2, completed: 3 }
  scope :ordered, -> { where(status: 0) }
  scope :paid, -> { where(status: 1) }
  scope :cancelled, -> { where(status: 2) }
  scope :completed, -> { where(status: 3) }

  def total_price
    self.order_items.map(&:total_price).sum
  end

  def display_status
    display = self.status
    if ["completed", "cancelled"].include? self.status
      display += " at #{self.updated_at}"
    end
    display
  end
end
