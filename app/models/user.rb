class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { 
  with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i,
  message: "半角英数字で入力してください"
  }

  with_options presence: true do
    
    validates :nickname

    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "漢字、ひらがな、カタカナで入力してください"} do
      validates :firstname 
      validates :lastname
    end

    with_options format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"} do
      validates :furiganafirst
      validates :furiganalast
    end
    
    validates :birthday
  
  end

  has_many :items

end
