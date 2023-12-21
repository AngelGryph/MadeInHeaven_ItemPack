APPEND "%tutu_var%innkn2"

IF WEIGHT #-1 ~PartyHasItem("misc01") Global("mh#RiesWinterWolfHide", "GLOBAL", 0)~
BEGIN hide_offer
  SAY @2000
  IF ~~
    REPLY @2001
    GOTO hide_requirements
  IF ~~
    REPLY @2002
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @2003
    GOTO 0
END

IF ~~
BEGIN hide_requirements
  SAY @2004
  IF ~NumItemsPartyGT("misc01", 2) PartyGoldGT(699)~
    REPLY @2005
    GOTO hide_crafting
  IF ~~
    REPLY @2006
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @2003
    GOTO 0
END

IF ~~
BEGIN hide_crafting
  SAY @2007
  IF ~~
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 2) SetGlobalTimer("mh#RiesWinterWolfHideWait", "GLOBAL", TWO_DAYS) TakePartyItemNum("misc01", 3) DestroyItem("misc01") DestroyItem("misc01") DestroyItem("misc01") TakePartyGold(700)~
    UNSOLVED_JOURNAL @2008
    EXIT
END

IF ~~
BEGIN hide_finished
  SAY @2009
  IF ~~
    DO ~SetGlobal("mh#RiesWinterWolfHide", "GLOBAL", 3) GiveItemCreate("mh#hide1", LastTalkedToBy(Myself), 0, 0, 0) EraseJournalEntry(@2003) EraseJournalEntry(@2008)~
    SOLVED_JOURNAL @2010
    EXIT
END

END	// APPEND "%tutu_var%innkn2"


EXTEND_TOP "%tutu_var%innkn2" 0
  IF ~Global("mh#RiesWinterWolfHide", "GLOBAL", 1) NumItemsPartyGT("misc01", 1)~
    REPLY @2012
    GOTO hide_requirements
  IF ~Global("mh#RiesWinterWolfHide", "GLOBAL", 2) GlobalTimerExpired("mh#RiesWinterWolfHideWait", "GLOBAL")~
    REPLY @2011
    GOTO hide_finished
END


