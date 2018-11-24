class PhonesController < ApplicationController
	def new	
	end

	def create
		#getting the phone number from params
		phone=params[:phone][:phone]
		#checking the validity of phone 
		return [] if phone.nil? || phone.length!=10 || phone.split('').select{|d|d.to_i ==0 || d.to_i ==1}.length >0 
		
	end
end
