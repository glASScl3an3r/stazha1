# frozen_string_literal: true

# Напишите функцию
# которая переводит градусы по Цельсию в градусы по Фаренгейту (формулу нужно найти в интернете)
# напишите консольную программу, которая просит юзера ввести число (градусы по Цельсию) и переводит его в Фаренгейты
# необязательно, но будет плюсом Напишите обработку ошибок, если юзер ввел неправильные данные (программа должна просить ввести число заново и сообщать об ошибке, но не прерываться)

def c_to_f(celsiums)
  celsiums * 9.0 / 5 + 32
end

loop do
  puts 'Type C* value to calc F*'
  c = Float(gets.chomp) rescue nil

  if c.nil?
    puts 'Your input is incorrect. Try something else'
    next
  end

  puts "#{c} C* = #{c_to_f(c)} F*"
  break
end

