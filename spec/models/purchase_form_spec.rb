require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe "商品購入" do
    context "商品購入ができる時" do
      it "全ての値が正常な場合" do
        expect(@purchase).to be_valid
      end

      it "建物名が抜けていても登録できること" do
        expect(@purchase).to be_valid
      end
    end

    context "商品購入ができない時" do
      it "郵便番号が空では出品できない" do
        @purchase.postal_code = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it "郵便番号の保存にはハイフンがないと登録できない" do
        @purchase.postal_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it "都道府県が空では登録できない" do
        @purchase.shipping_area_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "都道府県の情報が___では登録できない" do
        @purchase.shipping_area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it "市区町村が空では登録できない" do
        @purchase.municipality = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
      end

      it "番地が空では登録できない" do
        @purchase.addres = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Addres can't be blank")
      end

      it "電話番号が空では登録できない" do
        @purchase.phone_number = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号は9桁以下だと登録できない" do
      end

      it "電話番号は12桁以上だと登録できない" do
        @purchase.phone_number = "123456789123"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できない" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できない" do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できない" do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end

      it "電話番号が英数混合では登録できない" do
        @purchase.phone_number = "123456789ab"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
