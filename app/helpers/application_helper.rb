module ApplicationHelper

  def gender_html_options
    options = "<option value> Would not like to mention </option>"
		['Male', 'Female'].each do |gender|
			options << "<option value=\"#{gender}\">#{gender}</option>" 
		end
    options.html_safe
  end
end
