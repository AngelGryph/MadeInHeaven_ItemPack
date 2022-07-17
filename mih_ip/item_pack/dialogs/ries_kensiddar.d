APPEND "%tutu_var%innkn2"

IF WEIGHT #-1 ~PartyHasItem("misc01") Global("mh#RiesWinterWolfHide", "GLOBAL", 0)~
BEGIN hide_offer
  SAY @0
  IF ~~
    REPLY @1
    GOTO hide_requirements
  IF ~~
    REPLY @2
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @3
    GOTO 0
END

IF ~~
BEGIN hide_requirements
  SAY @4
  IF ~NumItemsPartyGT("misc01", 2) PartyGoldGT(699)~
    REPLY @5
    GOTO hide_crafting
  IF ~~
    REPLY @6
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @3
    GOTO 0
END

IF ~~
BEGIN hide_crafting
  SAY @7
  IF ~~
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 2) SetGlobalTimer("mh#RiesWinterWolfHideWait", "GLOBAL", TWO_DAYS) TakePartyItemNum("misc01", 3) DestroyItem("misc01") DestroyItem("misc01") DestroyItem("misc01") TakePartyGold(700)~
    UNSOLVED_JOURNAL @8
    EXIT
END

IF ~~
BEGIN hide_finished
  SAY @9
  IF ~~
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 3) GiveItemCreate("mh#hide1", LastTalkedToBy(Myself), 0, 0, 0) EraseJournalEntry(@3) EraseJournalEntry(@8)~
    SOLVED_JOURNAL @10
    EXIT
END

END	// APPEND "%tutu_var%innkn2"


EXTEND_TOP "%tutu_var%innkn2" 0
  IF ~Global("mh#RiesWinterWolfHide", "GLOBAL", 1) NumItemsPartyGT("misc01", 1)~
    REPLY @12
    GOTO hide_requirements
  IF ~Global("mh#RiesWinterWolfHide", "GLOBAL", 2) GlobalTimerExpired("mh#RiesWinterWolfHideWait", "GLOBAL")~
    REPLY @11
    GOTO hide_finished
END


