class Genre < ApplicationRecord

  #関係性
   has_many :item_genres, dependent: :destroy
   has_many :items, through: :item_genres, dependent: :destroy

   #バリデーション
   validates :gename, presence: true
end
