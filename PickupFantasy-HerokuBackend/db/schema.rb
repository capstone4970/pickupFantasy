# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140405151359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gamesofweeks", force: true do |t|
    t.string   "gameKey"
    t.string   "gameID"
    t.string   "time"
    t.string   "date"
    t.string   "homeTeam"
    t.string   "awayTeam"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: true do |t|
    t.integer  "leagueID"
    t.string   "name"
    t.string   "password"
    t.integer  "numPlayers"
    t.string   "member1"
    t.string   "member2"
    t.string   "member3"
    t.string   "member4"
    t.string   "member5"
    t.string   "member6"
    t.string   "gamesOfWeekIdentifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rosters", force: true do |t|
    t.integer  "rosterID"
    t.string   "username"
    t.integer  "leagueID"
    t.integer  "qb"
    t.integer  "flex"
    t.integer  "k"
    t.integer  "wr"
    t.integer  "rb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasonplayerdata", force: true do |t|
    t.integer  "NFLPlayerID"
    t.integer  "cbsID"
    t.integer  "nerdID"
    t.string   "CurrentTeam"
    t.string   "FantasyPosition"
    t.integer  "Number"
    t.string   "FirstName"
    t.string   "LastName"
    t.integer  "InitialAuctionValue"
    t.integer  "CurrentAuctionValue"
    t.integer  "projFantasyPoints"
    t.integer  "projFantasyPointsMark"
    t.integer  "LastPlayedPoints"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_actives", force: true do |t|
    t.boolean  "active_state"
    t.integer  "distance"
    t.integer  "down"
    t.integer  "minutes"
    t.integer  "quarter"
    t.integer  "seconds"
    t.integer  "segment_number"
    t.string   "status"
    t.integer  "status_id"
    t.integer  "team_possession_id"
    t.boolean  "under_review"
    t.integer  "yards_from_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_calls", force: true do |t|
    t.string   "meta",       array: true
    t.string   "objects",    array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_line_scores", force: true do |t|
    t.boolean  "extra"
    t.integer  "quarter"
    t.integer  "running_score"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_meta", force: true do |t|
    t.integer  "limit"
    t.string   "next"
    t.integer  "offset"
    t.string   "previous"
    t.integer  "total_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_objects", force: true do |t|
    t.boolean  "active"
    t.integer  "away_team"
    t.integer  "away_team_stats"
    t.integer  "away_total_score"
    t.datetime "created"
    t.boolean  "final"
    t.boolean  "finalbox"
    t.integer  "game_code"
    t.integer  "game_date_day"
    t.float    "game_date_epoch_time"
    t.integer  "game_date_month"
    t.datetime "game_date_time"
    t.integer  "game_date_year"
    t.string   "game_location"
    t.string   "game_progress"
    t.string   "game_quarter_time"
    t.string   "game_status"
    t.integer  "game_status_id"
    t.string   "game_type"
    t.integer  "game_type_id"
    t.integer  "global_id"
    t.integer  "home_team"
    t.integer  "home_team_stats"
    t.integer  "home_total_score"
    t.integer  "objects_id"
    t.integer  "latest_play"
    t.integer  "latest_plays"
    t.integer  "line_score"
    t.integer  "players"
    t.string   "possession"
    t.string   "resource_uri"
    t.integer  "scoring_plays"
    t.integer  "season"
    t.string   "slug"
    t.integer  "status"
    t.string   "summary"
    t.integer  "teams"
    t.string   "tv_station"
    t.datetime "updated"
    t.float    "updated_epoch_time"
    t.integer  "week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_play_stats", force: true do |t|
    t.integer  "defense_assists"
    t.integer  "defense_forced_fumbles"
    t.integer  "defense_misc_assists"
    t.integer  "defense_misc_tackles"
    t.integer  "defense_passes_defensed"
    t.float    "defense_sack_yards"
    t.float    "defense_sacks"
    t.integer  "defense_sp_assists"
    t.integer  "defense_sp_tackles"
    t.float    "defense_stuff_yards"
    t.float    "defense_stuffs"
    t.integer  "defense_tackles"
    t.integer  "fg_attempted"
    t.integer  "fg_blocked"
    t.string   "fg_distances"
    t.integer  "fg_long"
    t.integer  "fg_made"
    t.integer  "fumble_fumbles"
    t.integer  "fumble_lost_fumbles"
    t.integer  "fumble_own_recovered"
    t.integer  "fumble_own_recovered_td"
    t.integer  "fumble_own_recovered_yards"
    t.integer  "interception_return_attempts"
    t.integer  "interception_return_long"
    t.boolean  "interception_return_long_td"
    t.integer  "interception_return_touchdowns"
    t.integer  "interception_return_yards"
    t.integer  "interceptions"
    t.integer  "kick_return_long"
    t.boolean  "kick_return_long_td"
    t.integer  "kick_return_touchdowns"
    t.integer  "kick_return_yards"
    t.integer  "kick_returns"
    t.integer  "kickoffs"
    t.integer  "kickoffs_end_zone"
    t.integer  "kickoffs_touchback"
    t.integer  "opponent_fumbles_recovered"
    t.integer  "opponent_fumbles_td"
    t.integer  "opponent_fumbles_yards"
    t.integer  "passing_attempts"
    t.integer  "passing_completions"
    t.integer  "passing_interceptions"
    t.integer  "passing_long"
    t.boolean  "passing_long_td"
    t.integer  "passing_net_yards"
    t.integer  "passing_sacked"
    t.integer  "passing_touchdowns"
    t.integer  "passing_yards"
    t.integer  "passing_yards_lost"
    t.integer  "penalty_penalties"
    t.integer  "penalty_yards"
    t.string   "player__first_name"
    t.integer  "player__global_id"
    t.string   "player__last_name"
    t.integer  "player__number"
    t.string   "player__position"
    t.integer  "punt_return_long"
    t.boolean  "punt_return_long_td"
    t.integer  "punt_return_touchdowns"
    t.integer  "punt_return_yards"
    t.integer  "punt_returns"
    t.integer  "punting_inside_20"
    t.integer  "punting_long"
    t.integer  "punting_return_yards"
    t.integer  "punting_returns"
    t.integer  "punting_touchbacks"
    t.integer  "punting_yards"
    t.integer  "punts"
    t.integer  "punts_blocked"
    t.integer  "receiving_long"
    t.boolean  "receiving_long_td"
    t.integer  "receiving_targets"
    t.integer  "receiving_tds"
    t.integer  "receiving_yards"
    t.integer  "receptions"
    t.integer  "return_total_touchdowns"
    t.integer  "return_total_yards"
    t.integer  "rushing_attempts"
    t.integer  "rushing_long"
    t.boolean  "rushing_long_td"
    t.integer  "rushing_touchdowns"
    t.integer  "rushing_yards"
    t.integer  "safeties"
    t.integer  "two_point_conversions"
    t.integer  "two_point_conversions_attempted"
    t.integer  "xp_attempts"
    t.integer  "xp_blocked"
    t.integer  "xp_made"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_plays", force: true do |t|
    t.boolean  "active"
    t.integer  "assist1"
    t.integer  "assist1_global_id"
    t.integer  "assist1_id"
    t.integer  "assist2"
    t.integer  "assist2_global_id"
    t.integer  "assist_id"
    t.integer  "away_score_after"
    t.integer  "away_score_before"
    t.boolean  "continuation"
    t.string   "details"
    t.string   "direction"
    t.integer  "distance"
    t.integer  "down"
    t.integer  "drive_id"
    t.string   "end_possession"
    t.string   "end_yardline"
    t.string   "game"
    t.string   "game_time"
    t.string   "game_time_minute"
    t.string   "game_time_second"
    t.integer  "home_score_after"
    t.integer  "home_score_before"
    t.float    "play_id"
    t.string   "pass_defensed1"
    t.string   "pass_defensed1_id"
    t.string   "pat_type"
    t.integer  "pat_value"
    t.string   "play_type"
    t.integer  "play_type_id"
    t.integer  "player1_global_id"
    t.integer  "player1_id"
    t.integer  "player2_global_id"
    t.integer  "player2_id"
    t.integer  "player3_global_id"
    t.integer  "player3_id"
    t.string   "possession"
    t.integer  "quarter"
    t.string   "resource_uri"
    t.string   "review_team"
    t.integer  "review_team_global_id"
    t.integer  "review_team_id"
    t.string   "score_description"
    t.string   "score_type"
    t.boolean  "scoring_play"
    t.string   "slug"
    t.float    "stats_id"
    t.string   "tackle1"
    t.integer  "tackle1_global_id"
    t.integer  "tackle1_id"
    t.string   "tackle2"
    t.integer  "tackle2_global_id"
    t.integer  "tackle2_id"
    t.string   "target"
    t.integer  "target_id"
    t.string   "time"
    t.string   "true_time"
    t.string   "yardline"
    t.integer  "yards"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_scoring_plays", force: true do |t|
    t.string   "_game_cache"
    t.string   "_state"
    t.boolean  "active"
    t.integer  "assist1"
    t.integer  "assist1_global_id"
    t.integer  "assist1_id"
    t.integer  "assist2"
    t.integer  "assist2_global_id"
    t.integer  "assist2_id"
    t.integer  "away_score_after"
    t.integer  "away_score_before"
    t.boolean  "continuation"
    t.datetime "created"
    t.string   "details"
    t.integer  "direction"
    t.integer  "distance"
    t.integer  "down"
    t.integer  "drive_id"
    t.string   "end_possession"
    t.string   "end_yardline"
    t.integer  "game_id"
    t.integer  "game_time"
    t.integer  "game_time_minute"
    t.integer  "game_time_second"
    t.integer  "home_score_after"
    t.integer  "home_score_before"
    t.integer  "scoring_play_id"
    t.integer  "pass_defensed1"
    t.integer  "pass_defensed1_id"
    t.integer  "pat_type"
    t.integer  "pat_value"
    t.string   "play_type"
    t.integer  "play_type_id"
    t.integer  "player1_global_id"
    t.integer  "player1_id"
    t.integer  "player2_global_id"
    t.integer  "player2_id"
    t.integer  "player3_global_id"
    t.integer  "player3_id"
    t.string   "possession"
    t.integer  "quarter"
    t.integer  "review_team"
    t.integer  "review_team_global_id"
    t.integer  "review_team_id"
    t.integer  "score_description"
    t.string   "score_type"
    t.boolean  "scoring_play"
    t.string   "slug"
    t.float    "stats_id"
    t.integer  "tackle1"
    t.integer  "tackle1_global_id"
    t.integer  "tackle1_id"
    t.integer  "tackle2"
    t.integer  "tackle2_global_id"
    t.integer  "tackle2_id"
    t.integer  "target"
    t.integer  "target_id"
    t.string   "time"
    t.integer  "true_away_score_after"
    t.string   "true_details"
    t.integer  "true_home_score_after"
    t.datetime "updated"
    t.string   "yardline"
    t.integer  "yards"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_seasons", force: true do |t|
    t.boolean  "active"
    t.datetime "created"
    t.datetime "end_date"
    t.integer  "season_id"
    t.string   "name"
    t.string   "resource_uri"
    t.string   "slug"
    t.datetime "start_date"
    t.datetime "updated"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_statuses", force: true do |t|
    t.boolean  "active_state"
    t.string   "distance"
    t.integer  "down"
    t.integer  "minutes"
    t.integer  "quarter"
    t.integer  "seconds"
    t.integer  "segment_number"
    t.string   "status"
    t.integer  "status_id"
    t.integer  "team_possession_id"
    t.boolean  "under_review"
    t.float    "yards_from_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_team_stats", force: true do |t|
    t.boolean  "active"
    t.datetime "created"
    t.integer  "defense_assists"
    t.integer  "defense_forced_fumbles"
    t.integer  "defense_misc_assists"
    t.integer  "defense_misc_tackles"
    t.integer  "defense_passes_defenced"
    t.float    "defense_sack_yards"
    t.float    "defense_sacks"
    t.integer  "defense_sp_assists"
    t.integer  "defense_sp_tackles"
    t.float    "defense_stuff_yards"
    t.float    "defense_stuffs"
    t.integer  "defense_tackles"
    t.integer  "fg_attempted"
    t.integer  "fg_blocked"
    t.float    "fg_distances"
    t.integer  "fg_long"
    t.integer  "fg_made"
    t.integer  "first_downs_passing"
    t.integer  "first_downs_penalty"
    t.integer  "first_downs_rushing"
    t.integer  "first_downs_total"
    t.integer  "fourth_down_attempts"
    t.integer  "fourth_down_made"
    t.integer  "fumble_fumbles"
    t.integer  "fumble_lost_fumbles"
    t.integer  "fumble_own_recovered"
    t.integer  "fumble_own_recovered_td"
    t.integer  "fumble_own_recovered_yards"
    t.string   "game"
    t.integer  "goal_to_go_attemps"
    t.integer  "goal_to_go_made"
    t.integer  "stat_id"
    t.integer  "interception_return_attempts"
    t.integer  "interception_return_long"
    t.boolean  "interception_return_long_td"
    t.integer  "interception_return_touchdowns"
    t.integer  "interception_return_yards"
    t.integer  "interceptions"
    t.integer  "kick_return_long"
    t.boolean  "kick_return_long_td"
    t.integer  "kick_return_touchdowns"
    t.integer  "kick_return_yards"
    t.integer  "kick_returns"
    t.integer  "kickoffs"
    t.integer  "kickoffs_end_zone"
    t.integer  "kickoffs_touchback"
    t.integer  "opponent_fumbles_recovered"
    t.integer  "opponent_fumbles_td"
    t.integer  "opponent_fumbles_yards"
    t.integer  "passing_attempts"
    t.integer  "passing_completions"
    t.integer  "passing_interceptions"
    t.integer  "passing_long"
    t.boolean  "passing_long_td"
    t.integer  "passing_net_yards"
    t.integer  "passing_sacked"
    t.integer  "passing_touchdowns"
    t.integer  "passing_yards"
    t.integer  "passing_yards_lost"
    t.integer  "penalty_penalties"
    t.integer  "penalty_yards"
    t.integer  "possession_minutes"
    t.integer  "possession_seconds"
    t.integer  "punt_return_long"
    t.boolean  "punt_return_long_td"
    t.integer  "punt_return_touchdowns"
    t.integer  "punt_return_yards"
    t.integer  "punt_returns"
    t.integer  "punting_inside_20"
    t.integer  "punting_long"
    t.integer  "punting_return_yards"
    t.integer  "punting_returns"
    t.integer  "punting_touchbacks"
    t.integer  "punting_yards"
    t.integer  "punts"
    t.integer  "punts_blocked"
    t.integer  "receiving_long"
    t.boolean  "receiving_long_td"
    t.integer  "receiving_targets"
    t.integer  "receiving_tds"
    t.integer  "receiving_yards"
    t.integer  "receptions"
    t.integer  "red_zone_attempts"
    t.integer  "red_zone_made"
    t.string   "resource_uri"
    t.integer  "return_total_touchdowns"
    t.integer  "return_total_yards"
    t.integer  "rushing_attempts"
    t.integer  "rushing_long"
    t.boolean  "rushing_long_td"
    t.integer  "rushing_touchdowns"
    t.integer  "rushing_yards"
    t.integer  "safeties"
    t.string   "slug"
    t.string   "team"
    t.integer  "third_down_attempts"
    t.integer  "third_down_made"
    t.integer  "total_net_yards"
    t.integer  "total_plays"
    t.integer  "total_touchdowns"
    t.integer  "turnovers"
    t.integer  "two_point_conversions"
    t.integer  "two_point_conversions_attempted"
    t.datetime "updated"
    t.integer  "xp_attempts"
    t.integer  "xp_blocked"
    t.integer  "xp_made"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_teams", force: true do |t|
    t.boolean  "active"
    t.string   "alias"
    t.string   "city"
    t.string   "conference"
    t.integer  "conference_id"
    t.datetime "created"
    t.string   "division"
    t.integer  "division_id"
    t.integer  "global_id"
    t.integer  "team_id"
    t.boolean  "local_team"
    t.string   "logo_120x120"
    t.string   "logo_30x30"
    t.string   "logo_40x40"
    t.string   "logo_60x60"
    t.string   "name"
    t.string   "primary_color"
    t.string   "record"
    t.string   "resource_uri"
    t.string   "secondary_color"
    t.string   "slug"
    t.integer  "stats_id"
    t.integer  "total_defensive_rank"
    t.integer  "total_offensive_rank"
    t.integer  "total_passing_defense_rank"
    t.integer  "total_passing_offense_rank"
    t.integer  "total_rushing_defense_rank"
    t.integer  "total_rushing_offense_rank"
    t.datetime "updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "userID"
    t.string   "username"
    t.string   "phoneCred"
    t.integer  "won"
    t.integer  "lost"
    t.integer  "previousGamePlace"
    t.string   "leagueName"
    t.integer  "rosterID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weekplayerdata", force: true do |t|
    t.integer  "NFLPlayerID"
    t.integer  "SlotID"
    t.integer  "CurrentAuctionValue"
    t.integer  "FantasyPoints"
    t.integer  "Passyds"
    t.integer  "Rushyds"
    t.integer  "Rcvyds"
    t.integer  "Fumbles"
    t.integer  "TDPass"
    t.integer  "TwoPointPass"
    t.integer  "TwoPointRush"
    t.integer  "TDRush"
    t.integer  "TDRcv"
    t.integer  "TwoPointRcv"
    t.integer  "ExtraPoint"
    t.integer  "FieldGoal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
