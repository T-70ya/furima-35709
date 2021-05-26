class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  validates :password, format: { 
    with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i,
    message: "半角英数字で入力してください"
  }

  validates :firstname, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥々]+\z/,
    message: "漢字、ひらがな、カタカナで入力してください"
  }
  validates :lastname, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥々]+\z/,
    message: "漢字、ひらがな、カタカナで入力してください"
  }
  validates :furiganafirst, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :furiganalast, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :birthday, presence: true

  
end
