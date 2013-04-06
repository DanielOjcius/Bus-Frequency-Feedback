class CreateBusLists < ActiveRecord::Migration
  def change
    create_table :bus_lists do |t|
      t.string :bus_no

      t.timestamps
    end
  end
end
