BEGIN "mh#phend"

IF ~NumTimesTalkedTo(0)~
BEGIN first
  SAY @0
  IF ~~
    REPLY @1
    GOTO scrolls
  IF ~~
    REPLY @2
    GOTO scrolls
  IF ~~
    REPLY @3
    GOTO rude
END

IF ~~
BEGIN scrolls
  SAY @4
  IF ~~
    REPLY @5
    GOTO wizard
  IF ~~
    REPLY @6
    GOTO store
  IF ~~
    REPLY @7
    GOTO goodbye
END

IF ~~
BEGIN wizard
  SAY @8
  IF ~~
    REPLY @9
    GOTO store
  IF ~~
    REPLY @10
    GOTO goodbye
END

IF ~PartyHasItem("misc01")
    Global("mh#PhendraHide", "GLOBAL", 0)~
BEGIN hide1
  SAY @11
  IF ~NumItemsPartyGT("misc01", 4)~
    REPLY @12
    GOTO hide3
  IF ~~
    REPLY @13
    GOTO hide2
END

IF ~~
BEGIN hide2
  SAY @14
  IF ~~
    DO ~SetGlobal("mh#PhendraHide", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @15
    EXIT
END

IF ~~
BEGIN hide3
  SAY @16
  IF ~~
    DO ~TakePartyItemNum("misc01", 5)
        DestroyItem("misc01")
        SetGlobal("mh#PhendraHide", "GLOBAL", 2)
        SetGlobalTimer("mh#PhendraHideCraft", "GLOBAL", THREE_DAYS)~
    UNSOLVED_JOURNAL @17
    EXIT
END

IF ~~
BEGIN hide4
  SAY @18
  IF ~~
    EXIT
END

IF ~~
BEGIN hide5
  SAY @19
  IF ~~
    DO ~GiveItemCreate("mh#armr1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@15)
        EraseJournalEntry(@17)
        SetGlobal("mh#PhendraHide", "GLOBAL", 3)~
    SOLVED_JOURNAL @20
    EXIT
END

IF ~True()~
BEGIN default
  SAY @21
  IF ~NumItemsPartyGT("misc01", 4)
      Global("mh#PhendraHide", "GLOBAL", 1)~
    REPLY @22
    GOTO hide2
  IF ~Global("mh#PhendraHide", "GLOBAL", 2)
      GlobalTimerNotExpired("mh#PhendraHideCraft", "GLOBAL")~
    REPLY @23
    GOTO hide4
  IF ~Global("mh#PhendraHide", "GLOBAL", 2)
      GlobalTimerExpired("mh#PhendraHideCraft", "GLOBAL")~
    REPLY @23
    GOTO hide5
  IF ~~
    REPLY @24
    GOTO store
  IF ~~
    REPLY @25
    GOTO goodbye
END

IF ~~
BEGIN store
  SAY @26
  IF ~~
    DO ~StartStore("mh#phend", LastTalkedToBY())~
    EXIT
END

IF ~~
BEGIN goodbye
  SAY @27
  IF ~~
    EXIT
END

IF ~~
BEGIN rude
  SAY @28
  IF ~~
    EXIT
END


