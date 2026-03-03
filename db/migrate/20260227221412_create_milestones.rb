class CreateMilestones < ActiveRecord::Migration[8.0]
  def change
    create_table :milestones do |t|
      t.string :titulo
      t.text :descricao
      t.string :categoria
      t.integer :idade_minima_meses
      t.integer :idade_maxima_meses
      t.integer :tipo_desenvolvimento

      t.timestamps
    end
  end
end
