class Project < ApplicationRecord
  belongs_to :user
  has_many :techProjects, dependent: :destroy
  
  has_one_attached :image
  has_one_attached :db

  validates :name, presence: true
  validates :description, presence: true
  validates :code, presence: true, format: { with: /\A(https:\/\/github.com\/\w+\/\w+)/,
  message: "It's not a valide github address" }
end
