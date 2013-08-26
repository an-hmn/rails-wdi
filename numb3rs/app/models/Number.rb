class Number
  def self.bin2dec(binary)
    # binary.split('').each_with_index.map {|c, i| (c.to_i) * (2**i)}.reduce(:+)

    digits = binary.split ''
    digits.reverse!

    power = -1
    values = digits.map do |c|
      power = power + 1
      (c.to_i) * (2 ** power)
    end

    values.reduce :+
  end

  def self.dec2bin(decimal)
    values = []
    n = decimal.to_i
    power = Math.log(n, 2).floor # Use log to work out the "scale" of the number

    power.downto(0) do |i|
      quotient = n / 2 ** i
      if (quotient > 0) # i.e. did it divide? DOES IT BLEND?
        values.push('1')
        n = n - (2 ** i)
      else
        values.push('0') # if values.length > 0 # Ignore leading zeros.
      end
    end

    values.join
  end
end
