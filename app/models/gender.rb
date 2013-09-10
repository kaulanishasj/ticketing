class Gender
  include Mongoid::Document

  field :male_or_female
  belongs_to :user
 end