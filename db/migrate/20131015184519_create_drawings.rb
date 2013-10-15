class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
    	t.integer :participant_id
    	t.integer :cycle
    	
      t.timestamps
    end
  end
end
