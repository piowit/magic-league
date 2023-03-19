require "rails_helper"

RSpec.describe Pod, type: :model do
  it { expect(build(:pod)).to be_valid }
end
