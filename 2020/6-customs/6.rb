#!/usr/bin/env ruby

total = 0

IO.read("6.input").split("\n\n").each_with_index { | line, index |
    unique_values = line.split("\n").join.chars.uniq.sort
    sum = unique_values.count
    total += sum
    p index.to_s + ": Unique characters in line " + line + ": " + unique_values.join(",") + " (" + sum.to_s + ")"
}

p "total: " + total.to_s