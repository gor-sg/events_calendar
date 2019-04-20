class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :source, null: false, foreign_key: true
      t.string :title, null: false
      t.string :description, null: false

      t.date :starts_on, null: false
      t.date :ends_on, null: false

      t.timestamps
    end

    add_index :events, [:title, :source_id, :starts_on, :ends_on], unique: true
  end
end
