puts "Welcome to Loan Calculator!"

loop do
  amount = ''
  loop do 
    puts "How much do you owe? Enter a whole number with no apostrophes."
      amount = gets.chomp

    if amount.to_i.to_s == amount
      break
    else 
      puts "Invalid number."
    end
  end

  apr = ''
  apr_dec = 0

  loop do
    puts "What's the APR on your loan?"
    puts "Example: 10 for 10% APR or 5.5 for 5.5% APR"
      apr = gets.chomp
      apr_dec = apr.to_f/100

      if apr.to_f < 0 || apr.empty?
        puts "Invalid APR rate"
      else
        break
      end
    end

  duration = ''
  duration_months = ''
  loop do
    puts "What's the duration of your loan? (Enter amount in years)"
      duration = gets.chomp
      duration_months = duration.to_f * 12

      if duration_months <= 0
        puts "Invalid duration"
      else
        break
      end
    end

    monthly_interest = apr_dec / duration_months
    monthly_pay = amount.to_f * (monthly_interest / (1 - (1 + monthly_interest)**(-duration_months)))

  puts "Your monthly payment is #{monthly_pay},
  at a monthly interest rate of #{monthly_interest},
  for #{duration_months} months."

  puts "Make another calculation? y/n"
  answer = gets.chomp.downcase
  break unless answer.start_with? 'y'
end

  puts "Thank you for using Loan Calculator!"

