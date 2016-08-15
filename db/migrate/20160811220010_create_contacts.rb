class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :user_id
      t.string  :phone

      t.timestamps  null: false
    end
  end
end
