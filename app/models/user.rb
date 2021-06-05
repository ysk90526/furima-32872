class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'Full-width characters' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width Kana' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end
end
