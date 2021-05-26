require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context "ユーザーが登録できる時" do
      it "全て存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "passwordが６文字以上で英数字が入っていれば登録できる" do
        @user.password ="111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
    end

    context "ユーザーが登録できない時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空だと登録できない" do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "11aaa"
        @user.password_confirmation = "11aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "passwordは数字のみだと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字で入力してください")
      end

      it "passwordは英語のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字で入力してください")
      end

      it "passwordは全角では登録できない" do
        @user.password = "１１１ａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字で入力してください")
      end

      it "passwordとpassword_cofirmationが一致していないと登録できない" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "重複したemailが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "ユーザー本名の名字が空だと登録できない" do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it "ユーザー本名の名前が空だと登録できない" do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it "ユーザー本名の名字は漢字ひらがなカタカナでないと登録できない" do
        @user.lastname = "sato"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname 漢字、ひらがな、カタカナで入力してください")
      end

      it "ユーザー本名の名前は漢字ひらがなカタカナでないと登録できない" do
        @user.firstname = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname 漢字、ひらがな、カタカナで入力してください")
      end

      it "ユーザー名の名字のフリガナが空だと登録できない" do
        @user.furiganalast = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furiganalast can't be blank")
      end

      it "ユーザー名の名前のフリガナが空だと登録できない" do
        @user.furiganafirst = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furiganafirst can't be blank")
      end

      it "ユーザー名の名字のフリガナは全角カタカナでないと登録できない" do
        @user.furiganalast = "sato"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furiganalast 全角カタカナのみで入力して下さい")
      end

      it "ユーザー名の名前のフリガナは全角カタカナでないと登録できない" do
        @user.furiganafirst = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furiganafirst 全角カタカナのみで入力して下さい")
      end

      it "誕生日が空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
