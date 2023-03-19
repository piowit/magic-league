class League < ApplicationRecord
  validates :name, :start_date, :end_date, :owners, presence: true
  validate :end_date_after_start_date, if: :dates_present?

  has_many :ownerships
  has_many :owners, through: :ownerships, source: :user
  has_many :memberships
  has_many :players, through: :memberships, source: :user
  has_many :contests

  private

  def end_date_after_start_date
    errors.add(:end_date, "must be after start date") if start_date >= end_date
  end

  def dates_present?
    start_date && end_date
  end
end
