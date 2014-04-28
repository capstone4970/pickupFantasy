class CreateTestScoringPlays < ActiveRecord::Migration
  def change
    create_table :test_scoring_plays do |t|
      t.string :_game_cache
      t.string :_state
      t.boolean :active
      t.integer :assist1
      t.integer :assist1_global_id
      t.integer :assist1_id
      t.integer :assist2
      t.integer :assist2_global_id
      t.integer :assist2_id
      t.integer :away_score_after
      t.integer :away_score_before
      t.boolean :continuation
      t.datetime :created
      t.string :details
      t.integer :direction
      t.integer :distance
      t.integer :down
      t.integer :drive_id
      t.string :end_possession
      t.string :end_yardline
      t.integer :game_id
      t.integer :game_time
      t.integer :game_time_minute
      t.integer :game_time_second
      t.integer :home_score_after
      t.integer :home_score_before
      t.integer :scoring_play_id
      t.integer :pass_defensed1
      t.integer :pass_defensed1_id
      t.integer :pat_type
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
      t.integer :review_team
      t.integer :review_team_global_id
      t.integer :review_team_id
      t.integer :score_description
      t.string :score_type
      t.boolean :scoring_play
      t.string :slug
      t.float :stats_id
      t.integer :tackle1
      t.integer :tackle1_global_id
      t.integer :tackle1_id
      t.integer :tackle2
      t.integer :tackle2_global_id
      t.integer :tackle2_id
      t.integer :target
      t.integer :target_id
      t.string :time
      t.integer :true_away_score_after
      t.string :true_details
      t.integer :true_home_score_after
      t.datetime :updated
      t.string :yardline
      t.integer :yards

      t.timestamps
    end
  end
end
