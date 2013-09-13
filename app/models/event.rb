class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  #Document fields
  field :name, type: String
  field :entry_fee, type: Float
  field :description, type: String
  field :event_at, type: Date

  #Relationships
  has_and_belongs_to_many :users, inverse_of: :events
  validates_presence_of :event_at, :name, :entry_fee

  def user_attending_event(user)
  	self.users.where(_id: user.id).first.present? ? true : false
  end

  def add_event_to_attending(user)
    user.events << self
    user.deduct_entry_from_credit(self)
    user.save
  end

  def remove_event_to_from_user(user)
  	user.events.delete(self)
  	user.save
  end

  def gender_based_entry_fee(user)
    if user.gender == 'Female'
      (self.entry_fee * 0.95).round(2) 
    else
      self.entry_fee
    end
  end
end
