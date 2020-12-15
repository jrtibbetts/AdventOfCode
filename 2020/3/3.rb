#!/usr/bin/env ruby

input_lines = IO.readlines("3.input")
tree = '#'
tree_count = 0
column = 0

input_lines.each_with_index { | line, index |
    line = line.chomp
  
    if line[column] == tree
        tree_count += 1
    end

    p index.to_s + ": " + (column > 0 ? line[0..(column - 1)] : "") + (line[column] == tree ? "X" : "O") + line[(column + 1)..line.length] # + " #" + tree_count.to_s
    column = (column + 3) % line.length
    p "Next column: " + column.to_s
}

p "Trees encountered: " + tree_count.to_s
