# frozen_string_literal: true

FactoryBot.define do
  factory :channel do
    name { 'MyString' }
    user { nil }
  end
end
