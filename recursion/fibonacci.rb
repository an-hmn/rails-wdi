def fib(n)
  if n < 2
    n
  else
    num1, num2 = 0, 1
    while n > 1 #since the 0 and 1 steps were already done for the n<2 case
      n -= 1
      num2 = num1 + num1 = num2 #as in: num2 = old_num1 + (num1 = old_num2, returns old_num2)
    end
    num2
  end
end

def fib_recursive(n)
  if n < 2
    n
  else
    fib_recursive(n - 1) + fib_recursive(n - 2)
  end
end

for j in (1..20)
  puts fib(j)
  puts fib_recursive(j)
end
