CHOICES = { "r" =>  "rock",
            "p" =>  "paper",
            "sc" => "scissors",
            "l" =>  "lizard",
            "sp" => "spock" }

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won.")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

score = [0, 0]

# main loop
loop do
  choice = ''

  loop do
    prompt("Three wins makes a match.
            Choose one: #{(CHOICES.map { |_, v| v.to_s }).join(', ')}.
            Type first letter of your choice,
            and 'sp' for spock or 'sc' for scissors.")
    choice = CHOICES[gets.chomp.to_sym]

    if CHOICES.value?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = CHOICES.values.sample
  puts("You chose: #{choice}. Computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    score[0] += 1
    puts "You: #{score[0]}; Computer: #{score[1]}"
    if score[0] == 3
      puts "You are the grand winner of this match!"
    end
  elsif win?(computer_choice, choice)
    score[1] += 1
    puts "You: #{score[0]}; Computer: #{score[1]}"
    if score[1] == 3
      puts "Computer is the grand winner of this match."
    end
  end

  prompt("Do you want to keep playing? y/n")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")