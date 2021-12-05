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
        return @numbers.sort == @selected_numbers.sort
    end
 
    def score
        return @numbers.reduce(:+) - @selected_numbers.reduce(:+)
    end

    def to_s
        "[" + 
        @numbers.map { | number |
            if @selected_numbers.include? number
                "*" + number.to_s + "*"
            else
                number.to_s
            end
        }.join(", ") +
        "]"
    end

end

class Board

    @rows
    @columns

    def initialize row_values
        @rows = Array.new
        @columns = Array.new
        rows_as_ints = Array.new

        row_values.each { | row |
            numbers = row.split.map{ | element | element.to_i }
            rows_as_ints.push numbers
            @rows.push(Group.new numbers)
        }

        5.times { | index |
            values = rows_as_ints.map { | row | row[index] }
            group = Group.new values
            @columns.push group
        }
    end

    def is_complete?
        @rows.each { | row |
            if row.is_complete?
                return true
            end
        }

        @columns.each { | col |
            if col.is_complete?
                return true
            end
        }

        return false
    end

    def pick number
        @rows.each { | row | row.pick number }
        @columns.each { | col | col.pick number }
    end

    def score(last_number)
        # Add up all of the unselected numbers
        rows_score = @rows.reduce(0) { | sum, row | sum += row.score }
        return rows_score * last_number
    end

    def to_s
        @rows.map { | row | row.to_s }.join
    end

end

input_lines = IO.readlines("4.input").map { | line | line.strip } # .select { | line | !line.empty?}

bingo_numbers = input_lines.shift.split(",").map { | n | n.to_i }
p bingo_numbers.count

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

bingo_numbers.each { | number |
    p "Selected " + number.to_s
    boards.each { | board |
        board.pick number

        if board.is_complete?
            p "Completed board"
            p board.to_s
            p "Board score: " + board.score(number).to_s
            exit
        end
    }
}

# p "Board count " + boards.count.to_s
# boards.each { | board |
#     p board.to_s
# }
