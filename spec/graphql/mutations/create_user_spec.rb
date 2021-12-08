# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateUser do
  describe '#resolve' do
    subject(:user) do
      described_class.new(object: nil, field: nil, context: {}).resolve(
        name: name,
        auth_provider: {
          credentials: {
            email: email,
            password: password
          }
        }
      )
    end

    let(:name) { 'Test User' }
    let(:email) { 'email@example.com' }
    let(:password) { '[omitted]' }

    it { expect(user).to be_persisted }

    it 'should have the expected values' do
      expect(user).to have_attributes(email: email, password: password)
    end
  end
end
