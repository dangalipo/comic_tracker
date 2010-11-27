class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :name
      t.boolean :one_shot, :default => false
      t.boolean :finished, :default => false
    end
  end

  def self.down
    drop_table :series
  end
end
