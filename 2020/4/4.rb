#!/usr/bin/env ruby

valid_passport_count = 0
rejected_passport_count = 0
total_passport_count = 0
required_fields = [/byr:/, /iyr:/, /eyr:/, /hgt:/, /hcl:/, /ecl:/, /pid:/]
current_passport = ""

IO.readlines("4.input").each { | line |
    if !line.strip.empty?
        current_passport += (line.chomp + " ")
    else
        # p current_passport

        complete_fields_count = required_fields.inject(0) { | count, pattern |
            pattern.match?(current_passport) ? count += 1 : count
        }

        # p "Complete fields: " + complete_fields_count.to_s
        if complete_fields_count == required_fields.count
            valid_passport_count += 1
            # p "Valid passport count is now " + valid_passport_count.to_s
        else
            rejected_passport_count += 1
            p "Rejected " + current_passport + ": only " + complete_fields_count.to_s + " fields"
        end

        current_passport = ""
        total_passport_count += 1
    end
}

p "Valid passport count: " + valid_passport_count.to_s
p "Rejected passport count: " + rejected_passport_count.to_s
p "Total passport count: " + total_passport_count.to_s
