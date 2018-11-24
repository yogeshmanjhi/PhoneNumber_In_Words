class PhonesController < ApplicationController
  def new
  end

  def create
    #getting the phone number from params
    phone=params[:phone][:phone]
    #checking the validity of phone
    return [] if phone.nil? || phone.length!=10 || phone.split('').select{|d|d.to_i ==0 || d.to_i ==1}.length >0
    #creating mapping as given in the question
    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
    # getting all the values from dictionary and storing in array 
    dictionary = {}
    for i in (1..30)
      dictionary[i] = []
    end
    file_path = Rails.root.join("public", "dictionary.txt")
    File.foreach( file_path ) do |word|
      dictionary[word.length] << word.chop.to_s.downcase
    end
    keys = phone.chars.map{|e|letters[e]}
    temp = {}
    max_index = keys.length - 1 # max_index
    #Looping through all letters and get matching records with dictionary
    for i in (2..max_index - 2)
      array1 = keys[0..i]
      next if array1.length < 3
      array2 = keys[i + 1..max_index]
      next if array2.length < 3
      combination1 = array1.shift.product(*array1).map(&:join) #calculating the product of arrays 
      next if combination1.nil?
      combination2 = array2.shift.product(*array2).map(&:join)
      next if combination2.nil?
      temp[i] = [(combination1 & dictionary[i+2]), (combination2 & dictionary[max_index - i +1])] #common values calculation
    end

  end
end
