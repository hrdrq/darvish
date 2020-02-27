class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :blog
  field :name, type: String
  field :content, type: String

  validates_presence_of :name
  validates_presence_of :content
  validates_length_of :name, :maximum => 15
  validates_length_of :content, :maximum => 100
end
