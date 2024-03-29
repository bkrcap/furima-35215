require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー登録ができる時" do
      it '全ての値が正常な場合' do
        expect(@user).to be_valid
      end

      it "パスワードは、6文字以上であれば登録できる" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
    end

    context "ユーザー登録ができない時" do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include ('Email has already been taken')
      end

      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "ユーザー本名は、名字が空では登録できない" do
        @user.last_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "ユーザー本名は、名前が空では登録できない" do
        @user.first_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "ユーザー本名のフリガナは、名字が空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "ユーザー本名のフリガナは、名前が空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "ユーザー本名の名前フリガナは、カタカナ以外の全角文字だと登録できない" do
        @user.first_name_kana = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
      end

      it "ユーザー本名の名前フリガナは、カタカナ以外の全角文字だと登録できない" do
        @user.first_name_kana = '一二三四五'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
      end

      it "ユーザー本名の名字フリガナは、半角文字だと登録できない" do
        @user.last_name_kana = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
      end

      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "パスワードは半角数字のみでは登録できない" do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角の英字と数字の両方を含めて設定してください')
      end

      it "パスワードは全角文字では登録できない" do
        @user.password = '１１１１１あ'
        @user.password_confirmation = '１１１１１あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角の英字と数字の両方を含めて設定してください')
      end

      it "メールアドレスに@がなければ登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "パスワードは、半角英数字混合でないと登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角の英字と数字の両方を含めて設定してください')
      end

      it "パスワードは、確認用を含めて2回入力すれば登録できる" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードとパスワード（確認用）は、値が一致していれば登録できる" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力であれば登録できる" do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end

      it "ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力であれば登録できる" do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end

      it "ユーザー本名の名字フリガナは、全角（カタカナ）での入力であれば登録できる" do
        @user.last_name_kana = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
      end

      it "ユーザー本名の名前フリガナは、全角（カタカナ）での入力であれば登録できる" do
        @user.first_name_kana = 'ｱｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
      end
    end
  end
end
