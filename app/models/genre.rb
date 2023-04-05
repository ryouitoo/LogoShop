class Genre < ApplicationRecord

  #関係性
   has_many :items

   #バリデーション
   validates :genre_name, presence: true

end
