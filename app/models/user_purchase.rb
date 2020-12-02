class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :item, :postal_code, :prefecture_id, :city,
                :building_name, :address, :phone, :purchase_id, :token

  with_options presence: true do
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/, message: "is invalid. Don't include hyphen(-)" }
    validates :token
  end

  def save
    # item = Item.find(params[:item_id])
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id,
                       city: city, building_name: building_name, address: address, phone: phone, purchase_id: purchase.id)
  end
end
