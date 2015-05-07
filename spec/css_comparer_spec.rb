require 'spec_helper'
require './css_comparer'

describe CSS::Comparer do
  let(:comparer) { CSS::Comparer.new }

  describe '#compare' do
    it 'compares two selectors vs one' do
      expect(comparer.compare('body p', 'div')).to eq 'body p'
    end

    it 'compares class vs id' do
      expect(comparer.compare('.class', '#id')).to eq '#id'
      expect(comparer.compare('#id', '.class')).to eq '#id'
    end
  end
end
