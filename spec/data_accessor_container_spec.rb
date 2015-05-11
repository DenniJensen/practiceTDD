require 'spec_helper'
require './data_accessor_container'

describe DataAccessorContainer do
  let(:data_container) { DataAccessorContainer.new }

  it 'defines a method' do
    expect(data_container.respond_to? :foo).to be true
    expect(data_container.respond_to? :foo=).to be true
    expect(data_container.respond_to? :bullshit).to be false
  end

  it 'sets value to defined method' do
    data_container.foo = 10
    expect(data_container.foo).to be 10
  end
end
