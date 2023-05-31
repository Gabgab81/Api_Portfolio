class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_token_authenticatable

  has_many :technologies, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :services, dependent: :destroy
end
