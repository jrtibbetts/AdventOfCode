#!/usr/bin/env ruby

input_lines = IO.readlines("6.input").map { | line | line.strip }.select { | line | !line.empty?}
lanternfish_ages = input_lines.first.split(",").map { | x | x.to_i }
p "Initial ages: " + lanternfish_ages.to_s 

80.times { | index |
    p "Day " + index.to_s + ": " + lanternfish_ages.length.to_s
    baby_fish = []
    lanternfish_ages = lanternfish_ages.map { | x |
        new_x = x - 1

        if x == 0
            new_x = 6
            baby_fish.push(8)
        end

        new_x
    }

    lanternfish_ages += baby_fish
    p "Ages: " + lanternfish_ages.join(",")
}

p "There are now " + lanternfish_ages.count.to_s + " lanternfish"
