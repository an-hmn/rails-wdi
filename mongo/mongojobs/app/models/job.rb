class Job
  include Mongoid::Document

  field :company, type: String
  field :position, type: String
  field :description, type: String
  field :skills, type: Hash
  field :perks, type: Array
  field :date_posted, type: DateTime

  embeds_one :skill

  #embeds_many :perks
end
