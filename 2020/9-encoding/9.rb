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

@target_number

while index < input.count
    number = input[index]
    preceding_values = input[(index - window_count)...index]

    if !window_contains(preceding_values, number)
        @target_number = number
        p number.to_s + " isn't the sum of any two values in " + preceding_values.to_s
        break
    end

    index += 1
end

input.each_with_index { | number, index |
    if input[index] != @target_number
        # p "Starting a run with " + index.to_s + " (" + input[index].to_s + ")"
        run = []
        sum = 0

        input[index...input.length].each_with_index { | j, j_index |
            new_sum = sum + j

            if new_sum == @target_number
                run << j_index + index
                p run.to_s
                p "The sequence that adds up to " + @target_number.to_s + " is " + run.map { | x | input[x] }.to_s
                sorted_values = run.map { | x | input[x] }.sort
                p "The smallest and largest number in this sequence add up to " + (sorted_values.first + sorted_values.last).to_s
                return
            elsif new_sum < @target_number
                # p "    Appending " + j.to_s
                run << j_index + index
                sum = new_sum
            else
                break
            end
        }
    end
}