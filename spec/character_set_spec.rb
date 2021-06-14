require 'simplecov'
SimpleCov.start
require 'rspec'
require 'character_set'

RSpec.describe CharacterSet do
  it 'exists' do
    character_set = CharacterSet.new
    expect(character_set).to be_a(CharacterSet)
  end

  it 'has a character set' do
    character_set = CharacterSet.new
    expect(character_set.set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end
end