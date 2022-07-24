# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'MyString' }
    password { '12345687913' }
  end
end
