#!/usr/bin/env ruby

require 'Set'

def bags_contained_by_color(color, bags)
    contained_bags = bags[color]

    if contained_bags == nil
        contained_bags = [color] # Set[color]
        bags[color] = contained_bags
     end

    return contained_bags
end

bags_by_color = { }

IO.readlines("7.input").each { | line |
    /(.*) bags contain (.*)./ =~ line
    
    bag_color = $1
    sub_bags = bags_contained_by_color($1, bags_by_color)

    $2.split(', ').each { | color_string |
        /\d+ (.*) bag.*/ =~ color_string

        if $& != nil
            sub_bag = bags_contained_by_color($1, bags_by_color)
            sub_bags << sub_bag
        end
    }
}

gold_container_count = 0

bags_by_color.each_value { | sub_bag |
    if sub_bag.flatten.include? "shiny gold"
        gold_container_count += 1
    end
}

p gold_container_count.to_s + " bags can contain shiny gold."

