# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = create(:user)

    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = build(:user, name: nil)

    expect(user).to_not be_valid
  end

  it 'is not valid without a email' do
    user = build(:user, email: nil)

    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = build(:user, password: nil)

    expect(user).to_not be_valid
  end
end
