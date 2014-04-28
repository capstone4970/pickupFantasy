class CreateTestMeta < ActiveRecord::Migration
  def change
    create_table :test_meta do |t|
      t.integer :limit
      t.string :next
      t.integer :offset
      t.string :previous
      t.integer :total_count

      t.timestamps
    end
  end
end
