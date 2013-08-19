class Skill
  include Mongoid::Document

  field :required, type: Array
  field :recommended, type: Array
  field :years_experience, type: Integer
  field :education, type: String

  embedded_in :jobs
end
