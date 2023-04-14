class ItemComment < ApplicationRecord

  belongs_to:customer
  belongs_to:item

  #バリデーション
  validates :comment, presence: true,length:{maximum:140}
  
end
