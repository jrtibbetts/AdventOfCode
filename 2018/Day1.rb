sum = 0

File.open("Day1.input").each_line { | line |
    puts line
    sum += line.to_i
}

puts sum
