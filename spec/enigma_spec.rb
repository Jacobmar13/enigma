require 'simplecov'
SimpleCov.start
require 'rspec'
require 'enigma'
require 'character_set'
require 'encryption'
require 'decryption'

RSpec.describe Enigma do
  before :each do
    @enigma_1 = Enigma.new
  end

  it 'exists' do
    expect(@enigma_1).to be_a(Enigma)
  end

  it 'has an encrypt method' do
    expect(@enigma_1.encrypt("hello world", "02715", "040895")).to eq({
           encryption: "keder ohulw",
           key: "02715",
           date: "040895"
         })
  end

  it 'has a decrypt method' do
    expect(@enigma_1.decrypt("keder ohulw", "02715", "040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end

  it 'can provide a date with no date argument' do
    encrypted = @enigma_1.encrypt("hello world", "02715")
    expect(encrypted[:date]).to eq(Time.now.strftime("%d%m%y"))
    expect(encrypted[:key].length).to eq(5)
    expect(encrypted[:encryption]).to be_a_kind_of(String)
  end

  it 'can provide a random five digit number and date with no key or date argument' do
    encrypted = @enigma_1.encrypt("hello world")
    expect(encrypted[:key].length).to eq(5)
    expect(encrypted[:date]).to eq(Time.now.strftime("%d%m%y"))
    expect(encrypted[:encryption]).to be_a_kind_of(String)
  end
end