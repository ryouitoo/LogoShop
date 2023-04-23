class User::GuestsController < ApplicationController


 def new_guest
   customer = Customer.find_or_create_by!(user_name:'guest', account_name:'guest', email: 'guest@example.com') do |customer|
     customer.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    customer.account_image_url.attach(io: default_guest_image, filename: 'default-image.jpg', content_type: 'image/jpeg')
      customer.save!
      #ゲストイメージ
   end
   sign_in customer
   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
 end

 private

  def default_guest_image
    file_path = Rails.root.join('app/assets/images/default_guest_image.png')
    File.open(file_path)
  end


end
