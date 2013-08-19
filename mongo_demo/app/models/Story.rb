class Story
  include MongoMapper::Document

  key :title, String
  key :url, String
  key :slug, String
  key :voters, Array
  key :votes, Integer, :default => 0
  key :relevance, Integer, :default => 0

  # Cached values.
  key :comment_count, Integer, :default => 0
  key :username, String

  key :user_id, ObjectId
  timestamps!

  # Relationships
  belongs_to :username

  validates_presence_of :title, :url, :user_id

end