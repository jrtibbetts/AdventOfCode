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

    def is_horizontal_or_vertical?
        return @start[0] == @end[0] || @start[1] == @end[1]
    end

    def horizontal_delta
        diff = @start[0] - @end[0]
        
        if diff == 0
            return 0
        elsif diff < 1
            return 1
        else
            return -1
        end
    end

    def vertical_delta
        diff = @start[1] - @end[1]

        if diff == 0
            return 0
        elsif diff < 1
            return 1
        else
            return 1
        end
    end
   
    def points
        p "Start: " + @start.to_s
        p "End: " + @end.to_s
        points = Array.new
        diff = (@start[0] - @end[0])
        
        diff.times { | index |
            new_point = [(@start[0] + horizontal_delta), (@start[1] + vertical_delta)]
            points.push new_point
        }

        return points
    end
end

input_lines = IO.readlines("5.input").map { | line | line.strip }.select { | line | !line.empty?}
lines = Array.new
input_lines.each { | line_string |
    line = Line.new line_string
    lines.push line
    
    if line.is_horizontal_or_vertical?
        p "Points: " + line.points.to_s
    end

    # p "Line " + line.to_s + "; vertical or horizontal? " + line.is_horizontal_or_vertical?.to_s
}
