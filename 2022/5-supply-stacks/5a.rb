#!/usr/bin/env ruby

stacks = [
    "",
    "STHFWR",
    "SGDQW",
    "BTW",
    "DRWTNQZJ",
    "FBHGLVTZ",
    "LPTCVBSG",
    "ZBRTWGP",
    "NGMTCJR",
    "LGBW"
]

input_lines = IO.readlines("./5.txt")[0..20]
input_lines.each { | line |
    if /move (?<count_s>\d*) from (?<dest_index_s>\d*) to (?<source_index_s>\d*)/ =~ line
        count = count_s.to_i
        sourceIndex = source_index_s.to_i
        destIndex = dest_index_s.to_i

        source = stacks[sourceIndex].reverse
        dest = stacks[destIndex]

        puts "Move #{count} from source: #{source.reverse}, destination: #{dest}"
        items_to_be_moved = (count < source.length ? source[0...count] : source)
        puts "Moving #{items_to_be_moved}"
        stacks[sourceIndex] = source[0...(source.length - count)]

        stacks[destIndex] = dest += items_to_be_moved
        puts "After move: source: #{stacks[sourceIndex]}, destination: #{stacks[destIndex]}"
    end
}

puts "Stacks: #{stacks}"
puts "Top elements: #{stacks.map { $0[-1] }}"