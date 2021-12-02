#!/usr/bin/env ruby

input_lines = IO.readlines("1.input")
input_numbers = input_lines.map(&:to_i)
increases = 0
previousTotal = 0

(input_numbers.count - 2).times { | index |
    first = input_numbers[index]
    second = input_numbers[index + 1]
    third = input_numbers[index + 2]

    total = first + second + third
    print "Total of indices " + index.to_s + " (" + first.to_s + "), " + (index + 1).to_s + " (" + second.to_s + "), & " + (index + 2).to_s + " (" + third.to_s + ") = " + total.to_s

    if (total > previousTotal)
        p ""# " Increases? true"
        increases += 1
    else
        p " Increases? FALSE"
    end

    previousTotal = total
}

p "Increases: " + (increases - 1).to_s
