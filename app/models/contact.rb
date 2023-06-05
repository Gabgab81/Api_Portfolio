class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :message, presence: true
end
