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

# Task 2: Find all possible permutations

def all_permutations(array)
    p "All permutations for array " + array.length.to_s 
    
    if array.length < 1
        return array.length
    else
        first_value = array.shift
        next_values = array.drop(1).select { | x | (x - first_value) <= 3 }
        
        return next_values.inject(next_values.length) { | sum, values | sum + all_permutations(values) }
    end
end

p "All possible permutations: " + all_permutations(input)