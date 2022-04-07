class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Namekana kana Full-width katakana characters"}
  validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Family_namekana kana Full-width katakana characters"}
  validates :birthday, presence: true
  
  validates :email, presence: true, uniqueness: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  end


  has_many :products
  has_many :orders

end
