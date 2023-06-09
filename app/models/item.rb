class Item < ApplicationRecord

  #作品画像
  has_one_attached :item_image_url

  #関係性
  belongs_to :customer
  has_many :item_genres, dependent: :destroy
  has_many :genres, through: :item_genres, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  #バリデーション
  validates :item_name, presence: true
  validates :explanation, presence: true

  #いいね機能
  def favorited?(customer)
   favorites.where(customer_id: customer.id).exists?
  end

end
