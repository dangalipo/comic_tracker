class ChangeAddSeriesIdToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :series_id, :integer
  end

  def self.down
    remove_column :issues, :series_id
  end
end
