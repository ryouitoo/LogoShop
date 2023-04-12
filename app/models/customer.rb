class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アカウント画像
  has_one_attached :account_imag_url
  mount_uploader :image, ImageUploader

  #関係性
  has_many :items, dependent: :destroy
  
  #バリデーション
  validates :user_name, presence: true
  validates :account_name, presence: true
  validates :email, presence: true
  validates :image, presence: true
end
