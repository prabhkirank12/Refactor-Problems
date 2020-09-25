#first => #O(n^2)
def my_min(arr)
    min = 0 #O(1)
    arr.each_with_index do |el, i| #O(n)
        arr.each_with_index do |el2, i2| #O(n)
            if i2 > i && el < el2 && el < min #O(1)
                min = el #O(1)
            end
        end
    end
    min #O(1)
end

#second approach => O(n)
def my_min(arr)
    min = 0 #O(1)
    arr.each do |el| #O(n)
        if el < min #O(1)
            min = el #O(1)
        end
    end
    min #O(1)
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#first approach: => #O(n^3)
def largest_contiguous_subsum(list)
    subs = [] #O(1)

    list.each_with_index do |n1, i1| #O(n)
        list.each_with_index do |n2, i2| #O(n)
            if i2 >= i1 #O(1)
                subs << list[i1..i2] #O(n)
            end
        end
    end

    max = subs.first.sum #O(1)
    subs.each do |sub| #O(n)
        if sub.sum > max #O(1)
            max = sub.sum #O(1)
        end
    end
    max #O(1)
end

#second approach: => O(n)
def largest_contiguous_subsum(list)
    current_sum = list.first 
    largest_sum = list.first
    (1...list.length).each do |i| 
        current_sum = 0 if current_sum < 0 && list[i] > 0
        current_sum = current_sum + list[i] 
        largest_sum = current_sum if current_sum > largest_sum
        current_val = list[i] 
        largest_sum = current_val if largest_sum < list[i]
    end
    largest_sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# # possible sub-sums
# # [5]           # => 5
# # [5, 3]        # => 8 --> we want this one
# # [5, 3, -7]    # => 1
# # [3]           # => 3
# # [3, -7]       # => -4
# # [-7]          # => -7

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])