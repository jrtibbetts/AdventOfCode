#!/usr/bin/env ruby

input_lines = IO.readlines("2.input")
valid_passwords = 0

input_lines.each { | line |
    matches = /(\d*)-(\d*) (.): (.*)/.match(line)
    letter_count = matches[4].count(matches[3])

    if matches[1].to_i <= letter_count && letter_count <= matches[2].to_i
        valid_passwords += 1
        p "Valid: " + line
    else 
        p "Invalid (found " + letter_count.to_s + "): " + line
    end
}

p "Valid password count: " + valid_passwords.to_s