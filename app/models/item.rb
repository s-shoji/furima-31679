class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, :description, :price, :user, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :shipping_cost_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :shipping_days_id, numericality: { other_than: 0 }
  validates :price, numericality: { greater_than: 300, less_than: 9999999},
  format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }

end
