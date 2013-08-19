class Perk
  include Mongoid::Document

  field :name, type: String

  belongs_to :job
end