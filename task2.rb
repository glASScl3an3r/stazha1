# frozen_string_literal: true

arr = [{ a: 1, b: 2, c: 45 }, { d: 123, c: 12 }, { e: 87 }]

# напишите выражение, которое получает массив всех ключей
puts arr.each_with_object([]) { |hash, result| result << hash.keys }.flatten.inspect # [:a, :b, :c, :d, :c, :e]

# напишите выражение, которое получает массив всех значений
puts arr.each_with_object([]) { |hash, result| result << hash.values }.flatten.inspect # [1, 2, 45, 123, 12, 87]

# напишите выражение, которое получает сумму всех значений
puts arr.sum { |hash| hash.values.sum } # 270

