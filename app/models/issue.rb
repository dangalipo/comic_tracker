class Issue < ActiveRecord::Base
  validates_presence_of :issue_number, :release_date
  belongs_to :series
  
end