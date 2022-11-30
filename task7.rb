# frozen_string_literal: true

# Напишите функцию, которая имитирует работу светафора
# на вход она получает один из цветов в виде строки (‘red’, ‘green’, ‘yellow’ ), на выходе будет результат (идти, стоять или ждать)
# напишите это в виде консольной программы, которая не прекращает работу после
# однократного вызова, а ждет следующих запросов
# нe еобязательно, но будет плюсом напишите обработку некорректных данных и добавьте возможность юзеру завершить работу программы

ACTIONS = { red: :stop, green: :go, yellow: :wait }.freeze
def action_by_color(color)
  ACTIONS[color.to_sym]
end

loop do
  puts 'Type color(type exit if you want to exit):'
  input = gets.chomp

  case input
  when 'red', 'green', 'yellow'
    puts "Your action: #{action_by_color(input)}"
  when 'exit'
    break
  else
    puts 'Your input is incorrect. Try something else'
  end
end

