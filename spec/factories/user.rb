# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { 'email@example.com' }
    password { 'taco1234' }
  end
end
