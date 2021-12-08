# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SignInUser do
  describe '#resolve' do
    subject(:result) do
      described_class.new(object: nil, field: nil, context: {}).resolve(
        credentials: credentials
      )
    end

    context 'when thre are no credentials' do
      let(:credentials) { { email: nil, password: nil } }

      it { expect(result).to be_nil }
    end

    context 'when the wrong email is present' do
      let(:credentials) { { email: 'wrong' } }

      it { expect(result).to be_nil }
    end

    context 'when the wrong password is present' do
      let(:user) { create(:user) }
      let(:credentials) { { email: user.email, password: 'wrong' } }

      it { expect(result).to be_nil }
    end

    context 'when the email and password are correct' do
      let(:user) { create(:user) }
      let(:credentials) { { email: user.email, password: user.password } }

      it 'returns the token' do
        expect(result[:token]).to be_a_kind_of(String)
      end

      it 'returns the user id' do
        expect(result[:user].id).to be_a_kind_of(Integer)
      end
    end
  end
end
