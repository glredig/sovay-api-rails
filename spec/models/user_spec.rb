require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  subject { user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }

  it { should be_valid }

  describe 'when email is not present' do
    before { user.email = nil}
    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before { user.password = nil}
    it { should_not be_valid }
  end
end
