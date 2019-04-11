require 'spec_helper'

RSpec.describe CalculateReversePolish::Core do
  describe '#process' do
    subject { described_class.new }

    context 'valid input' do
      it 'returns single value' do
        expect(subject.process("2")).to eq 2.0
      end

      it 'returns addition' do
        expect(subject.process("2 1 +")).to eq 3.0
      end

      it 'returns subtraction' do
        expect(subject.process("2 1 -")).to eq 1.0
      end

      it 'returns nultiplication' do
        expect(subject.process("2 3 *")).to eq 6.0
      end

      it 'returns division' do
        expect(subject.process("6 3 /")).to eq 2.0
      end
    end

    context 'stores previous result' do
      it 'stores number input' do
        subject.process('13')
        expect(subject.stack).to eq [13]
      end

      it 'can use previous result' do
        subject.process('13')
        expect(subject.process("3 -")).to eq 10.0
      end
    end
  end
end
