class Pod < ApplicationRecord
  belongs_to :contest
  has_many :memberships_pods
end
