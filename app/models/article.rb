require 'elasticsearch/model'

class Article < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :topic
  include Elasticsearch::Model
  scope :published, -> { where('published_at IS NOT NULL') }
  scope :unpublished, -> { where('published_at IS  NULL') }
  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true
  validates :topic, presence: true

  def is_published?
    true unless published_at.nil?
  end

  after_save {
    if self.published_at.nil?
      __elasticsearch__.delete_document ignore: 404
    else
      __elasticsearch__.index_document
    end
  }

end


