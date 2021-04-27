class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end
  end

  private

  def item_params 
    params.require(:item).permit(:selling_price, :image, :item_name, :description_item, :category_id, :item_status_id, :shipping_charge_id, :shipping_area_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end

#params.require(:モデル).permit(:左のモデルの中でも、保存したい値を制限したい時に、permitでカラム指定).merge(結合させたい外部キー。商品を出品したユーザーの情報を紐付けたい時)