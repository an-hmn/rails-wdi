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
end
