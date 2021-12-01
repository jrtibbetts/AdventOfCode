#!/usr/bin/env ruby

input_lines = IO.readlines("1.input")
input_numbers = input_lines.map(&:to_i)
increases = 0
previousNumber = 0

input_numbers.drop(1).each { | number | 
    if number > previousNumber
        increases += 1
    end

    previousNumber = number
}

p "Increases: " + increases.to_s
