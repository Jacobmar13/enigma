require 'simplecov'
SimpleCov.start
require 'rspec'
require 'character_set'

RSpec.describe CharacterSet do
  it 'exists' do
    character_set = CharacterSet.new
    expect(character_set).to be_a(CharacterSet)
  end
end