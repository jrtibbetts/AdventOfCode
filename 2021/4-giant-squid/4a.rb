#!/usr/bin/env ruby

class Group

    @numbers
    @selected_numbers

    def initialize numbers
        @selected_numbers = Array.new
        @numbers = numbers
    end

    def pick number 
        if @numbers.include? number
            @selected_numbers.push number
        end
    end

    def is_complete?
        @numbers.each { | key, value |
            if !value
                true
            end

            false
        }
    end

    def to_s
        @numbers.map { | number |
            if @selected_numbers.include? number
                "*" + number.to_s + "*"
            else number.to_s
            end
        }.join(",")
    end

end

class Board

    @rows
    @columns

    def initialize row_values
        @rows = Array.new
        @columns = Array.new(5)
        rows_as_ints = Array.new

        # p "Row values ", row_values
        row_values.each { | row |
            numbers = row.split.map{ | element | element.to_i }
            rows_as_ints.push numbers
            @rows.push(Group.new numbers)
        }

        5.times { | index |
            values = rows_as_ints.map { | row | row[index] }
            group = Group.new values
            # p "Group: ", group.to_s
        }
    end

    def is_complete?
        if @rows.reduce(true) { | result, row | result = result && row.is_complete? }
            true
        elsif @columns.reduce(true) { | result, col | result = result && col.is_complete? }
            true
        end

        false
    end

    def pick number
        @rows.each { | row | row.pick number }
        @colums.each { | col | col.pick number }
    end

    def to_s
        @rows.map { | row | row.to_s }.join("\n")
    end

end

input_lines = IO.readlines("4.input").map { | line | line.strip } # .select { | line | !line.empty?}

bingo_numbers = input_lines.shift.split(",").map { | n | n.to_i }
p bingo_numbers

# skip the empty line
input_lines.shift
board_lines = Array.new
boards = Array.new

input_lines.each { | line |
    if !line.empty?
        board_lines.push line
    else
        board = Board.new board_lines
        boards.push board
        board_lines = Array.new
    end
}

p "Board count " + boards.count.to_s
boards.each { | board |
    board.to_s
}

# bingo_numbers.each { | number |
#     boards.each { | board |
#         board.pick number
#     }
# }