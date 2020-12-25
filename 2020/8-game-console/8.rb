#!/usr/bin/env ruby -v

require 'Set'

@executed_lines = Set[]
@accumulator = 0
@instruction_index = 0

@program = IO.readlines("8.input")
@program.freeze

def run_program
    while !@executed_lines.include? @instruction_index
        if @instruction_index >= @program.count
            p "Program terminated successfully! Accumulator is " + @accumulator.to_s
            break
        end

        p @instruction_index.to_s + ": " + @program[@instruction_index]
        @executed_lines << @instruction_index

        case @program[@instruction_index]
        when /acc ([+-]\d+)/
            # p "Adding " + $1
            @accumulator += $1.to_i
            @instruction_index += 1
        when /jmp ([+-]\d+)/
            @instruction_index += $1.to_i
            # p "Jumping to " + @instruction_index.to_s
        when /nop/
            # p "Doing nothing"
            @instruction_index += 1
        end
    end

    p "Accumulator is " + @accumulator.to_s + " before looping."
end

# Task 1
run_program

# Task 2
jmp_nop_indices = @program.each_with_index.filter_map { | line, index |
    if /jmp/ =~ line || /nop/ =~ line
        return 
    end
}


