class Item < ApplicationRecord

  #作品画像
  has_one_attached :item_image_url

  #関係性
  belongs_to :customer
  belongs_to :genre

  #バリデーション
  validates :item_name, presence: true
  validates :explanation, presence: true

end
