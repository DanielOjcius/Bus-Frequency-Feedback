class SetDefaultFrequency < ActiveRecord::Migration
  def change
  	change_column :bus_frequencies, :low, :integer, :default => 0
  	change_column :bus_frequencies, :high, :integer, :default => 0
	end
end
