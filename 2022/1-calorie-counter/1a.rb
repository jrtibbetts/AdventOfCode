#!/usr/bin/env ruby

elves = Array.new

current_elf_calorie_count = 0

input_lines = IO.readlines("1.input")

input_lines.each { | line |
    p "Current calorie count: " + current_elf_calorie_count.to_s

    if line.strip.empty?
        if current_elf_calorie_count > 0
            elves.push current_elf_calorie_count
        end

        current_elf_calorie_count = 0
    else
        current_elf_calorie_count += line.strip.to_i 
    end
}

p elves.max
