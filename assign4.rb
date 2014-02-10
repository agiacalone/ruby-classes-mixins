#!/usr/bin/ruby -w

# Anthony Giacalone
# CECS 424
# September 26, 2011
# Assignment 4
# Classes and Mixins

class Vowels
    include Comparable
    attr :word
    def initialize(word)
        @word = word
    end
    
    # comparev method for the spaceship operator
    #   This will compare the vowels in the left 
    #   and right words, returning either -1, 0,
    #   or 1 depending on which is larger. The
    #   words are downcased before counted to
    #   ensure that the words are compared
    #   accurately. 
    def <=>(otherword)
        @word.to_s.downcase.count('aeiou') <=> 
            otherword.to_s.downcase.count('aeiou')
    end

    # downtov will simply convert the given word to
    #   the count of its vowels for comparison
    def downtov
        @word.to_s.downcase.count('aeiou')
    end
    # Method to give the class a String attribute
    def to_s
        @word.to_s
    end
end

# Create the array of word strings to compare
wordlist = ["Fruitcake","Jobs","Headache","Eunoia","School"]

# Map the wordlist array to the Vowel class and store it
wordlist.map! {|word| Vowels.new(word)}

# Below are the tests for the mixin method
# This utlizes the above mixin class to compare
#   the vowels of the word.

# Compare the words 'Fruitcake' and 'Headache'
#   Should return a false
print(wordlist[0], " > ", wordlist[2], " = ",
    wordlist[0] > wordlist[2], "\n")

# Compare the words 'Eunoia' (real word!) and 'School'
#   Should return a true
print(wordlist[3], " > ", wordlist[4], " = ",
    wordlist[3] > wordlist[4], "\n")
    
# Compare the words 'Jobs' and 'School'
#   Should return a false
print(wordlist[1], " > ", wordlist[4], " = ",
    wordlist[1] > wordlist[4], "\n")

# Compare using the < operator.
#   Should return true
print(wordlist[1], " < ", wordlist[2], " = ",
    wordlist[1] < wordlist[2], "\n")

# Compare using the > operator.
#   Should return false
print(wordlist[2], " > ", wordlist[3], " = ",
    wordlist[2] > wordlist[3], "\n")

# Compare using the == operator.
#   Should return true
print(wordlist[4], " == ", wordlist[4], " = ",
    wordlist[4] == wordlist[4], "\n")

puts "\nHere is the array, using the 'sort' function:"
puts wordlist.sort

##########################################
### Here is the output for the program ###
##########################################
#
# Fruitcake > Headache = false
# Eunoia > School = true
# Jobs > School = false
# Jobs < Headache = true
# Headache > Eunoia = false
# School == School = true
#
# Here is the array, using the 'sort' function:
# Jobs
# School
# Headache
# Fruitcake
# Eunoia

