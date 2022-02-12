require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入者情報の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'municipalityが空だと購入できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'blockが空だと購入できない' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'numberが空だと購入できない' do
        @purchase_address.number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      end
      it 'numberは9桁以下だと購入できない' do
        @purchase_address.number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number is invalid")
      end
      it 'numberは12桁以上だと購入できない' do
        @purchase_address.number = '123456789123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number is invalid")
      end
      it 'numberは半角数字以外が含まれている場合だと購入できない' do
        @purchase_address.number = '090-1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number is invalid")
      end
      it 'city_idに「1」が選択されている場合は出品できない' do
        @purchase_address.city_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
