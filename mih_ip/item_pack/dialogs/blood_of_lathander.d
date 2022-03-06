APPEND "bharval"

IF ~~
BEGIN blood_hint_lathander
  SAY @0
  = @1
  COPY_TRANS "bharval" 57
END

END	// APPEND "bharval"


EXTEND "bharval" 57
  IF ~Global("SculptorDone", "GLOBAL", 1) Global("StealingPlot", "GLOBAL", 4)~
    GOTO blood_hint_lathander
END


APPEND "bhoisig"

IF ~~
BEGIN blood_hint_helm
  SAY @2
  COPY_TRANS "bhoisig" 61
END

END	// APPEND "bhoisig"


EXTEND "bhoisig" 61
  IF ~Global("SculptorDone", "GLOBAL", 1) Global("StealingPlot", "GLOBAL", 4)~
    GOTO blood_hint_helm
END


APPEND "scsain"

IF WEIGHT #-1 ~InPartySlot(LastTalkedToBy(Myself), 0) Global("SculptorDone", "GLOBAL", 1) Global("StealingPlot", "GLOBAL", 4) Global("Chapter", "GLOBAL", 6) !Dead("c6bodhi") Global("mh#ObtainedBlood", "LOCALS", 0) Global("Stripped", "GLOBAL", 0)~
BEGIN show_blood
  SAY @3
  = @4
  IF ~~
    REPLY @5
    GOTO the_blood
  IF ~~
    REPLY @6
    GOTO the_blood
END

IF ~~
BEGIN the_blood
  SAY @7
  = @8
  = @9
  = @10
  = @11
  IF ~~
    DO ~GiveItemCreate("mh#ioun7", Player1, 4, 1, 1) SetGlobal("mh#ObtainedBlood", "LOCALS", 1) AddexperienceParty(10000)~
    JOURNAL @13
    GOTO good_luck
END

IF ~~
BEGIN good_luck
  SAY @12
  IF ~~
    EXIT
END

END	// APPEND "scsain"


