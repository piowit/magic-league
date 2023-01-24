require "rails_helper"

RSpec.describe League, type: :model do
  subject { build(:league) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { expect(build(:league)).to be_valid }
  it { expect(build(:league, start_date: Date.current, end_date: Date.current)).not_to be_valid }
  it { expect(build(:league, start_date: Date.current, end_date: Date.current - 1.day)).not_to be_valid }
  it { expect(build(:league, owners: [])).not_to be_valid }
  it { expect(build(:league, owners: [create(:user)])).to be_valid }
end
