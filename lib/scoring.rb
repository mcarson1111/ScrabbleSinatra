class Scoring
  LETTER_VALUE = { "A"=> 1, "E"=> 1, "I"=> 1, "O"=> 1, "U"=> 1, "L"=> 1, "N"=> 1, "R"=> 1, "S"=> 1, "T"=> 1,
                   "D"=> 2, "G"=> 2,
                   "B"=> 3, "C"=> 3, "M"=> 3, "P"=> 3,
                   "F"=> 4, "H"=> 4, "V"=> 4, "W"=> 4, "Y"=> 4,
                   "K"=> 5,
                   "J"=> 8, "X"=> 8,
                   "Q"=> 10, "Z"=> 10
                 }

      def self.score(word)                    #this is going to find the total value of the word.... self. bc its a method of the class, not an instance (the numbers are always the same for the letters)
        total = 0                             #defining total (variable) as zero for now
        word.upcase.each_char do |key|        #turning the word into upcase and iterating through each character(letter) of the word
          total = total + LETTER_VALUE[key]   #tally the total sum of the value of those letters, when we call [key] on LETTER_VALUE it will give us the value of that key and add it to our total
        end
        word.length == 7 ? total + 50 : total #Return is implicit   #if the word's length is 7 then we add 50 to our total/ this is an ternary!!!
      end



      def self.highest_score_from(array)
        hash ={}                     #this hash will contain words and their values/scores

        array.each do |word|         #iterating through words given and assigning the score (through the score method) to the word
          hash[word] = score(word)
        end

        array_values = hash.values   #this is taking the values of the hash and storing them in an array

        max_value = array_values.max #this is finding the max value of the values and storing as a variable

        array_tie = []

        hash.each do |key, value|    #iterating through the hash and if the value of the word is equal to the max_value
          if value ==max_value       #it pushes that corresponding word into an array for the ties
            array_tie << key
          end
        end

        min = array_tie[0].length    #we are setting the minimum by default to the length of the first word in the array
        winner = array_tie[0]        #we are setting the winner by default to the first word

        array_tie.each do |word|     #iterating through the tie array and checking if the current word's length is less than the minimum
          if word.length == 7        #add conditional so that if the word is 7 letters long, it is automatically the winner
            return word              #return the word and exit
          end
          if word.length < min
            min = word.length        #if it is, set it's length as the new min value
            winner = word            #set the corresponding word as the current winner (which might change the next iteration though)
          end
        end

        return winner

      end
end
