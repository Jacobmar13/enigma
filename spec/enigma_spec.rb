require 'simplecov'
SimpleCov.start
require 'rspec'
require 'enigma'
require 'character_set'

RSpec.describe Enigma do
  before :each do
    @enigma_1 = Enigma.new
    @enigma_2 = Enigma.new
  end
  it 'exists' do
    expect(@enigma_1).to be_a(Enigma)
  end
end