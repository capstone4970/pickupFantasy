--passyds function
create or replace function
calc_passydpoints(yds integer)
RETURNS integer as $$
	SELECT $1 / 25 as result;
$$ Language SQL;

--rushyds function
create or replace function
calc_rushydpoints(yds integer)
RETURNS integer as $$
	SELECT $1 / 10 as result;
$$ Language SQL;

--rcvyds function
create or replace function
calc_rcvydpoints(yds integer)
RETURNS integer as $$
	SELECT $1 / 10 as result;
$$ Language SQL;

--fumble points function (negative)
create or replace function
calc_fumblepoints(fumbles integer)
RETURNS integer as $$
	SELECT $1 * -2 as result;
$$ Language SQL;

--tdpass function
create or replace function
calc_tdpasspoints(tds integer)
RETURNS integer as $$
	SELECT $1 * 4 as result;
$$ Language SQL;

--tdpass 2 point conversion
create or replace function
calc_tdpasstwopointconv(twopointconv integer)
RETURNS integer as $$
	SELECT $1 * 2 as result;
$$ Language SQL;

--td rush 2 point conversion
create or replace function
calc_tdrushtwopointconv(twopointconv integer)
RETURNS integer as $$
	SELECT $1 * 2 as result;
$$ Language SQL;

--td rush yds
create or replace function
calc_tdrushpoints(tds integer)
RETURNS integer as $$
	SELECT $1 * 6 as result;
$$ Language SQL;

--td receiving yards
create or replace function
calc_tdrcvpoints(tds integer)
RETURNS integer as $$
	SELECT $1 * 6 as result;
$$ Language SQL;

--rcv two point conversion
create or replace function
calc_tdrcvtwopointconv(twopointconv integer)
RETURNS integer as $$
	SELECT $1 * 2 as result;
$$ Language SQL;

--extra points
create or replace function
calc_extrapoint(extrapoint integer)
RETURNS integer as $$
	SELECT $1 as result;
$$ Language SQL;

--field goals
create or replace function
calc_fieldgoalpoint(fldgoal integer)
RETURNS integer as $$
	SELECT $1 * 4 as result;
$$ Language SQL;

create or replace function calc_fantasy_points() returns trigger as $$
	declare
	newTotalPoints INTEGER;
	begin
		newTotalPoints := OLD."FantasyPoints";
		IF NEW."Passyds" != OLD."Passyds" THEN
			newTotalPoints := newTotalPoints - calc_passydpoints(OLD."Passyds");
			newTotalPoints := newTotalPoints + calc_passydpoints(NEW."Passyds");
		END IF;
		IF NEW."Rushyds" != OLD."Rushyds" THEN
			newTotalPoints := newTotalPoints - calc_rushydpoints(OLD."Rushyds");
			newTotalPoints := newTotalPoints + calc_rushydpoints(NEW."Rushyds");
		END IF;
		IF NEW."Rcvyds" != OLD."Rcvyds" THEN
			newTotalPoints := newTotalPoints - calc_rcvydpoints(OLD."Rcvyds");
			newTotalPoints := newTotalPoints + calc_rcvydpoints(NEW."Rcvyds");
		END IF;
		IF NEW."Fumbles" != OLD."Fumbles" THEN
			newTotalPoints := newTotalPoints - calc_fumblepoints(OLD."Fumbles");
			newTotalPoints := newTotalPoints + calc_fumblepoints(NEW."Fumbles");
		END IF;
		IF NEW."TDPass" != OLD."TDPass" THEN
			newTotalPoints := newTotalPoints - calc_tdpasspoints(OLD."TDPass");
			newTotalPoints := newTotalPoints + calc_tdpasspoints(NEW."TDPass");
		END IF;
		IF NEW."TwoPointPass" != OLD."TwoPointPass" THEN
			newTotalPoints := newTotalPoints - calc_tdpasstwopointconv(OLD."TwoPointPass");
			newTotalPoints := newTotalPoints + calc_tdpasstwopointconv(NEW."TwoPointPass");
		END IF;
		IF NEW."TwoPointRush" != OLD."TwoPointRush" THEN
			newTotalPoints := newTotalPoints - calc_tdrushtwopointconv(OLD."TwoPointRush");
			newTotalPoints := newTotalPoints + calc_tdrushtwopointconv(NEW."TwoPointRush");
		END IF;
		IF NEW."TDRush" != OLD."TDRush" THEN
			newTotalPoints := newTotalPoints - calc_tdrushpoints(OLD."TDRush");
			newTotalPoints := newTotalPoints + calc_tdrushpoints(NEW."TDRush");
		END IF;
		IF NEW."TDRcv" != OLD."TDRcv" THEN
			newTotalPoints := newTotalPoints - calc_tdrcvpoints(OLD."TDRcv");
			newTotalPoints := newTotalPoints + calc_tdrcvpoints(NEW."TDRcv");
		END IF;
		IF NEW."TwoPointRcv" != OLD."TwoPointRcv" THEN
			newTotalPoints := newTotalPoints - calc_tdrcvtwopointconv(OLD."TwoPointRcv");
			newTotalPoints := newTotalPoints + calc_tdrcvtwopointconv(NEW."TwoPointRcv");
		END IF;
		IF NEW."ExtraPoint" != OLD."ExtraPoint" THEN
			newTotalPoints := newTotalPoints - calc_extrapoint(OLD."ExtraPoint");
			newTotalPoints := newTotalPoints + calc_extrapoint(NEW."ExtraPoint");
		END IF;
		IF NEW."FieldGoal" != OLD."FieldGoal" THEN
			newTotalPoints := newTotalPoints - calc_fieldgoalpoint(OLD."FieldGoal");
			newTotalPoints := newTotalPoints + calc_fieldgoalpoint(NEW."FieldGoal");
		END IF;	
		NEW."FantasyPoints"  := newTotalPoints;
	return NEW;
	end
$$ LANGUAGE plpgsql;

DROP TRIGGER calc_fantasy_points on weekplayerdata;
CREATE TRIGGER calc_fantasy_points BEFORE UPDATE ON weekplayerdata
FOR EACH ROW EXECUTE PROCEDURE calc_fantasy_points();





