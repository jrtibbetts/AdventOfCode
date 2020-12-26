#!/usr/bin/env ruby -v

single_jolt_differences = Array.new
triple_jolt_differences = Array.new

input = IO.readlines("10.input").map { | x | x.to_i }.sort
input = input.unshift(0)
input = input.push(input.last + 3)

input.each_with_index { | jolts, index |
    if index < (input.count - 1)
        if input[index + 1] - jolts == 1
            single_jolt_differences << jolts
        else
            triple_jolt_differences << jolts
        end
    end
}

p "Single-jolt differences times triple-jolt differences: " + (single_jolt_differences.count * triple_jolt_differences.count).to_s