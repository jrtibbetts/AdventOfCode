#!/usr/bin/env ruby

input_lines = IO.readlines("3.input").map { | line | line.strip }.select { | line | !line.empty?}
line_count = input_lines.count
first_line = input_lines[0]
first_line_length = first_line.length

gamma_chars = Array.new(first_line_length)
epsilon_chars = Array.new(first_line_length)
oxygen_generator_ratings = input_lines.clone

first_line_length.times { | index |
    ones_at_index = input_lines.map { | s | s[index].to_i }.reduce(:+)
    more_ones_than_zeroes = ones_at_index > (line_count / 2)

    gamma_chars[index] = (more_ones_than_zeroes ? 1 : 0)
    epsilon_chars[index] = (more_ones_than_zeroes ? 0 : 1)
 
    if oxygen_generator_ratings.count > 1
        oxygen_generator_ratings = oxygen_generator_ratings.select { | line | line[index].to_i == (more_ones_than_zeroes ? 1 : 0) }
        p oxygen_generator_ratings.count
    end

    # p "Index ", index, " ones: ", ones_at_index
    p oxygen_generator_ratings.count
}

# convert chars into a string, then convert the binary value into a decimal
gamma_level = gamma_chars.join.to_i(2)
epsilon_level = epsilon_chars.join.to_i(2)
p "Gamma chars: ", gamma_level
p "Epsilon chars: ", epsilon_level
p "Product: ", (gamma_level * epsilon_level)
p "Oxygen generator rating: ", oxygen_generator_ratings[0].to_i(2)