#!/usr/bin/env ruby

input_lines = IO.readlines("2.input")
horizontal_position = 0
depth = 0
aim = 0
depth_with_aim = 0

input_lines.each { | line |
    (direction, units) = line.split
    unitsInt = units.to_i

    if direction == "forward"
        horizontal_position += unitsInt
        depth_with_aim += unitsInt * aim
    elsif direction == "down"
        depth += unitsInt
        aim += unitsInt
    else
        depth -= unitsInt
        aim -= unitsInt
    end
}

p "Horizontal position: " + horizontal_position.to_s
p "Depth: ", depth
p "Depth with aim: " + depth_with_aim.to_s
p "Multiplied: " + (depth * horizontal_position).to_s
p "Multiplied with aim: " + (depth_with_aim * horizontal_position).to_s
