class Gender
  include Mongoid::Document

  field :type
  belongs_to :user
 end