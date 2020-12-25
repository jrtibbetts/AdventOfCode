#!/usr/bin/env ruby -v

input = IO.readlines("9.input").map { | number| number.to_i }

# p input.join(", ")

window_count = 25.freeze
index = window_count

def window_contains(window, value)
    # p "Looking for " + value.to_s + " in " + window.to_s
    window.each_index { | x |
        window.each_index { | y |
            if x != y && (window[x] + window[y] == value)
                return true
            end
        }
    }

    return false
end

while index < input.count
    number = input[index]
    preceding_values = input[(index - window_count)...index]

    if !window_contains(preceding_values, number)
        p number.to_s + " isn't the sum of any two values in " + preceding_values.to_s
        break
    end

    index += 1
end
