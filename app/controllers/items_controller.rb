class ItemsController < ApplicationController
  def index
  end

  private

  def item_params 
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end

#params.require(:モデル).permit(:左のモデルの中でも、保存したい値を制限したい時に、permitでカラム指定).merge(結合させたい外部キー。商品を出品したユーザーの情報を紐付けたい時)