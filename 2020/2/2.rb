#!/usr/bin/env ruby

target_sum = 2020

input_lines = IO.readlines("../1/1.input")
input_numbers = input_lines.map(&:to_i).sort

input_numbers.each_with_index { | first_number, first_index |
    input_numbers.slice(first_index, input_numbers.length).each { | second_number |
        difference = target_sum - (first_number + second_number)

        if difference < 0
            break
        end

        # p "Comparing " + [first_number, second_number, difference].join(" & ")

        if input_numbers.include? difference
            p "The matching numbers are " + [first_number, second_number, difference].join(" & ")
            p first_number * second_number * difference
            break
            quit
        end
    }
 }