require 'rails_helper'

RSpec.describe CardAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @card_address = FactoryBot.build(:card_address,user_id: @user.id, item_id: @item.id)
  end

  it "is valid with valid attributes including item and user" do
    if @card_address.invalid?
      puts @card_address.errors.full_messages
    end
    expect(@card_address).to be_valid
  end
  
  describe '商品購入登録' do
    context '購入ができるとき' do
      it 'すべて正しく入力されていれば保存できること' do
        expect(@card_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @card_address.building_name = ''
        expect(@card_address).to be_valid
      end
    end

    context '購入ができないとき' do
      it 'post_codeが空だと保存できないこと' do
        @card_address.post_code = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @card_address.post_code = '1234567'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @card_address.prefecture_id = '1'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @card_address.address = nil
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @card_address.phone_number = ' '
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @card_address.phone_number = '０９０１２３４５６７８'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone number is invalid. It should be 10 or 11 digits without hyphens.")
      end
      it 'phone_numberが半角のハイフンを含むと保存できないこと' do
        @card_address.phone_number = '090-1234-6789'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Phone number is invalid. It should be 10 or 11 digits without hyphens.")
      end
      it 'userが紐付いていないと保存できないこと' do
        @card_address.user_id = ' '
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @card_address.item_id = ' '
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end