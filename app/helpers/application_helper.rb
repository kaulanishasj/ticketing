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
end
