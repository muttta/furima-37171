class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items
  #has_many :records

  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: {with: (/\A[ぁ-んァ-ヶー-龥々ー]+\z/), message: "は全角(漢字・ひらがな・カタカナ)で入力してください"}
  validates :first_name,      presence: true, format: {with: (/\A[ぁ-んァ-ヶー-龥々ー]+\z/), message: "は全角(漢字・ひらがな・カタカナ)で入力してください"}
  validates :last_name_kana,  presence: true, format: {with: (/\A[ァ-ヶーー]+\z/), message: "は全角(カタカナ)で入力してください"}
  validates :first_name_kana, presence: true, format: {with: (/\A[ァ-ヶーー]+\z/), message: "は全角(カタカナ)で入力してください"}
  validates :birth,           presence: true
  validates :password, :password_confirmation, format: {with: (/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i), message: "は半角英数字混合で入力してください"}
  
end
