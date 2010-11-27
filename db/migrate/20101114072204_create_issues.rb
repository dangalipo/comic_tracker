class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do | t |
      t.integer   :issue_number
      t.datetime  :release_date 
    end
  end

  def self.down
    drop_table :issues  
  end
end
