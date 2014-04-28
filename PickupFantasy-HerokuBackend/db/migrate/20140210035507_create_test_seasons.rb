class CreateTestSeasons < ActiveRecord::Migration
  def change
    create_table :test_seasons do |t|
      t.boolean :active
      t.datetime :created
      t.datetime :end_date
      t.integer :season_id
      t.string :name
      t.string :resource_uri
      t.string :slug
      t.datetime :start_date
      t.datetime :updated
      t.integer :year

      t.timestamps
    end
  end
end
