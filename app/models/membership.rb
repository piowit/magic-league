class Membership < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :memberships_pods
end
