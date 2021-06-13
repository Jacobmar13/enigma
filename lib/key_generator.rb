class KeyGenerator
  attr_reader :seed, :key

  def initialize
    @seed = generate_seed
    @key = generate_key
  end

  def generate_key
    @seed.to_s.rjust(5, "0")
  end

  def generate_seed
    rand(0..99999)
  end
end