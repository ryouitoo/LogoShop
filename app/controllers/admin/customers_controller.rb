class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find_by_id(params[:id])
    @items = @customer.items
  end
end
