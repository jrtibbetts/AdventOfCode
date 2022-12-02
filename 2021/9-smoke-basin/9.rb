#!/usr/bin/env ruby

input_lines = IO.readlines("9.input")
line_length = input_lines.first.chars.count
grid = Array.new[line_length + 2][line_length + 2]
p grid

(line_length + 2).times { | i |
    grid[0][i] = 100
}

input_lines.enumerated { | index, line |
    grid[index + 1][0] = 100
    line.chars.enumerated { | char_index, char | }
    grid[index + 1][char_index + 1] = char
    grid[index, (line_length + 2) -1] = 100
}

(line_length + 2).each { | i |
    grid[(line_length + 2) - 1][i] = 100
}

