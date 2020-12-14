#!/usr/bin/env ruby

input_lines = IO.readlines("2.input")
rule_1_valid_passwords = 0
rule_2_valid_passwords = 0

def rule_1_valid?(matches)
    letter_count = matches[4].count(matches[3])

    return matches[1].to_i <= letter_count && letter_count <= matches[2].to_i
end

def rule_2_valid?(matches)
    first_index = matches[1].to_i - 1
    second_index = matches[2].to_i - 1
    password = matches[4]
    letter = matches[3]
    first_matches = (password[first_index] == letter)
    second_matches = (password[second_index] == letter)

    p "First matches? " + first_matches.to_s
    p "Second matches? " + second_matches.to_s
    return (first_matches || second_matches) && !(first_matches && second_matches)
end

input_lines.each { | line |
    matches = /(\d*)-(\d*) (.): (.*)/.match(line)
    
    if rule_1_valid?(matches)
        p "Rule 1 Valid: " + line
        rule_1_valid_passwords += 1
    else 
        p "Rule 1 Invalid: " + line
    end

    if rule_2_valid?(matches)
        p "Rule 2 Valid: " + line
        rule_2_valid_passwords += 1
    else
        p "Rule 2 Invalid: " + line
    end
}

p "Rule 1 valid password count: " + rule_1_valid_passwords.to_s
p "Rule 2 valid password count: " + rule_2_valid_passwords.to_s
