class User::GuestsController < ApplicationController


 def new_guest
   customer = Customer.find_or_create_by!(user_name:'guest', account_name:'guest', email: 'guest@example.com') do |customer|
     customer.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    customer.image = default_guest_image
      customer.save!
      #ゲストイメージ
   end
   sign_in customer
   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
 end

 private

  def default_guest_image
    File.open(Rails.root.join('app', 'assets', 'images', 'default_guest_image.png'))
  end

end
