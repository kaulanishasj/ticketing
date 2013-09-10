class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  #Document fields
  field :name, type: String

  #Relationships
  has_and_belongs_to_many :users, inverse_of: :events

  def user_attending_event(user)
  	self.users.where(id: user.id).first.present? ? true : false
  end

  def add_event_to_attending(user)
    user.events << self
    user.save
  end

  def remove_event_to_from_user(user)
  	user.events.find(self).remove
  	user.save
  end
end
