require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'valid attributes' do
      it 'is valid with valid attributes' do
        expect(build(:user)).to be_valid
      end

      it 'is valid without optional attributes' do
        expect(build(:user, last_name: nil, mobile: nil)).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'is not valid without a first name' do
        expect(build(:user, first_name: nil)).to_not be_valid
      end

      it 'is not valid with first name longer than 50 characters' do
        expect(build(:user, first_name: 'a' * 51)).to_not be_valid
      end

      it 'is not valid without an email' do
        expect(build(:user, email: nil)).to_not be_valid
      end

      it 'is not valid without a unique email' do
        user = create(:user)
        expect(build(:user, email: user.email)).to_not be_valid
      end

      it 'is not valid with mobile longer than 10 characters' do
        expect(build(:user, mobile: 'a' * 11)).to_not be_valid
      end
    end
  end
end
