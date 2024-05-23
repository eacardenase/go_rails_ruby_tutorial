# puts 2 + 2

# puts "hello\n" * 3

# Strings

# Numbers
puts 2.+(4)
puts 2.+ 4
puts 2 + 4

puts 3.>(8)
puts 3.> 8
puts 3 > 8

puts 4 <=> 7 # -1
puts 7 <=> 4 # 1
puts 7 <=> 7 # 0

a = []
5.times { |n| a.push(n)}
puts a
puts a[0..2]

15.times do |n|
  number = n + 1

  case number
  when 1
    count = "st"
  when 2
    count = "nd"
  when 3
    count = "rd"
  else
    count = "th"
  end

  puts "Hello world for the #{number.to_s + count} time"
end
