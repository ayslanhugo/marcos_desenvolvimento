class CreateChildren < ActiveRecord::Migration[8.0]
  def change
    create_table :children do |t|
      t.string :nome
      t.date :data_nascimento
      t.integer :tipo_desenvolvimento
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
