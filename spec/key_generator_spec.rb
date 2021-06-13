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

  xit 'can make sure that the generate_key pads correctly' do
    key_generator_1 = KeyGenerator.new
    key_generator_2 = KeyGenerator.new

    allow(key_generator_1).to receive(:seed) {77777}
    allow(key_generator_2).to receive(:seed) {42}

    expect(key_generator_1.seed).to eq(77777)
    expect(key_generator_2.seed).to eq(42)

    key_generator_1.generate_key
    key_generator_2.generate_key

    expect(key_generator_1.key).to eq("77777")
    expect(key_generator_2.key).to eq("00042")    
  end
end