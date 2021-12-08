# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateLink do
  describe '#resolve' do
    subject(:link) do
      described_class.new(object: nil, field: nil, context: {}).resolve(
        url: url,
        description: description
      )
    end

    let(:url) { 'http://example.com' }
    let(:description) { 'description' }

    it { expect(link).to be_persisted }

    it 'should have the expected values' do
      expect(link).to have_attributes(
        url: url,
        description: description
      )
    end
  end
end
