require 'elasticsearch/model'

class Article < ActiveRecord::Base
  is_impressionable :counter_cache => true, :unique => true
  extend FriendlyId
  belongs_to :topic
  has_many :impression, :as=>:impressionable
  validates_presence_of :topic
  include Elasticsearch::Model
  friendly_id :title, :use => :slugged
  scope :published, -> { where('published_at IS NOT NULL') }
  scope :unpublished, -> { where('published_at IS  NULL') }
  default_scope { order('title ASC') }
  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true
  validates :topic, presence: true

  def is_published?
    true unless published_at.nil?
  end

  def published
    true unless pu
    blished_at.nil?
  end


  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size
  end


  after_save {
    if self.published_at.nil?
      __elasticsearch__.delete_document ignore: 404
    else
      __elasticsearch__.index_document
    end
  }

end


