class News
  include Mongoid::Document
  field :title, type: String
  field :source, type: String
  field :content, type: String
end
