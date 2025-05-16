class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :user

  has_one :order
  def sold_out?
    order.present?
  end

  has_one_attached :image

  validates :name, presence: true
  validate :image_presence
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :condition_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :shipping_fee_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :delivery_time_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :item_price,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999
            }
end
