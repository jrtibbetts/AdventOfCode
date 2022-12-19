#!/usr/bin/env ruby

completely_contains_count = 0
overlaps_count = 0

input_lines = IO.readlines("./4.txt")
input_lines.each { | line |
    pairs = line.split(",")
    first_section = pairs[0].split("-").map { | x | x.to_i }
    second_section = pairs[1].split("-").map { | x | x.to_i }

    p "First section " + first_section.to_s
    p "Second section " + second_section.to_s

    if (first_section[0] <= second_section[0] && first_section[1] >= second_section[1])
        completely_contains_count += 1
        p "The first section contains the second section"
    elsif (first_section[0] >= second_section[0] && first_section[1] <= second_section[1])
        completely_contains_count += 1
        p "The second section contains the first section"
    else
        p "Neither one contains the other"
    end

    p ""    
}

p "Contains count " + completely_contains_count.to_s