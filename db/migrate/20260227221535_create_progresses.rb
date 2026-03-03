class CreateProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :progresses do |t|
      t.references :child, null: false, foreign_key: true
      t.references :milestone, null: false, foreign_key: true
      t.integer :status
      t.date :data_alcance

      t.timestamps
    end
  end
end
