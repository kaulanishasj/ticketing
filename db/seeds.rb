# Create Genders
["Male", "Female"].each do |e|
  gender = Gender.new
  gender.male_or_female = e
  gender.save
end