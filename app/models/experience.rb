class Experience < ApplicationRecord
  belongs_to :user
  has_one_attached :logo

  validates :title, presence: true
  validates :compagny_name, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
