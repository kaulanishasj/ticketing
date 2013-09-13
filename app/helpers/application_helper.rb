module ApplicationHelper

  def gender_html_options(gender_val)
    options = "<option value> Would not like to mention </option>"
		["Male", "Female"].each do |gender|
			if gender_val == gender
				options << "<option selected=\"selected\" value=\"#{gender}\">#{gender}</option>" 
			else
				options << "<option value=\"#{gender}\">#{gender}</option>" 
			end
		end
    options.html_safe
  end

  def credit_left_html_options
    options = "<option value> Would not like to buy any credit </option>"
		(10..200).step(20).each do |number|
			options << "<option value=\"#{number}\">#{number}</option>" 
		end
    options.html_safe
  end

  def entry_fee_html_options
    options = "<option value> Not Sure about the Entry fee!? </option>"
		(0..10).each do |number|
			options << "<option value=\"#{number}\">#{number}</option>" 
		end
    options.html_safe
  end

end
