class CreateTestObjects < ActiveRecord::Migration
  def change
    create_table :test_objects do |t|
      t.boolean :active
      t.integer :away_team
      t.integer :away_team_stats
      t.integer :away_total_score
      t.datetime :created
      t.boolean :final
      t.boolean :finalbox
      t.integer :game_code
      t.integer :game_date_day
      t.float :game_date_epoch_time
      t.integer :game_date_month
      t.datetime :game_date_time
      t.integer :game_date_year
      t.string :game_location
      t.string :game_progress
      t.string :game_quarter_time
      t.string :game_status
      t.integer :game_status_id
      t.string :game_type
      t.integer :game_type_id
      t.integer :global_id
      t.integer :home_team
      t.integer :home_team_stats
      t.integer :home_total_score
      t.integer :objects_id
      t.integer :latest_play
      t.integer :latest_plays
      t.integer :line_score
      t.integer :players
      t.string :possession
      t.string :resource_uri
      t.integer :scoring_plays
      t.integer :season
      t.string :slug
      t.integer :status
      t.string :summary
      t.integer :teams
      t.string :tv_station
      t.datetime :updated
      t.float :updated_epoch_time
      t.integer :week

      t.timestamps
    end
  end
end
