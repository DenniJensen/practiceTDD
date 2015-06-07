require 'spec_helper'
require 'css_comparer'

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

    context 'without whitespaces between selector' do
      it 'compares selector and class vs class' do
        expect(comparer.compare('div.class', '.class')).to eq 'div.class'
        expect(comparer.compare('.class', 'div.class')).to eq 'div.class'
      end

      it 'compares div#id vs div.class' do
        expect(comparer.compare('div.class', 'div#id')).to eq 'div#id'
        expect(comparer.compare('div#id', 'div.class')).to eq 'div#id'
      end


    end
  end
end
