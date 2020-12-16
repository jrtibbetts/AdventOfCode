#!/usr/bin/env ruby

valid_passport_count = 0

IO.read("4.input").split("\n\n").each { | line |
    colon_count = line.count(':')

    if colon_count == 8 || (colon_count == 7 && !line.include?("cid:"))
        valid_passport_count += 1
    end
}

p "Valid passport count: " + valid_passport_count.to_s
