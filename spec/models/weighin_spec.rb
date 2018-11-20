require 'rails_helper'

RSpec.describe Weighin, type: :model do
  let!(:weighin) { create(:weighin)}

  subject { weighin }

  it { should respond_to(:weight) }
  it { should respond_to(:date) }

  it { should be_valid }

  describe "when weight is not present" do
    before { weighin.weight = nil}
    it { should_not be_valid }
  end

  describe "when date is not present" do
    before { weighin.date = nil}
    it { should_not be_valid }
  end
end
