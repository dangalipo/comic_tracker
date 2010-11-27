class Series < ActiveRecord::Base
  validates_presence_of :name
  has_many :issues
end