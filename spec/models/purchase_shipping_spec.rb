require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe 'イラスト購入機能' do
    before do
      @purchase_shipping = FactoryBot.build(:purchase_shipping)
    end
    context '購入がうまくいくとき' do
      it 'token、postal_code、prefecture_id、city、address、telがあれば購入できること' do
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空だと購入できないこと' do
        @purchase_shipping.token = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")        
      end
      it 'postal_codeが空だと購入できないこと' do
        @purchase_shipping.postal_code = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeの数字の間に"-"がなければ購入できないこと' do
        @purchase_shipping.postal_code = 1234567
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeは数字以外の文字では購入できないこと' do
        @purchase_shipping.postal_code = "aaa-aaaa"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_id"---"では購入できないこと' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture Select")

      end
      it 'cityが空では購入できないこと' do
        @purchase_shipping.city = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できないこと' do
        @purchase_shipping.address = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できないこと' do
        @purchase_shipping.phone_number = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberの数字の間に"-"があると購入できないこと' do
        @purchase_shipping.phone_number = "090-1234-5678"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numberの桁数が11桁を超えると購入できないこと' do
        @purchase_shipping.phone_number = "090123456789"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
