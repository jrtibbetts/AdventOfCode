#!/usr/bin/env ruby

class Line
    @start
    @end

    def initialize string
        start_and_end_strings = string.split(" -> ")
        @start = start_and_end_strings[0].split(",").map { | x | x.to_i }
        @end = start_and_end_strings[1].split(",").map { | x | x.to_i }
    end

    def to_s
        @start.join(",") + " -> " + @end.join(",")
    end

    def is_horizontal?
        return @start[0] == @end[0]
    end

    def is_vertical?
        @start[1] == @end[1]
    end

    def is_horizontal_or_vertical?
        return is_horizontal? || is_vertical?
    end

    def horizontal_delta
        diff = @start[1] - @end[1]
        
        if diff == 0
            return 0
        elsif diff < 1
            return 1
        else
            return -1
        end
    end

    def vertical_delta
        diff = @start[0] - @end[0]

        if diff == 0
            return 0
        elsif diff < 1
            return 1
        else
            return -1
        end
    end
   
    def points
        points = Array.new
        diff = [(@start[0] - @end[0]).abs, (@start[1] - @end[1]).abs].max
        new_x = @start[0]
        new_y = @start[1]

        diff.times { | index |    
            if is_horizontal?
                new_x += horizontal_delta
            elsif is_vertical?
                new_y += vertical_delta
            end

            new_point = [new_x, new_y]
            points.push new_point
        }

        return points
    end
end

input_lines = IO.readlines("5.input").map { | line | line.strip }.select { | line | !line.empty?}
lines = Array.new
grid = Hash.new

input_lines.each { | line_string |
    line = Line.new line_string
    lines.push line
    
    if line.is_horizontal_or_vertical?
        line.points.each { | point |
            if !(grid.include? point)
                grid[point] = 1
            else
                grid[point] += 1
            end
        }
    end
}

p grid.select { | key, value | value > 1 }.count
