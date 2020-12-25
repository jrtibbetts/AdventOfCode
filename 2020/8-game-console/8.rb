#!/usr/bin/env ruby -v

require 'Set'

@executed_lines = Set[]
@accumulator = 0
@instruction_index = 0

@program = IO.readlines("8.input")
@program.freeze

def accumulate(amount)
    # p "Adding " + $1
    @accumulator += amount
    @instruction_index += 1
end

def jump(to_index)
    @instruction_index += to_index
    # p "Jumping to " + @instruction_index.to_s
end

def do_nothing
    # p "Doing nothing"
    @instruction_index += 1
end

def can_execute_task_1
    !@executed_lines.include? @instruction_index
end

def can_execute_task_2
    if @executed_lines.include? @instruction_index
        instruction = @program[@instruction_index]
        p "Duplicate instruction: " + instruction

        case instruction
        when /jmp/
            @program[@instruction_index] = instruction.gsub(/jmp/, "nop")
        when /nop/
            @program[@instruction_index] = instruction.gsub(/nop/, "jmp")
        end

        p "Replaced with: " + @program[@instruction_index]
    end

    true
end

def run_program(can_execute)
    while self.send(can_execute)
        if @instruction_index >= @program.count
            p "Program terminated successfully! Accumulator is " + @accumulator.to_s
            break
        end

        # p @instruction_index.to_s + ": " + @program[@instruction_index]
        @executed_lines << @instruction_index

        case @program[@instruction_index]
        when /acc ([+-]\d+)/
            accumulate($1.to_i)
        when /jmp ([+-]\d+)/
            jump($1.to_i)
        when /nop/
            do_nothing
        end
    end

    p "Accumulator is " + @accumulator.to_s + " before looping."
end

# Task 1
run_program(:can_execute_task_1)

# Task 2
run_program(:can_execute_task_2)
