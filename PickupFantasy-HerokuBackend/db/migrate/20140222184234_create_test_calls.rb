class CreateTestCalls < ActiveRecord::Migration
  def change
    create_table :test_calls do |t|
      t.string :meta, :array => true
      t.string :objects, :array => true

      t.timestamps
    end
  end
end
