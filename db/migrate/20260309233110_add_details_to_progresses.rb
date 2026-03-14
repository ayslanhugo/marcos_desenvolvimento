class AddDetailsToProgresses < ActiveRecord::Migration[8.0]
  def change
    add_column :progresses, :notes, :text
  end
end
