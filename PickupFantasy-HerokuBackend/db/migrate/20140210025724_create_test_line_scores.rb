class CreateTestLineScores < ActiveRecord::Migration
  def change
    create_table :test_line_scores do |t|
      t.boolean :extra
      t.integer :quarter
      t.integer :running_score
      t.integer :score

      t.timestamps
    end
  end
end
