class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アカウント画像
  has_one_attached :account_imag_url
  
  #関係性
  has_many :items, dependent: :destroy
end
