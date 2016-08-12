class CreateInvitees < ActiveRecord::Migration
  def change
    create_table  :invitees do |t|
      t.integer   :contact_id
      t.integer   :event_id
      t.boolean   :attending?

      t.timestamps  null: false
    end
  end
end
