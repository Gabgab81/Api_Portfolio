class Technology < ApplicationRecord
  belongs_to :user
  has_many :techProjects, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true
end
