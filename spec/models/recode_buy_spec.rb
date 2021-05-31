require 'rails_helper'

RSpec.describe RecodeBuy, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/files/test_image.jpeg")
      @item.save
      @recode_buy = FactoryBot.build(:recode_buy, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context "ユーザーが購入できる時" do
      it "全て正しく入力されていれば購入することができる" do
        expect(@recode_buy).to be_valid
      end

      it "建物名が空でも購入することができる" do
        @recode_buy.build = nil
        @recode_buy.valid?
        expect(@recode_buy).to be_valid
      end

    end

    context "ユーザーが購入できない時" do
      it "郵便番号が空だと購入することはできない" do
        @recode_buy.postcode = nil
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("Postcode can't be blank")
      end
      
      it "郵便番号はハイフンがないと購入することはできない" do
        @recode_buy.postcode = "1234567"
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("Postcode is invalid")
      end

      it "都道府県が---だと購入することはできない" do
        @recode_buy.area_id = 1
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("Area must be other than 1")
      end

      it "市区町村が空だと購入することはできない" do
        @recode_buy.city = nil
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空だと購入することはできない" do
        @recode_buy.address = nil
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空だと購入することはできない" do
        @recode_buy.number = nil
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("Number can't be blank")
      end

      it "電話番号が11桁以上だと購入することはできない" do
        @recode_buy.number = "090123456789"
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("Number is invalid")
      end

      it "カード情報が空だと購入することはできない" do
        @recode_buy.token = nil
        @recode_buy.valid?
        expect(@recode_buy.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end