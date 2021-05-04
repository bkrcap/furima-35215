class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id
  before_action :other_sellers_purchase

  def index
  @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def other_sellers_purchase
    redirect_to root_path  if current_user.id == @item.user_id || @item.purchase_management.present?
  end

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :shipping_area_id, :municipality, :addres, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end