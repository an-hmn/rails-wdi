def countdown(num)
  while num > 0
    puts num
    num = num - 1
  end

  puts "Blastoff"
end

def countdown_recursive(num)
  if num > 0
    puts num
    countdown_recursive(num - 1)
  else
    puts "Blastoff"
  end
end

countdown_recursive(10)

