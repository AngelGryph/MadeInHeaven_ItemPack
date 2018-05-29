// Patches to exiting dialog

ADD_TRANS_ACTION "halftr"
BEGIN 7 END	// State list
BEGIN END	// Transaction list (empty=all)
  ~SetGlobal("mh#GemOfSeeing", "GLOBAL", 2)~

ADD_TRANS_ACTION "halftr"
BEGIN 1 6 END	// State list
BEGIN END	// Transaction list (empty=all)
  ~SetGlobal("mh#GemOfSeeing", "GLOBAL", 1)~


// Dialog if player bought the Gem of Seeing.

BEGIN "mh#hlftr"

IF ~Global("mh#GemOfSeeing", "GLOBAL", 2)~
BEGIN caught_you
  SAY @0
  IF ~~
    REPLY @1
    GOTO friendly
  IF ~~
    REPLY @2
    GOTO hostile
END

IF ~~
BEGIN friendly
  SAY @3
  IF ~~
    REPLY @4
    GOTO story
  IF ~~
    REPLY @5
    GOTO hostile
END

IF ~~
BEGIN hostile
  SAY @6
  IF ~~
    REPLY @7
    GOTO story
  IF ~~
    REPLY @8
    GOTO violence
END

IF ~~
BEGIN violence
  SAY @9
  IF ~~
    DO ~ReputationInc(-2)
        Kill(Myself)~
    UNSOLVED_JOURNAL @10
    EXIT
END

IF ~~
BEGIN story
  SAY @11
  = @12
  = @13
  IF ~~
    REPLY @14
    GOTO wizards
  IF ~~
    REPLY @15
    GOTO wizards
  IF ~~
    REPLY @16
    GOTO violence
END

IF ~~
  BEGIN wizards
  SAY @17
  = @18
  IF ~~
    DO ~GiveItem("mh#comp3", LastTalkedToBy())
        EscapeArea()~
    UNSOLVED_JOURNAL @19
    EXIT
END


// Creating the gem - Thalantyr

EXTEND_BOTTOM "thalan" 1
  IF ~PartyHasItem("mh#comp3")~
    REPLY @20
    GOTO gem1
END


APPEND "thalan"

IF ~~
BEGIN gem1
  SAY @21
  = @22
  = @23
  IF ~PartyHasItem("misc42")
      PartyGoldGT(4999)~
    REPLY @24
    GOTO gem3
  IF ~~
    REPLY @25
    GOTO gem2
END

IF ~~
BEGIN gem2
  SAY @26
  IF ~~
    UNSOLVED_JOURNAL @27
    EXIT
END

IF ~~
BEGIN gem3
  SAY @28
  IF ~~
    DO ~TakePartyItem("mh#comp3")
        DestroyItem("mh#comp3")
	TakePartyItemNum("misc42", 1)
        DestroyItem("misc42")
	TakePartyGold(5000)
	DestroyGold(5000)
	EraseJournalEntry(@10)
	EraseJournalEntry(@19)
	EraseJournalEntry(@27)
	EraseJournalEntry(@36)
	GiveItemCreate("mh#amul4", LastTalkedToBy(Myself), 1, 0, 0)~
    SOLVED_JOURNAL @29
    EXIT
END

END	// APPEND Thalantyr
    

// Creating the gem - Halbazzer Drin

EXTEND_BOTTOM "halbaz" 0
  IF ~PartyHasItem("mh#comp3")~
    REPLY @20
    GOTO gem1
END


APPEND "halbaz"

IF ~~
BEGIN gem1
  SAY @30
  = @31
  = @32
  IF ~PartyHasItem("misc42")
      PartyGoldGT(4999)~
    REPLY @33
    GOTO gem3
  IF ~~
    REPLY @34
    GOTO gem2
END

IF ~~
BEGIN gem2
  SAY @35
  IF ~~
    UNSOLVED_JOURNAL @36
    EXIT
END

IF ~~
BEGIN gem3
  SAY @37
  IF ~~
    DO ~TakePartyItem("mh#comp3")
        DestroyItem("mh#comp3")
	TakePartyItemNum("misc42", 1)
        DestroyItem("misc42")
	TakePartyGold(5000)
	DestroyGold(5000)
	EraseJournalEntry(@10)
	EraseJournalEntry(@19)
	EraseJournalEntry(@27)
	EraseJournalEntry(@36)
	GiveItemCreate("mh#amul4", LastTalkedToBy(Myself), 1, 0, 0)~
    SOLVED_JOURNAL @38
    EXIT
END

END	// APPEND Halbazzer Drin


