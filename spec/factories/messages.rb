# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    text { 'MyText' }
    user { nil }
  end
end
