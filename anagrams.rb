#The worst worse case => O(n!)
def first_anagram?(str1, str2)
    subs = str1.split("").permutation.to_a
    new_subs = []
    subs.each do |sub|
        new_subs << sub.join("")
    end

    new_subs.include?(str2)
end

# p anagram?("elvis", "lives")    #=> true
# p anagram?("gizmo", "sally")    #=> false
# p anagram?("everything", "nothing")

#The phase2 => O(n^2)
def second_anagram?(str1, str2)
    str2_split = str2.split("")  #O(n)

    str1.each_char do |char| #O(n)
        idx = str2_split.find_index(char) #O(n)
        str2_split.delete_at(idx) unless idx.nil? #O(n) #similar to shift
    end

    str2_split.empty? #O(1)

end

# p second_anagram?("elvis", "lives")  #=> true  
# p second_anagram?("gizmo", "sally")    #=> false 

#phase3 => O(n log n)
def third_anagram?(str1, str2)
    sorted_str1 = str1.split("").sort.join("") # O(n log n)
    sorted_str2 = str2.split("").sort.join("") # O(n log n)

    sorted_str1 == sorted_str2
end

# p third_anagram?("elvis", "lives")  #=> true  
# p third_anagram?("gizmo", "sally")    #=> false 

def fourth_anagram?(str1, str2)
    return false unless str1.length == str2.length
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char {|char| hash1[char] += 1} #O(n)
    str2.each_char {|char| hash2[char] += 1} #O(n)

    hash1 == hash2 #O(1) => O(n) in general

    # str1.each_char do |char|
    #      hash1[char] += 1
    # end

    # str2.each_char do |char|
    #     hash1[char] -=1
    # end
end

p fourth_anagram?("elvis", "lives")  #=> true  
p fourth_anagram?("gizmo", "sally")    #=> false 