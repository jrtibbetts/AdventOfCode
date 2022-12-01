#!/usr/bin/env ruby

    elves = Array.new

    current_elf_calorie_count = 0

    input_lines = IO.readlines("1.input")

    input_lines.each { | line |
        stripped_line = line.strip

        if stripped_line.empty?
            if current_elf_calorie_count > 0
                elves.push current_elf_calorie_count
            end

            current_elf_calorie_count = 0
        else
            current_elf_calorie_count += stripped_line.to_i 
        end
    }

    if current_elf_calorie_count > 0
        elves.push current_elf_calorie_count
    end

    puts "All calorie counts, sorted: " + elves.to_s
    puts "Highest calorie count: " + elves.max.to_s

    sorted_calorie_counts = elves.sort.reverse
    puts "All calorie counts, sorted: " + sorted_calorie_counts.to_s
    three_highest_counts = sorted_calorie_counts[0 ... 3]
    puts "Three highest calorie counts: " + three_highest_counts.to_s
    puts "Highest three calorie count total: " + three_highest_counts.sum.to_s
