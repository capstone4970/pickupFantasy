class CreateTestPlayStats < ActiveRecord::Migration
  def change
    create_table :test_play_stats do |t|
      t.integer :defense_assists
      t.integer :defense_forced_fumbles
      t.integer :defense_misc_assists
      t.integer :defense_misc_tackles
      t.integer :defense_passes_defensed
      t.float :defense_sack_yards
      t.float :defense_sacks
      t.integer :defense_sp_assists
      t.integer :defense_sp_tackles
      t.float :defense_stuff_yards
      t.float :defense_stuffs
      t.integer :defense_tackles
      t.integer :fg_attempted
      t.integer :fg_blocked
      t.string :fg_distances
      t.integer :fg_long
      t.integer :fg_made
      t.integer :fumble_fumbles
      t.integer :fumble_lost_fumbles
      t.integer :fumble_own_recovered
      t.integer :fumble_own_recovered_td
      t.integer :fumble_own_recovered_yards
      t.integer :interception_return_attempts
      t.integer :interception_return_long
      t.boolean :interception_return_long_td
      t.integer :interception_return_touchdowns
      t.integer :interception_return_yards
      t.integer :interceptions
      t.integer :kick_return_long
      t.boolean :kick_return_long_td
      t.integer :kick_return_touchdowns
      t.integer :kick_return_yards
      t.integer :kick_returns
      t.integer :kickoffs
      t.integer :kickoffs_end_zone
      t.integer :kickoffs_touchback
      t.integer :opponent_fumbles_recovered
      t.integer :opponent_fumbles_td
      t.integer :opponent_fumbles_yards
      t.integer :passing_attempts
      t.integer :passing_completions
      t.integer :passing_interceptions
      t.integer :passing_long
      t.boolean :passing_long_td
      t.integer :passing_net_yards
      t.integer :passing_sacked
      t.integer :passing_touchdowns
      t.integer :passing_yards
      t.integer :passing_yards_lost
      t.integer :penalty_penalties
      t.integer :penalty_yards
      t.string :player__first_name
      t.integer :player__global_id
      t.string :player__last_name
      t.integer :player__number
      t.string :player__position
      t.integer :punt_return_long
      t.boolean :punt_return_long_td
      t.integer :punt_return_touchdowns
      t.integer :punt_return_yards
      t.integer :punt_returns
      t.integer :punting_inside_20
      t.integer :punting_long
      t.integer :punting_return_yards
      t.integer :punting_returns
      t.integer :punting_touchbacks
      t.integer :punting_yards
      t.integer :punts
      t.integer :punts_blocked
      t.integer :receiving_long
      t.boolean :receiving_long_td
      t.integer :receiving_targets
      t.integer :receiving_tds
      t.integer :receiving_yards
      t.integer :receptions
      t.integer :return_total_touchdowns
      t.integer :return_total_yards
      t.integer :rushing_attempts
      t.integer :rushing_long
      t.boolean :rushing_long_td
      t.integer :rushing_touchdowns
      t.integer :rushing_yards
      t.integer :safeties
      t.integer :two_point_conversions
      t.integer :two_point_conversions_attempted
      t.integer :xp_attempts
      t.integer :xp_blocked
      t.integer :xp_made

      t.timestamps
    end
  end
end
