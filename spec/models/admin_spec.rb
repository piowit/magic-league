require "rails_helper"

RSpec.describe Admin, type: :model do
  it { expect(build(:admin)).to be_valid }
  it { expect(build(:admin, email: nil)).not_to be_valid }
  it { expect(build(:admin, password: nil)).not_to be_valid }
end
