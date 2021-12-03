#!/usr/bin/env ruby

input_lines = IO.readlines("2.input")
horizontal_position = 0
depth = 0

input_lines.each { | line |
    (direction, units) = line.split

    if direction == "forward"
        horizontal_position += units.to_i 
    elsif direction == "down"
        depth += units.to_i
    else
        depth -= units.to_i
    end
}

p "Horizontal position: " + horizontal_position.to_s
p "Depth: " + depth.to_s
p "Multiplied: " + (depth * horizontal_position).to_s
