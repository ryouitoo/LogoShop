class User::CustomersController < ApplicationController
    before_action :authenticate_customer!



  def show
    @customer = Customer.find_by_id(params[:id])
  if @customer.nil?
    redirect_to items_path
  end
    @items = Item.where(customer_id:params[:customer_id])
  end

  def edit
    @customer = current_customer


  end

  def update
  	#%@customer = current_customer
  	#%@customer.update(customer_params)
  	#%redirect_to  customers_my_page_path

  	@customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "個人情報を編集しました"
      redirect_to  customer_path
    else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
    end
  end

  def withdraw
    @customer = current_customer
    @customer.is_deleted= true
    if @customer.save
      reset_session
      redirect_to root_path
    end
  end





 private
  def customer_params
   	params.require(:customer).permit(:user_name, :account_name, :email,:encrypted_password, :image)
  end
end
