DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Rosters;
DROP TABLE IF EXISTS SeasonPlayerData;
DROP TABLE IF EXISTS WeekPlayerData;
DROP TABLE IF EXISTS GamsOfWeek;
DROP TABLE IF EXISTS Leagues;

CREATE TABLE Leagues(
	leagueID				SERIAL,
	name					VARCHAR(15),
	password				VARCHAR(15),
	numPlayers				INT CHECK (numPlayers > 0 AND numPlayers < 7),
	member1					VARCHAR(15),
	member2					VARCHAR(15),
	member3					VARCHAR(15),
	member4					VARCHAR(15),
	member5					VARCHAR(15),
	member6					VARCHAR(15),
	gamesOfWeekIdentifier 	INTEGER,
	PRIMARY KEY(leagueID)
);

CREATE TABLE GamesOfWeek(
	slotID				INTEGER,
	time				TIME,
	date				DATE,
	team1				VARCHAR(20),
	team2				VARCHAR(20),
	PRIMARY KEY(slotID)
);

CREATE TABLE WeekPlayerData(
	nfldataID			INTEGER,
	slotID				INTEGER,
	auctionValue		INTEGER,
	fantasyPoints		INTEGER,
	passyds				INTEGER,
	rushyds				INTEGER,
	rcvyds				INTEGER,
	fumbles				INTEGER,
	tdpass				INTEGER,
	twopointpass		INTEGER,
	twopointrush		INTEGER,
	tdrush				INTEGER,
	tdrcv				INTEGER,
	twopointrcv			INTEGER,
	extrapoint			INTEGER,
	fieldgoal			INTEGER,
	PRIMARY KEY(nfldataID),
	FOREIGN KEY(slotID) REFERENCES GamesOfWeek
);

CREATE TABLE SeasonPlayerData(
	nfldataID				INTEGER,
	team					VARCHAR(15),
	position				VARCHAR(2),
	playerNum				INTEGER,
	fname					VARCHAR(20),
	lname					VARCHAR(20),
	initialAUctionValue		INTEGER,
	currentAuctionValue		INTEGER,
	projFantasyPoints		INTEGER,
	projFantasyPointsMark	INTEGER,
	lastPlayedPoints		INTEGER,
	PRIMARY KEY(nfldataID)
);


CREATE TABLE Rosters(
	rosterID			SERIAL,
	username				VARCHAR(15),
	leagueID			INTEGER,
	quarterback			INTEGER,
	flex				INTEGER,
	kicker				INTEGER,
	wideReceiver		INTEGER,
	runningBack			INTEGER,
FOREIGN KEY(quarterback) REFERENCES WeekPlayerData,
FOREIGN KEY(flex) REFERENCES WeekPlayerData,
FOREIGN KEY(kicker) REFERENCES WeekPlayerData,
FOREIGN KEY(wideReceiver) REFERENCES WeekPlayerData,
FOREIGN KEY(runningBack) REFERENCES WeekPlayerData,
--FOREIGN KEY(username) REFERENCES Users,
FOREIGN KEY(leagueID) REFERENCES Leagues,
PRIMARY KEY(rosterID)
);




CREATE TABLE Users(
	userID				SERIAL,
	username 			VARCHAR(15)		UNIQUE,
	phoneCred			VARCHAR(20),
	won					INTEGER,
	lost				INTEGER,
	previousGamePlace	INTEGER,
	leagueID			INTEGER,
	rosterID			INTEGER,
	FOREIGN KEY(rosterID) REFERENCES Rosters,
	FOREIGN KEY(leagueID) REFERENCES Leagues,
	PRIMARY KEY (userID)
);


ALTER TABLE Rosters ADD CONSTRAINT userForeignKey FOREIGN KEY (username) REFERENCES Users(username);
