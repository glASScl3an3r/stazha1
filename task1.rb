# frozen_string_literal: true

arr = [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]

# returns [max1, max2] where max1 >= max2
def array_2_max(arr)
  return [nil, nil]    if arr.empty?
  return [arr[0], nil] if arr.size == 1

  max1 = [arr[0], arr[1]].max
  max2 = [arr[0], arr[1]].min
  (2...arr.size).each do |i|
    if arr[i] > max1
      max2 = max1
      max1 = arr[i]
    elsif arr[i] > max2
      max2 = arr[i]
    end
  end

  [max1, max2]
end

# returns [min1, min2] where min1 <= min2
def array_2_min(arr)
  return [nil, nil]    if arr.empty?
  return [arr[0], nil] if arr.size == 1

  max1 = [arr[0], arr[1]].min
  max2 = [arr[0], arr[1]].max
  (2...arr.size).each do |i|
    if arr[i] < max1
      max2 = max1
      max1 = arr[i]
    elsif arr[i] < max2
      max2 = arr[i]
    end
  end

  [max1, max2]
end

puts array_2_max(arr).inspect # [999, 893]
puts array_2_min(arr).inspect # [0, 1]

