require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @card_address = FactoryBot.build(:card_address, user_id: user.id)
  end
  describe '寄付情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@card_address).to be_valid
      end
      it 'cityは空でも保存できること' do
        @card_address.city = ''
        expect(@card_address).to be_valid
      end
      it 'addressは空でも保存できること' do
        @card_address.house_number = ''
        expect(@card_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @card_address.building_name = ''
        expect(@card_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @card_address.postal_code = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @card_address.postal_code = '1234567'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @card_address.prefecture = 0
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @card_address.price = nil
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できないこと' do
        @card_address.price = '２０００'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが1円未満では保存できないこと' do
        @card_address.price = 0
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
        @card_address.price = 1000001
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @card_address.user_id = nil
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end