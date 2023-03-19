class MembershipsPod < ApplicationRecord
  belongs_to :pod
  belongs_to :membership
  validates :place, :points, :commander_name, presence: true
end
