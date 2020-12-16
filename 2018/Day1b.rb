require 'Set'

unique_frequencies = Set.new
sum = 0
round = 1

# while true do
  puts "**STARTING ROUND #{round}**"
  puts "Uniques: #{unique_frequencies.length}"

  File.open("Day1.input").each_line { | line |
    sum += line.strip.to_i
    puts line
    puts "  #{line.to_i}: #{sum}"
    
#    if unique_frequencies.add?(sum) != nil then
#      break
#    end
  }

  round += 1
# end

# puts sum
