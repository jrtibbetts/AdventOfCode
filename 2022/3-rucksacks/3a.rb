#!/usr/bin/env ruby

def shared_item_value(shared_item)
    if shared_item == nil 
        p "FATAL ERROR: the shared item is nil"
    end

    uppercase_letter_adjustment = 38
    lowercase_letter_adjustment = 96
    shared_item_value = shared_item.ord

    if shared_item_value > lowercase_letter_adjustment
        # lowercase letters are 1-26
        shared_item_value -= lowercase_letter_adjustment
    else
        # uppercase are 27-52
        shared_item_value -= uppercase_letter_adjustment
    end

    return shared_item_value
end

def group_shared_value(group)
    if group.length != 3
        p "FATAL ERROR: the only items in the group are " + group.to_s
    end

    shared_item = (group[0].chars & group[1].chars & group[2].chars)[0]
    p "Shared item in the group " + shared_item

    return shared_item_value(shared_item)
end

shared_items = Array.new
part_a_shared_items_total_value = 0
part_b_shared_items_total_value = 0

p "A: " + shared_item_value("A").to_s
p "a: " + shared_item_value("a").to_s

group = Array.new

input_lines = IO.readlines("./3.txt")
input_lines.each { | line |
    line = line.chomp

    # does it go in the group?
    if group.count < 3
        p "Appending line " + line
        group.append(line)
    else
        p "Calculating the item that all 3 have in common"
        part_b_shared_items_total_value += group_shared_value(group)
        group = Array.new
    end

    compartment_length = line.length / 2
    compartment_a = line[0 ... compartment_length].chars
    compartment_b = line[compartment_length ... line.length].chars
    shared_item = (compartment_a & compartment_b)[0]

    shared_item_value = shared_item_value(shared_item)
    part_a_shared_items_total_value += shared_item_value
}

p "Part A: total value " + part_a_shared_items_total_value.to_s