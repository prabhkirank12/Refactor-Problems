#Complexity => O(n^2)
def bad_two_sum?(arr, target)

    arr.each_with_index do |el, i|
        arr.each_with_index do |el2, i2|
            return true if i2 > i && el + el2 == target
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)

    sorted = arr.sort
    
    
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false