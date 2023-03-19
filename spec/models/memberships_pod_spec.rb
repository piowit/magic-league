require "rails_helper"

RSpec.describe MembershipsPod, type: :model do
  it { expect(build(:memberships_pod)).to be_valid }
  it { expect(build(:memberships_pod, pod: nil)).not_to be_valid }
  it { expect(build(:memberships_pod, membership: nil)).not_to be_valid }

  it { should validate_presence_of(:place) }
  it { should validate_presence_of(:commander_name) }
  it { should validate_presence_of(:points) }
end
