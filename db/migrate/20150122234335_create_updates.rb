class CreateUpdates < ActiveRecord::Migration
	def change
		create_table :updates do |t|
			t.integer :water_level
			t.integer :water_temp
			t.integer :air_temp
			t.integer :humidity
			t.timestamps null: false
		end
	end
end
