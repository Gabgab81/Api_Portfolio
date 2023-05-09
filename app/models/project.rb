class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :code, presence: true, format: { with: /\A(https:\/\/github.com\/\w+\/\w+)/,
  message: "It's not a valide github address" }
end
