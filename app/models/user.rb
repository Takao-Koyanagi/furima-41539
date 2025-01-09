class User < ApplicationRecord
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze }
  with_options format: { with: /\A[ぁ-んァ-ヶー一-龠々]+\z/ } do
    validates :family_name
    validates :first_name
  end
  with_options format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end
    validates :birth_day, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
