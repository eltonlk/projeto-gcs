class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :bank_accounts, dependent: :destroy
  has_many :tags         , dependent: :destroy

  validates :name, presence: true
end
