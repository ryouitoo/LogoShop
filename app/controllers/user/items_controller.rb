class User::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    if @item.save
      flash[:notice] = "投稿が成功しました"
      redirect_to item_path(@item)
    else
      render :new
    end

  end

  def show
     @item = Item.find(params[:id])
     @customer = @item.customer
     @item_comment = ItemComment.new
     @favorite_count = Favorite.where(item_id: @item.id).count
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "更新できました"
      redirect_to item_path(@item)
    else
      render :edit
      @item.Item.find(params[:id])
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: '投稿を削除しました。'
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :item_name, :explanation, :item_image_url)#ジャンルid/作品名/説明文/写真
  end
end
