class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records

  validetes :nickname,        presence: true
  validetes :email,           presence: true, uniqeness: true, format: {with: (/\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i)}
  validetes :encrypted_password, presence: true, format: {with: (/\A[a-z0-9]{6,}\z/i)}
  validetes :last_name,       presence: true, format: {with: (/\A[ぁ-んァ-ヶー-龥々]+\z/)}
  validetes :first_name,      presence: true, format: {with: (/\A[ぁ-んァ-ヶー-龥々]+\z/)}
  validetes :last_name_kana,  presence: true, format: {with: (/\A[ァ-ヶーー]+\z/)}
  validetes :first_name_kana, presence: true, format: {with: (/\A[ァ-ヶーー]+\z/)}
  validetes :birth,           presence: true

end
