require 'simplecov'
SimpleCov.start
require 'rspec'
require 'key_generator'

RSpec.describe KeyGenerator do
  it 'exists' do
    key_generator = KeyGenerator.new
    expect(key_generator).to be_a(KeyGenerator)
  end
end