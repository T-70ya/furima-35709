require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/files/test_image.jpeg")
    end

    context "商品の情報が正しいとき" do
      it "全て入力されていれば出品できること" do
        expect(@item).to be_valid
      end
    end

    context "商品の情報が正しくない時 " do
      it "商品画像が空だと出品することはできない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空だと出品することはできない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空だと出品することはできない" do
        @item.info = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "商品カテゴリーが---だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態が---だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "商品の配送料の負担が---だと出品できない" do
        @item.haisoryo_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Haisoryo must be other than 1")
      end
      
      it "商品の発送元地域が---だと出品できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it "商品を発送するまでの日数が---だと出品できない" do
       @item.day_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it "商品価格が空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "商品価格が300円未満だと出品できない" do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "商品価格が9999999円超過だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "商品価格が全角数字では出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "商品価格は半角英数字混合では出品できない" do
        @item.price = "abc123"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "商品価格は半角英字のみでは出品できない" do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "商品価格は全角文字では出品できない" do
        @item.price = "ああああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
