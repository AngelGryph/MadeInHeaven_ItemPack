REPLACE_TRANS_ACTION "udsilver"
BEGIN 41 END	// State(s)
BEGIN END	// Transaction(s)
 ~GiveItemCreate("xbow10",LastTalkedToBy,1,1,1)~ ~~


APPEND "udsilver"

IF ~~
BEGIN choose_reward
  SAY @5000
  IF ~~
    REPLY @5001
    GOTO reward_crossbow
  IF ~~
    REPLY @5002
    GOTO reward_mace
  IF ~~
    REPLY @5004
    GOTO reward_elixir
  IF ~~
    REPLY @5005
    GOTO reward_gold
END

IF ~~
BEGIN reward_crossbow
  SAY @5006
  IF ~~
    REPLY @5007
    DO ~GiveItemCreate("xbow10", LastTalkedToBy(Myself), 0, 0, 0)~
    GOTO reward_given
  IF ~~
    REPLY @5008
    GOTO choose_reward
END

IF ~~
BEGIN reward_mace
  SAY @5009
  IF ~~
    REPLY @5007
    DO ~GiveItemCreate("mh#mace2", LastTalkedToBy(Myself), 0, 1, 0)~
    GOTO reward_given
  IF ~~
    REPLY @5008
    GOTO choose_reward
END

IF ~~
BEGIN reward_elixir
  SAY @5011
  IF ~~
    REPLY @5007
    DO ~GiveItemCreate("mh#potn5", LastTalkedToBy(Myself), 1, 0, 0)~
    GOTO reward_given
  IF ~~
    REPLY @5008
    GOTO choose_reward
END

IF ~~
BEGIN reward_gold
  SAY @5013
  IF ~~
    REPLY @5007
    DO ~GiveGoldForce(7000)~
    GOTO reward_given
  IF ~~
    REPLY @5008
    GOTO choose_reward
END

IF ~~
BEGIN reward_given
  SAY @5012
  COPY_TRANS "udsilver" 41
END

END	// APPEND "udsilver"


ADD_TRANS_TRIGGER "udsilver" 41
 ~False()~


ALTER_TRANS "udsilver"
BEGIN 41 END	// State(s)
BEGIN 0 END	// Transaction(s)
BEGIN
  "TRIGGER"	~~
  "EPILOGUE"	~GOTO choose_reward~
END


