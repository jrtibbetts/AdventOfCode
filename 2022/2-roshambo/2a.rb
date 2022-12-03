#!/usr/bin/env ruby

part_one_score = 0
part_two_score = 0

playerAChoices = { "A" => 1, "B" => 2, "C" => 3 }
playerBChoices = { "X" => 1, "Y" => 2, "Z" => 3 }

input_lines = IO.readlines("./2.txt")
# p input_lines
# p "Player A choices " + playerAChoices.to_s
# p "Player B choices " + playerBChoices.to_s
index = 0

def score(playerAChoice, playerBChoice) 
    if playerAChoice == playerBChoice
        p "It's a tie"
        return playerBChoice + 3
    elsif (playerBChoice - playerAChoice) == 1 || (playerBChoice - playerAChoice) == -2
        p "Player B wins"
        return playerBChoice + 6
    else
        p "Player A wins"
        return playerBChoice
    end
end

input_lines.each { | line | 
    choices = line.split(" ")
    # p "Choices " + index.to_s + " " + choices.to_s
    # index += 1

    playerA = choices[0]
    playerAChoice = playerAChoices[playerA]
    # p "Player A: " + playerA + " " + playerAChoice.to_s
    playerB = choices[1]
    playerBChoice = playerBChoices[playerB]
    playerBStrategy = playerBChoice
    # p "Player B: " + playerB + " " + playerBChoice.to_s

    # Calculate part 1
    part_one_score += score(playerAChoice, playerBChoice)

    # Calculate part 2
    if playerBStrategy == 0 
        p "Player B needs to lose"
        if playerAChoice == 0
            playerBChoice = 2
        else
            playerBChoice = playerAChoice - 1
        end
    elsif playerBStrategy == 1
        p "There needs to be a draw"
    else
        p "Player A needs to win"
        if playerAChoice == 2
            playerBChoice = 0
        else
            playerBChoice = playerAChoice + 1
        end
    end

    p "Player A chose"
    part_two_score += score(playerAChoice, playerBChoice)

    p ""
}

p part_one_score
p part_two_score