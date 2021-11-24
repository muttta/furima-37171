class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records

  validates :nickname,        presence: true
  validates :email,           presence: true, uniqueness: true, format: {with: (/\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i)}
  validates :encrypted_password, presence: true, format: {with: (/\A[a-z0-9]{6,}\z/i)}
  validates :last_name,       presence: true, format: {with: (/\A[ぁ-んァ-ヶー-龥々]+\z/)}
  validates :first_name,      presence: true, format: {with: (/\A[ぁ-んァ-ヶー-龥々]+\z/)}
  validates :last_name_kana,  presence: true, format: {with: (/\A[ァ-ヶーー]+\z/)}
  validates :first_name_kana, presence: true, format: {with: (/\A[ァ-ヶーー]+\z/)}
  validates :birth,           presence: true

end
