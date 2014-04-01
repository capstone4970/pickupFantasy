select * from seasonplayerdata order by "FantasyPosition";

delete from seasonplayerdata where "FantasyPosition"='DB';
delete from weekplayerdata as w where w.id NOT IN (select id from seasonplayerdata);
delete from seasonplayerdata where "FantasyPosition"='DL';
delete from weekplayerdata as w where w.id NOT IN (select id from seasonplayerdata);
delete from seasonplayerdata where "FantasyPosition"='LB';
delete from weekplayerdata as w where w.id NOT IN (select id from seasonplayerdata);
delete from seasonplayerdata where "FantasyPosition"='LS';
delete from weekplayerdata as w where w.id NOT IN (select id from seasonplayerdata);
delete from seasonplayerdata where "FantasyPosition"='OL';
delete from weekplayerdata as w where w.id NOT IN (select id from seasonplayerdata);
delete from seasonplayerdata where "FantasyPosition"='P';
delete from weekplayerdata as w where w.id NOT IN (select id from seasonplayerdata);
