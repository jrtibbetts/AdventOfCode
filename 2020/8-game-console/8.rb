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
        instruction = @input_
    program[@instruction_index]
        p "Duplicate instruction: " + instruction

        case instruction
        when /jmp/
            @input_
        program[@instruction_index] = instruction.gsub(/jmp/, "nop")
        when /nop/
            @input_
        program[@instruction_index] = instruction.gsub(/nop/, "jmp")
        end

        p "Replaced with: " + @input_
    program[@instruction_index]
    end

    true
end

def run(program)
    @accumulator = 0
    @instruction_index = 0
    @executed_lines = Set[]

    while !@executed_lines.include? @instruction_index
        if @instruction_index >= program.count
            p "Program terminated successfully! Accumulator is " + @accumulator.to_s
            return true
        end

        # p @instruction_index.to_s + ": " + @program[@instruction_index]
        @executed_lines << @instruction_index

        case program[@instruction_index]
        when /acc ([+-]\d+)/
            accumulate($1.to_i)
        when /jmp ([+-]\d+)/
            jump($1.to_i)
        when /nop/
            do_nothing
        end
    end

    p "Accumulator is " + @accumulator.to_s + " before looping."
    return false
end

# Task 1
run(@program)

# Task 2
p "Task 2"

jmp_and_nop_indices = []

@program.each_with_index { | line, index |
    if line =~ /jmp/ || line =~ /nop/
        jmp_and_nop_indices << index
    end
}

# p "Indices: " + jmp_and_nop_indices.join(", ")
while !jmp_and_nop_indices.empty?
    index = jmp_and_nop_indices.shift
    program_clone = @program.clone(freeze: false)

    line = program_clone[index]

    case line
    when /jmp/
        program_clone[index] = line.gsub(/jmp/, "nop")
    when /nop/
        program_clone[index] = line.gsub(/nop/, "jmp")
    end

    p "Replacing " + line + " with " + program_clone[index]
    if run(program_clone)
        p "Final accumulator value: " + @accumulator.to_s
        break
    end
end
