#!/usr/bin/env ruby

total = 0

IO.read("6.input").split("\n\n").each_with_index { | line, index |
    unique_values = line.chars.uniq
    sum = unique_values.count - 1 # drop the newline
    total += sum
    p index.to_s + ": Unique characters in line " + line + ": " + unique_values.sort.join(",") + " (" + sum.to_s + ")"
}
p IO.read("6.input").split("\n\n").count.to_s

p "total: " + total.to_s