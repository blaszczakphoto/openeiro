class CreateDoorsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :doors_events do |t|
      t.integer :state

      t.timestamps
    end
  end
end
