module ApplicationHelper

  def gender_options
    Gender.all.map { |gender| [gender.male_or_female, gender.id.to_s] }
  end

end
