class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :uuid, primary_key: true
      t.string :registration_id

      t.timestamps
    end
  end
end
