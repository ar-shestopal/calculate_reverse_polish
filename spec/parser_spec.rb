require 'spec_helper'

RSpec.describe Parser do
  describe '#parse' do
    context 'valid input' do

      let(:input) { "2 1 -" }

      subject { described_class.new }

      it 'returns parsed atguments and operation' do
        expect(subject.parse(input)).to eq({ args: [2, 1], op: '-' })
      end
    end
  end
end
