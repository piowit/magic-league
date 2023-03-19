class Contest < ApplicationRecord
  validates :date, presence: true

  belongs_to :league
end
