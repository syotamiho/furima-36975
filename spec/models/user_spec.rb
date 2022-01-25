require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、passwordとpassword_confirmation、name_full、name_half、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "last_name_fullが空では登録できない" do
        @user.last_name_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full can't be blank")
      end
      it "first_name_fullが空では登録できない" do
        @user.first_name_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full can't be blank")
      end
      it "last_name_halfが空では登録できない" do
        @user.last_name_half = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name half can't be blank")
      end
      it "first_name_halfが空では登録できない" do
        @user.first_name_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'emaiは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "last_name_fullが全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.last_name_full = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full 全角文字を使用してください")
      end
      it "first_name_fullが全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name_full = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full 全角文字を使用してください")
      end
      it "last_name_halfが全角（カタカナ）以外では登録できない" do
        @user.last_name_half = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name half 全角文字を使用してください")
      end
      it "first_name_halfが全角（カタカナ）以外では登録できない" do
        @user.first_name_half = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name half 全角文字を使用してください")
      end
    end
  end
end
