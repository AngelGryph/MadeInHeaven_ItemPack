REPLACE_TRANS_ACTION "udsilver"
BEGIN 41 END	// State(s)
BEGIN END	// Transaction(s)
 ~GiveItemCreate("xbow10",LastTalkedToBy,1,1,1)~ ~~


APPEND "udsilver"

IF ~~
BEGIN choose_reward
  SAY @0
  IF ~~
    REPLY @1
    GOTO reward_crossbow
  IF ~~
    REPLY @2
    GOTO reward_mace
  IF ~~
    REPLY @3
    GOTO reward_scroll
  IF ~~
    REPLY @4
    GOTO reward_elixir
  IF ~~
    REPLY @5
    GOTO reward_gold
END

IF ~~
BEGIN reward_crossbow
  SAY @6
  IF ~~
    REPLY @7
    DO ~GiveItemCreate("xbow10", LastTalkedToBy(Myself), 0, 0, 0)~
    GOTO reward_given
  IF ~~
    REPLY @8
    GOTO choose_reward
END

IF ~~
BEGIN reward_mace
  SAY @9
  IF ~~
    REPLY @7
    DO ~GiveItemCreate("mh#mace2", LastTalkedToBy(Myself), 0, 1, 0)~
    GOTO reward_given
  IF ~~
    REPLY @8
    GOTO choose_reward
END

IF ~~
BEGIN reward_scroll
  SAY @10
  IF ~~
    REPLY @7
    DO ~GiveItemCreate("mh#scrl2", LastTalkedToBy(Myself), 1, 0, 0)~
    GOTO reward_given
  IF ~~
    REPLY @8
    GOTO choose_reward
END

IF ~~
BEGIN reward_elixir
  SAY @11
  IF ~~
    REPLY @7
    DO ~GiveItemCreate("mh#potn5", LastTalkedToBy(Myself), 1, 0, 0)~
    GOTO reward_given
  IF ~~
    REPLY @8
    GOTO choose_reward
END

IF ~~
BEGIN reward_gold
  SAY @13
  IF ~~
    REPLY @7
    DO ~GiveGoldForce(7000)~
    GOTO reward_given
  IF ~~
    REPLY @8
    GOTO choose_reward
END

IF ~~
BEGIN reward_given
  SAY @12
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


