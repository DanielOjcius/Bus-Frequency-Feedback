class CreateBusFrequencies < ActiveRecord::Migration
  def change
    create_table :bus_frequencies do |t|
      t.string :bus_no
      t.string :time_range
      t.integer :low
      t.integer :high

      t.timestamps
    end
  end
end
