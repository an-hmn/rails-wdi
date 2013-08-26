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

  def self.bin2hex(binary)
    hexes = []
    binary = binary.split ''

    # We're dealing with groups of 4, so we pad with 0s to ensure all our groups of 4 are "full"
    if (binary.count % 4) != 0
      missing = 4 - (binary.count % 4)
      missing.times {binary.unshift('0')}
    end

    # Process 4 "bits" at a time.
    (binary.count / 4).times do
      quad = binary.pop(4).join

      hexes.unshift case quad
        when '0000' then '0'
        when '0001' then '1'
        when '0010' then '2'
        when '0011' then '3'
        when '0100' then '4'
        when '0101' then '5'
        when '0110' then '6'
        when '0111' then '7'
        when '1000' then '8'
        when '1001' then '9'
        when '1010' then 'a'
        when '1011' then 'b'
        when '1100' then 'c'
        when '1101' then 'd'
        when '1110' then 'e'
        when '1111' then 'f'
      end
    end
    hexes.join
  end
end
