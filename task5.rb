# frozen_string_literal: true

# Найдите вхождения каждого элемента в массив
# [nil, 2, :foo, “bar”, “foo”, “apple”, “orange”, :orange, 45,  nil, :foo, :bar, 25, 45, :apple, “bar”, nil]
# чтобы на выходе получился Hash по типу { элемент => количество вхождений в массив}

arr = [nil, 2, :foo, 'bar', 'foo', 'apple', 'orange', :orange, 45, nil, :foo, :bar, 25, 45, :apple, 'bar', nil]

puts arr.each_with_object({}) { |elem, result| result[elem] ||= 0; result[elem] += 1 }
# output:
# {nil=>3, 2=>1, :foo=>2, "bar"=>2, "foo"=>1, "apple"=>1, "orange"=>1, :orange=>1, 45=>2, :bar=>1, 25=>1, :apple=>1}

