class CreateTestPlays < ActiveRecord::Migration
  def change
    create_table :test_plays do |t|
      t.boolean :active
      t.integer :assist1
      t.integer :assist1_global_id
      t.integer :assist1_id
      t.integer :assist2
      t.integer :assist2_global_id
      t.integer :assist_id
      t.integer :away_score_after
      t.integer :away_score_before
      t.boolean :continuation
      t.string :details
      t.string :direction
      t.integer :distance
      t.integer :down
      t.integer :drive_id
      t.string :end_possession
      t.string :end_yardline
      t.string :game
      t.string :game_time
      t.string :game_time_minute
      t.string :game_time_second
      t.integer :home_score_after
      t.integer :home_score_before
      t.float :play_id
      t.string :pass_defensed1
      t.string :pass_defensed1_id
      t.string :pat_type
      t.integer :pat_value
      t.string :play_type
      t.integer :play_type_id
      t.integer :player1_global_id
      t.integer :player1_id
      t.integer :player2_global_id
      t.integer :player2_id
      t.integer :player3_global_id
      t.integer :player3_id
      t.string :possession
      t.integer :quarter
      t.string :resource_uri
      t.string :review_team
      t.integer :review_team_global_id
      t.integer :review_team_id
      t.string :score_description
      t.string :score_type
      t.boolean :scoring_play
      t.string :slug
      t.float :stats_id
      t.string :tackle1
      t.integer :tackle1_global_id
      t.integer :tackle1_id
      t.string :tackle2
      t.integer :tackle2_global_id
      t.integer :tackle2_id
      t.string :target
      t.integer :target_id
      t.string :time
      t.string :true_time
      t.string :yardline
      t.integer :yards

      t.timestamps
    end
  end
end
