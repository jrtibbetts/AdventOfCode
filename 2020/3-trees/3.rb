#!/usr/bin/env ruby

@input_lines = IO.readlines("3.input")
@tree = '#'

def count_trees(col_increment, row_increment)
    tree_count = 0
    column = 0
    @input_lines.each_with_index { | line, index |
        if (index % row_increment) == 0
            line = line.chomp

            if line[column] == @tree
                tree_count += 1
            end

            # p index.to_s + ": " + (column > 0 ? line[0..(column - 1)] : "") + (line[column] == @tree ? "X" : "O") + line[(column + 1)..line.length] # + " #" + tree_count.to_s
            column = (column + col_increment) % line.length
            # p "Next column: " + column.to_s
        end
    }

    p "Trees encountered every " + row_increment.to_s + " rows & " + col_increment.to_s + " cols: " + tree_count.to_s
end

count_trees(1, 1)
count_trees(3, 1)
count_trees(5, 1)
count_trees(7, 1)
count_trees(1, 2)