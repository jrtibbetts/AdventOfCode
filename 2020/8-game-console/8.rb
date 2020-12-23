#!/usr/bin/env ruby -v

require 'Set'

executed_lines = Set[]
accumulator = 0
instruction_index = 0

program = IO.readlines("8.input")

while !executed_lines.include? instruction_index
    p instruction_index.to_s + ": " + program[instruction_index]
    executed_lines << instruction_index

    case program[instruction_index]
    when /acc ([+-]\d+)/
        p "Adding " + $1
        accumulator += $1.to_i
        instruction_index += 1
    when /jmp ([+-]\d+)/
        instruction_index += $1.to_i
        p "Jumping to " + instruction_index.to_s
    when /nop/
        p "Doing nothing"
        instruction_index += 1
    end
end

p "Accumulator is " + accumulator.to_s + " before looping."