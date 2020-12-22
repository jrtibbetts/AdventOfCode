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

def number_of_bags_contained_by(bag_color)
    p "Finding number of bags contained by " + bag_color + ": "
    sub_bags = @bags[bag_color]

    if sub_bags == nil
        p "none"
        return 0
    else
        p sub_bags.count.to_s
        # p "Sub bags: " + sub_bags.to_s # .to_a.join(", ")
        return sub_bags.count + sub_bags.inject(0) { | sum, sub_bag | sum + number_of_bags_contained_by(sub_bag)}
    end
end

@bags_by_color = { }
@bags = { }

IO.readlines("7.input").each { | line |
    /(.*) bags contain (.*)./ =~ line
    
    bag_color = $1
    sub_bags = bags_contained_by_color($1, @bags_by_color)
    @bags[bag_color] = []

    $2.split(', ').each { | color_string |
        /\d+ (.*) bag.*/ =~ color_string
        if $& != nil
            @bags[bag_color] << $1

            sub_bag = bags_contained_by_color($1, @bags_by_color)
            sub_bags << sub_bag
        end
    }
}

gold_container_count = 0

@bags_by_color.each_value { | sub_bag |
    if sub_bag.flatten.include? "shiny gold"
        gold_container_count += 1
    end
}

p gold_container_count.to_s + " bags can contain shiny gold."
p "A shiny gold bag contains " + number_of_bags_contained_by("shiny gold").to_s
