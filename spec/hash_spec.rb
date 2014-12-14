require 'spec_helper'
require_relative '../lib/hash'

describe Hash do
  let(:default) { 'default' }
  let(:h) { {color: 'green', name: 'Tom', file: { type: 'text' }} }

  describe '#get_settings' do
    context 'no setting found' do
      it 'returns the default if no settings there' do
        expect(h.get_settings(default)).to eq(default)
        expect(h.get_settings(default, :nothing)).to eq(default)
        expect(h.get_settings(default, :name, :nothing)).to eq(default)
      end
    end

    context 'settings found' do
      it 'returns the value of the given settings' do
        expect(h.get_settings(default, :color)).to eq('green')
        expect(h.get_settings(default, :name)).to eq('Tom')
        expect(h.get_settings(default, :name)).to eq('Tom')
        expect(h.get_settings(default, :file, :type)).to eq('text')
      end
    end
  end
end
