#!/usr/bin/env ruby -v

seating_chart = IO.readlines("11.input").map { | line | line.chars }

seating_chart[1..3].each { | line | 
    p line.join("_")
}

seat = 'L'.freeze
open_space = '.'.freeze
occupied = '#'.freeze

def pad_table(table)
    table_width = table[0].count

    # Add an empty space before the beginning and after the end
    table.each_with_index { | row, index |
        table[index] = (row.shift('.').push('.'))
    }

    table = table.shift(Array.new(table_width + 2, '.')
    table = table.push(Array.new(table_width + 2, '.'))
end

def has_occupied_neighbors(table, row_index, col_index)
    table[(row - 1)..(row + 1)].each_with_index { | row,  }
end

while true
    transformed_seating_chart = []

    seating_chart[1...(seating_chart.count - 1)].each_with_index { | line, line_index |
        transformed_seating_chart << []

        line[1...(line.count - 1)].each_with_index { | c, char_index |
            # Step 1
            case c
            when seat
                
            when occupied
                
            end
        }
    }
end