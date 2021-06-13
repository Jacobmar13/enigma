class Enigma

  def initialize
  end

  def encrypt(message, key, date = Time.now.strftime("%d%m%y"))
    encryption = Hash.new
    encryption[:encryption] = message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
end