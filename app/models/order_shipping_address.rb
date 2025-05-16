class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :order, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,
              format: { with: /\A\d{10,11}\z/, message: 'must be a 10 to 11 digit number using half-width characters' }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user: user, item: item)
    ShippingAddress.create(order: order, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                           building: building, phone_number: phone_number)
  end
end
