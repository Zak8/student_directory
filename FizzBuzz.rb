counter = 0
while counter < 20
  counter += 1
  if counter % 3 === 0 and counter % 5 ==== 0
    puts "FizzBuzz"
  elsif counter % 3 === 0
    puts "Fizz"
  elsif counter % 5 === 0
    puts "Buzz"
  end
end