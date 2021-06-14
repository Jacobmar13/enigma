require 'simplecov'
SimpleCov.start
require 'rspec'
require 'key_generator'

RSpec.describe KeyGenerator do
  it 'exists' do
    key_generator = KeyGenerator.new
    expect(key_generator).to be_a(KeyGenerator)
  end

  it 'has a starter digit seed method' do
    key_generator = KeyGenerator.new
    expect(key_generator.generate_seed).to be_a_kind_of(Integer)
  end

  it 'can generate a random five digit key' do
    key_generator = KeyGenerator.new
    key_generator.generate_key
    expect(key_generator.key.length).to eq(5)
  end
end