#!/usr/bin/env ruby
require 'Set'

total_unique_answers = 0
total_shared_answers = 0

IO.read("6.input").split("\n\n").each_with_index { | line, index |
    unique_values = line.split("\n").join.chars.uniq.sort
    total_unique_answers += unique_values.count
    p index.to_s + ": Unique characters in line " + line + ": " + unique_values.join(",") + " (" + unique_values.count.to_s + ")"

    shared_values = Set[]

    line.split("\n").each_with_index { | line, index |
        charset = Set.new(line.chars)

        if index == 0
            shared_values = charset
        else
            shared_values &= charset
        end
    }

    p "Shared characters:" + shared_values.count.to_s
    total_shared_answers += shared_values.count
}

p "Unique answers total: " + total_unique_answers.to_s
p "Shared answers total: " + total_shared_answers.to_s