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
  end
end
