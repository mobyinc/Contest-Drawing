class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
    	t.string :name
    	t.integer :points, default: 0
    	
      t.timestamps
    end
  end
end
