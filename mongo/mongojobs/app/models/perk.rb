class Perk
  include Mongoid::Document

  field :name, type: String

  embedded_in :jobs
end