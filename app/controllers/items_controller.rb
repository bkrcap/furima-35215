class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :other_sellers_edit, except: [:index, :new, :create, :show] 
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC") 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params 
    params.require(:item).permit(:selling_price, :image, :item_name, :description_item, :category_id, :item_status_id, :shipping_charge_id, :shipping_area_id, :shipping_days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def other_sellers_edit
    redirect_to root_path unless current_user.id == @item.user_id
  end
end