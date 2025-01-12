require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品登録' do
    context '出品商品が登録できるとき' do
      it 'name、price、description、category_id、condition_id、shipping_cost_id、prefecture_id、shipping_day_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円以下では登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが9999999円以上では登録できない' do
        @item.price = '12000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが---では登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it 'condition_idが---では登録できない' do
        @item.condition_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition is not a number"
      end
      it 'shipping_cost_idが---では登録できない' do
        @item.shipping_cost_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost is not a number"
      end
      it 'prefecture_idが---では登録できない' do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture is not a number"
      end
      it 'shipping_day_idが---では登録できない' do
        @item.shipping_day_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day is not a number"
      end
    end
  end
end