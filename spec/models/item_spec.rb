require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品出品ができる時" do
      it "全ての値が正常な場合" do
        expect(@item).to be_valid
      end
    end

    context "商品出品ができない時" do
      #it "商品画像を1枚つけないと出品できない" do
      #end

      it "商品名が空では出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品の説明が空では出品できない" do
        @item.description_item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item can't be blank")
      end

      it "カテゴリーの情報が空では出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態についての情報が空では出品できない" do
        @item.item_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it "配送料の負担についての情報が空では出品できない" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it "発送元の地域についての情報が空では出品できない" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "発送までの日数についての情報が空では出品できない" do
        @item.shipping_days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it "販売価格についての情報が空では出品できない" do
        @item.selling_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end

      #it "販売価格は、¥300~¥9,999,999の間以外では出品できない" do

      #end

      it "販売価格は、¥300円未満だと出品できない" do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end

      it '販売価格は¥9,999,999円を超過すると出品できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end

      it "販売価格は全角数字では出品できない" do
        @item.selling_price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
    end
  end
end

