class Array
	def pick_random_element
		random = rand(7)
		self[random]
	end
end

descriptions = [	"Lorem ipsum dolor sit amet, consectetur adipisicing","elit, sed do eiusmod tempor incididunt ut " , "labore et dolore magna aliqua. Ut enim ad minim veniam", "quis nostrud exercitation ullamco ","laboris nisi ut aliquip ex ea commodo consequat.", "Duis aute irure dolor in reprehenderit in", "voluptate velit esse cillum dolore eu fugiat nulla", "pariatur. Excepteur sint occaecat cupidatat ", "non proident, sunt in culpa qui officia deserunt", "mollit anim id est laborum."]

# creating fake events 
["Aunt Grey's Cooking class" , "Zoo Jung Karate Fight" , "Education Fair" , "Handicrafts Showcase"].each do |name|
	event = Event.new(name: name)
	event.entry_fee = rand(8)
	event.description = descriptions.pick_random_element
  event.event_at = Date.today+(10000*rand())
	event.save
end

# Create 4 fake users
["alice@gmail.com", "bob@gmail.com", "clare@gmail.com", "damien@gmail.com"].each do |email|
  u = User.new
  u.email = email
  u.name = email.split('@').first
  u.password = "45678"
  u.gender = "Female"
  u.password_confirmation = "45678"
  u.credit_left = 200
  u.save(validate: false)
end


# Create the admin for editing the events
  admin = User.new
  admin.email = "admin@admin.com"
  admin.name = admin.email.split('@').first
  admin.password = "gtrf0987"
  admin.password_confirmation = "gtrf0987"
  admin.gender = "Female"
  admin.credit_left = 200
  admin.save(validate: false)



