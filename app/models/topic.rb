class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  attr_writer :name, :slug

  validates_presence_of :name, :slug
  default_scope { order('name ASC') }
  has_many :articles, dependent: :destroy
end
