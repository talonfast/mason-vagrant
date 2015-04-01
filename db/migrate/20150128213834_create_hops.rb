class CreateHops < ActiveRecord::Migration
	def change
		create_table :hops do |t|
			t.boolean :up
			t.timestamps null: false
		end
	end
end