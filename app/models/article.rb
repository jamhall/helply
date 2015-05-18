require 'elasticsearch/model'

class Article < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :topic
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end

Article.import

