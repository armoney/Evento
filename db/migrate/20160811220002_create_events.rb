class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :title
      t.string  :description
      t.string  :address
      t.date    :date
      t.time    :time
      t.string  :url
      t.string  :host_id

      t.timestamps  null: false
    end
  end
end
