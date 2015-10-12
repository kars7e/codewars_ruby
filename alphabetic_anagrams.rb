# Alphabetic Anagrams 
# Problem URL: http://www.codewars.com/kata/alphabetic-anagrams/ruby
# Short desc: 
#    Find a number of word given as an input, where the number is defined
#    as a position of the word on a sorted list of all anagrams of this word.
# Examples:
#    ABAB should return 2
#    AAAB should return 1
#    QUESTION should return 24572 
#    BOOKKEEPER should return 10743


def factor(n)
  (1..n).inject(:*) || 1
end

def listPosition(word)
    list = word.chars.sort
    word.chars.each_with_index.inject(1) do |position, (c, i)| 
       position += list.index(c) * factor(word.size-i-1)/list.uniq.inject(1) { |s, n| s*= factor(list.count(n)) }
       list.delete_at(list.index(c)) and position
    end
end
