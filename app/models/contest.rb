class Contest < ApplicationRecord
  validates :date, presence: true

  belongs_to :league
  has_many :pods
end
