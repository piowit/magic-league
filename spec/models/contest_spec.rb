require "rails_helper"

RSpec.describe Contest, type: :model do
  it { expect(build(:contest)).to be_valid }
  it { expect(build(:contest, league: nil)).not_to be_valid }
  it { expect(build(:contest, date: nil)).not_to be_valid }
end
