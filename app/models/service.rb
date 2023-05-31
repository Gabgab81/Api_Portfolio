class Service < ApplicationRecord
  belongs_to :user
  has_one_attached :icon

  validates :title, presence: true
end
