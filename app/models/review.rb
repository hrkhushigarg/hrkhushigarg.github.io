class Review < ApplicationRecord
  belongs_to :work
  validates :content, presence: true
  validates :name, presence: true
  # validates :position, persence: true
end
