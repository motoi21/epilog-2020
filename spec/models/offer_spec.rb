require 'rails_helper'

RSpec.describe Offer, type: :model do
  before do
    @offer = FactoryBot.build(:offer)
  end
  describe 'イラスト制作依頼機能' do
    context '制作依頼が投稿できる時' do
      it 'order_name,detail,deadline,category_id,genre_id,budgetがあれば保存できること' do
        expect(@offer).to be_valid
      end
    end

    context '制作依頼が投稿できない時' do
      it 'order_nameが空だと投稿できない' do
        @offer.order_name = ''
        @offer.valid?
        expect(@offer.errors.full_messages).to include("Order name can't be blank")
      end
      it 'detailが体と投稿できない' do
        @offer.detail = ''
        @offer.valid?
        expect(@offer.errors.full_messages).to include("Detail can't be blank")
      end
      it 'deadlineが空だと投稿できない' do
        @offer.deadline = ''
        @offer.valid?
        expect(@offer.errors.full_messages).to include("Deadline can't be blank")
      end
      it 'categoryが"---"だと登録できないこと' do
        @offer.category_id = 1
        @offer.valid?
        expect(@offer.errors.full_messages).to include('Category Select')
      end
      it 'genreが"---"だと登録できないこと' do
        @offer.genre_id = 1
        @offer.valid?
        expect(@offer.errors.full_messages).to include('Genre Select')
      end
      it 'budgetが空だと投稿できない' do
        @offer.budget = ''
        @offer.valid?
        expect(@offer.errors.full_messages).to include("Budget can't be blank")
      end
      it 'budgetが半角数字でないと投稿できないこと' do
        @offer.budget = '１００'
        @offer.valid?
        expect(@offer.errors.full_messages).to include('Budget Out of setting range')
      end
      it 'budgetが100未満だと投稿できないこと' do
        @offer.budget = 99
        @offer.valid?
        expect(@offer.errors.full_messages).to include('Budget Out of setting range')
      end
      it 'budgetが9999999を超えると投稿できないこと' do
        @offer.budget = 10_000_000
        @offer.valid?
        expect(@offer.errors.full_messages).to include('Budget Out of setting range')
      end
    end
  end
end
