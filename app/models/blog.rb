class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :comments
  field :_id, type: Integer
  field :dt, type: Date
  field :url, type: String
  field :title, type: String
  field :content, type: String

end
