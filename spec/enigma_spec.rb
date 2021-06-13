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

  xit 'has an encrypt method' do
    expect(@enigma_1.encrypt("hello world", "02715", "040895")).to eq({
           encryption: "keder ohulw",
           key: "02715",
           date: "040895"
         })
  end
  it 'can provide a date with no date argument' do
    expect(@enigma_1.encrypt("hello world", "02715")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "130621"
    })
  end
end