class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :source, null: false, foreign_key: true
      t.string :title, null: false
      t.string :description, null: false

      t.date :date_start, null: false
      t.date :date_end, null: false

      t.timestamps
    end

    add_index :events, [:title, :source_id, :date_start, :date_end], unique: true
  end
end
