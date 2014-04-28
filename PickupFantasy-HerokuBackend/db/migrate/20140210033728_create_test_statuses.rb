class CreateTestStatuses < ActiveRecord::Migration
  def change
    create_table :test_statuses do |t|
      t.boolean :active_state
      t.string :distance
      t.integer :down
      t.integer :minutes
      t.integer :quarter
      t.integer :seconds
      t.integer :segment_number
      t.string :status
      t.integer :status_id
      t.integer :team_possession_id
      t.boolean :under_review
      t.float :yards_from_goal

      t.timestamps
    end
  end
end
