def factorial(n)
  product = 1
  for i in (1..n)
    product *= i
  end
  product
end

def factorial_recursive(n)
  if n == 1
    1
  else
    n * factorial_recursive(n - 1)
  end
end

for j in (1..20)
  puts "Iterative: #{j}: #{factorial(j)}"
  puts "Recursive: #{j}: #{factorial_recursive(j)}"
end
