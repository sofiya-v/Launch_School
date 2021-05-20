# ask the user for 2 numbers
# ask the user for an operation to perform
# perform the operation on the 2 numbers
# output the result
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# at top of file after initializing MESSAGES

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  msg = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end

  msg
end

prompt(messages('welcome'))

name = ''

loop do
  name = Kernel.gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")

# main loop
loop do
  num1 = ""

  loop do
    prompt(messages("firstnum"))
    num1 = Kernel.gets.chomp

    if valid_number?(num1)
      break
    else
      prompt(messages("invalid_num"))
    end
  end

  num2 = ""

  loop do
    prompt(messages("secondnum"))
    num2 = Kernel.gets.chomp

    if valid_number?(num1)
      break
    else
      prompt(messages("invalid_num"))
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages("invalid_op"))
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end

  prompt("The result is #{result}")
  prompt(messages("again?"))
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages("thanks"))
"/n"