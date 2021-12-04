#!/usr/bin/env ruby

input_lines = IO.readlines("3.input").map { | line | line.strip }.select { | line | !line.empty?}
p input_lines[0..100]
line_count = input_lines.count
first_line = input_lines[0]

gamma_chars = Array.new(first_line.length)
epsilon_chars = Array.new(first_line.length)

first_line.length.times { | index |
    ones_at_index = input_lines.map { | s | s[index].to_i }.reduce(:+)

    if ones_at_index > (line_count / 2)
        gamma_chars[index] = 1
        epsilon_chars[index] = 0
    else
        gamma_chars[index] = 0
        epsilon_chars[index] = 1
    end

    p "Index ", index, " ones: ", ones_at_index
}

gamma_level = gamma_chars.join.to_i(2)
epsilon_level = epsilon_chars.join.to_i(2)
p "Gamma chars: ", gamma_level
p "Epsilon chars: ", epsilon_level
p "Product: ", (gamma_level * epsilon_level)