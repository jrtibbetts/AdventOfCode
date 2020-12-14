#!/usr/bin/env ruby

target_sum = 2020

input_lines = IO.readlines("1.input")
input_numbers = input_lines.map(&:to_i).sort

input_numbers.each { | first_number |
    difference = target_sum - first_number

    if input_numbers.include? difference
        p "The matching numbers are " + [first_number, difference].join(" & ")
        p first_number * difference
        break
    end
 }