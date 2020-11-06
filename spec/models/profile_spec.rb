require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end
  describe '新規プロフィール作成' do
    context 'プロフィールが登録できるとき' do
      it 'category_id,genre_idがあれば登録できる' do
        expect(@profile).to be_valid
      end
    end

    context 'プロフィールが登録できないとき' do
      it 'カテゴリー選択で"---"を選択すると登録できない' do
        @profile.category_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Category Select")
      end
      it 'ジャンル選択で"---"を選択すると登録できない' do
        @profile.genre_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Genre Select")
      end
    end
  end
end
