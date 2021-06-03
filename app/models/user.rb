class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         validates :password, format: {with: VALID_PASSWORD_REGEX }

         validates :nickname, presence: true
         validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
         validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
         validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
         validates :birthday, presence: true
end
