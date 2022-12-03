#!/usr/bin/env ruby

shared_items = Array.new
shared_items_total_value = 0

p "A: " + ("A".ord - 38).to_s
p "a: " + ("a".ord - 96).to_s

input_lines = IO.readlines("./3.txt")
input_lines.each { | line |
    compartment_length = line.length / 2
    compartment_a = line[0 ... compartment_length].chars
    compartment_b = line[compartment_length ... line.length].chars
    shared_item = (compartment_a & compartment_b)[0]

    shared_item_value = shared_item.ord
    # p "Shared item raw value " + shared_item + " int " + shared_item.ord.to_s

    if shared_item_value > 96
        # lowercase letters are 1-26
        shared_item_value -= 96
    else
        # uppercase are 27-52
        shared_item_value -= 38
    end

    # p "Shared item: " + shared_item + " int " + shared_item_value.to_s

    shared_items_total_value += shared_item_value
}

p "Total value " + shared_items_total_value.to_s