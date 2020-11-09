require 'rails_helper'

RSpec.describe Drawing, type: :model do
  before do
    @drawing = FactoryBot.build(:drawing)
  end
  describe 'イラスト投稿機能' do
    context 'イラストが投稿できるとき' do
      it 'image、title、production_date、category_id、genre_idがあれば登録できる' do
        expect(@drawing).to be_valid
      end
    end

    context 'イラストが投稿できないとき' do
      it 'imageが空だと投稿できない' do
        @drawing.image = nil
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと投稿できない' do
        @drawing.title = ''
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include("Title can't be blank")
      end
      it 'production_dateが空だと登録できないこと' do
        @drawing.production_date = ''
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include("Production date can't be blank")
      end
      it 'categoryが"---"だと登録できないこと' do
        @drawing.category_id = 1
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include('Category Select')
      end
      it 'genreが"---"だと登録できないこと' do
        @drawing.genre_id = 1
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include('Genre Select')
      end
      it 'priceが半角数字でないと投稿できないこと' do
        @drawing.price = '１００'
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが100未満だと投稿できないこと' do
        @drawing.price = 99
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9999999を超えると投稿できないこと' do
        @drawing.price = 10_000_000
        @drawing.valid?
        expect(@drawing.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
