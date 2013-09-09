# Create Genders
["Male", "Female"].each do |e|
  gender = Gender.new
  gender.type = e
  gender.save(validate: false)
end