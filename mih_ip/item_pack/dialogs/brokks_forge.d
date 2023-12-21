BEGIN "mh#brokk"

IF ~GlobalLT("Chapter", "GLOBAL", %bg1_chapter_3%)
    NumTimesTalkedTo(0)~
BEGIN nosell1
  SAY @1000
  IF ~~
    REPLY @1001
    GOTO nosell2
  IF ~~
    REPLY @1002
    GOTO nosell3
  IF ~~
    REPLY @1003
    GOTO nosell3
END

IF ~~
BEGIN nosell2
  SAY @1004
  IF ~~
    UNSOLVED_JOURNAL @1005
    EXIT
END

IF ~~
BEGIN nosell3
  SAY @1006
  IF ~~
    UNSOLVED_JOURNAL @1005
    EXIT
END

IF ~GlobalLT("Chapter", "GLOBAL", %bg1_chapter_3%)
    NumTimesTalkedToGT(0)~
BEGIN nosell4
  SAY @1007
  IF ~~
    EXIT
END

IF ~GlobalGT("Chapter", "GLOBAL", %bg1_chapter_2%)
    Global("mh#BrokkVambrace", "GLOBAL", 0)~
BEGIN vambrace1
  SAY @1008
  = @1009
  IF ~~
    REPLY @1010
    GOTO vambrace2
  IF ~~
    REPLY @1011
    GOTO vambrace3
END

IF ~~
BEGIN vambrace2
  SAY @1012
  IF ~~
    GOTO vambrace4
END

IF ~~
BEGIN vambrace3
  SAY @1013
  IF ~~
    GOTO vambrace4
END

IF ~~
BEGIN vambrace4
  SAY @1014
  = @1015
  IF ~~
    DO ~GiveItemCreate("mh#brac1", LastTalkedToBy(Myself), 0, 0, 0)
        SetGlobal("mh#BrokkVambrace", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @1016
    EXIT
END

IF ~GlobalGT("Chapter", "GLOBAL", %bg1_chapter_3%)
    Global("mh#BrokkGirdle", "GLOBAL", 0)~
BEGIN girdle1
  SAY @1017
  = @1018
  = @1019
  IF ~~
    DO ~GiveItemCreate("mh#belt1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@1005)
        EraseJournalEntry(@1016)
        SetGlobal("mh#BrokkGirdle", "GLOBAL", 1)~
    SOLVED_JOURNAL @1020
    EXIT
END

IF ~GlobalGT("Chapter", "GLOBAL", %bg1_chapter_5%)
    Reputation(Player1, 20)
    Or(6)
      Class(Player1, PALADIN)
      Class(Player2, PALADIN)
      Class(Player3, PALADIN)
      Class(Player4, PALADIN)
      Class(Player5, PALADIN)
      Class(Player6, PALADIN)
    Global("mh#BrokkHolySword", "GLOBAL", 0)~
BEGIN holy_sword
  SAY @1091
  = @1092
  = @1093
  = @1094
  IF ~~
    DO ~GiveItemCreate("mh#swrda", LastTalkedToBy(Myself), 0, 1, 1)
        SetGlobal("mh#BrokkHolySword", "GLOBAL", 1)~
    SOLVED_JOURNAL @1095
  EXIT
END

IF ~PartyHasItem("mh#comp1")
    Global("mh#BrokkMeteor", "GLOBAL", 0)~
BEGIN meteor1
  SAY @1021
  = @1022
  IF ~PartyHasItem("misc41")
      PartyGoldGT(2999)~
    REPLY @1023
    GOTO meteor3
  IF ~~
    REPLY @1024
    GOTO meteor2
END

IF ~~
BEGIN meteor2
  SAY @1025
  IF ~~
    DO ~SetGlobal("mh#BrokkMeteor", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @1026
    EXIT
END

IF ~~
BEGIN meteor3
  SAY @1027
  IF ~~
    DO ~TakePartyItem("mh#comp1")
        DestroyItem("mh#comp1")
        TakePartyItemNum("misc41", 1)
        DestroyItem("misc41")
	TakePartyGold(3000)
	DestroyGold(3000)
	SetGlobal("mh#BrokkMeteor", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkMeteorForge", "GLOBAL", TWELVE_HOURS)~
    UNSOLVED_JOURNAL @1028
    EXIT
END

IF ~Global("mh#BrokkMeteor", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkMeteorForge", "GLOBAL")~
BEGIN meteor4
  SAY @1029
  IF ~~
    DO ~GiveItemCreate("mh#shld1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@1026)
        EraseJournalEntry(@1028)
        SetGlobal("mh#BrokkMeteor", "GLOBAL", 3)~
    SOLVED_JOURNAL @1030
    EXIT
END

IF ~PartyHasItem("plat06%eet_var%")
    Global("mh#BrokkAnkheg", "GLOBAL", 0)~
BEGIN ankheg1
  SAY @1031
  = @1032
  IF ~PartyHasItem("misc12")
      PartyGoldGT(1999)~
    REPLY @1033
    GOTO ankheg3
  IF ~~
    REPLY @1034
    GOTO ankheg2
END

IF ~~
BEGIN ankheg2
  SAY @1035
  IF ~~
    DO ~SetGlobal("mh#BrokkAnkheg", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @1036
    EXIT
END

IF ~~
BEGIN ankheg3
  SAY @1037
  IF ~~
    DO ~TakePartyItem("misc12")
        DestroyItem("misc12")
	TakePartyGold(2000)
	DestroyGold(2000)
	SetGlobal("mh#BrokkAnkheg", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkAnkhegForge", "GLOBAL", TWELVE_HOURS)~
    UNSOLVED_JOURNAL @1038
    EXIT
END

IF ~PartyHasItem("mh#comp5")
    Global("mh#BrokkAlicorn", "GLOBAL", 0)~
BEGIN alicorn1
  SAY @1065
  =
  @1066
  IF ~PartyGoldGT(1999)~
    REPLY @1067
    GOTO alicorn3
  IF ~~
    REPLY @1068
    GOTO alicorn2
END

IF ~~
BEGIN alicorn2
  SAY @1069
  IF ~~
    DO ~SetGlobal("mh#BrokkAlicorn", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @1070
    EXIT
END

IF ~~
BEGIN alicorn3
  SAY @1071
  IF ~~
    DO ~TakePartyItem("mh#comp5")
        DestroyItem("mh#comp5")
	TakePartyGold(2000)
	DestroyGold(2000)
	SetGlobal("mh#BrokkAlicorn", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkAlicornForge", "GLOBAL", TWELVE_HOURS)~
    UNSOLVED_JOURNAL @1072
    EXIT
END

IF ~Global("mh#BrokkAlicorn", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkAlicornForge", "GLOBAL")~
BEGIN alicorn4
  SAY @1073
  IF ~~
    DO ~GiveItemCreate("mh#sper1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@1070)
        EraseJournalEntry(@1072)
        SetGlobal("mh#BrokkAlicorn", "GLOBAL", 3)~
    SOLVED_JOURNAL @1074
    EXIT
END

IF ~Global("mh#BrokkAnkheg", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkAnkhegForge", "GLOBAL")~
BEGIN ankheg4
  SAY @1039
  IF ~~
    DO ~GiveItemCreate("mh#shld2", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@1036)
        EraseJournalEntry(@1038)
        SetGlobal("mh#BrokkAnkheg", "GLOBAL", 3)~
    SOLVED_JOURNAL @1040
    EXIT
END

IF ~PartyHasItem("mh#comp4")
    Global("mh#BrokkKatana", "GLOBAL", 0)~
BEGIN katana1
  SAY @1055
  =
  @1056
  IF ~PartyHasItem("misc42")
      PartyGoldGT(999)~
    REPLY @1057
    GOTO katana3
  IF ~~
    REPLY @1058
    GOTO katana2
END

IF ~~
BEGIN katana2
  SAY @1059
  IF ~~
    DO ~SetGlobal("mh#BrokkKatana", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @1060
    EXIT
END

IF ~~
BEGIN katana3
  SAY @1061
  =
  @1062
  IF ~~
    DO ~TakePartyItemNum("misc42", 1)
        DestroyItem("misc42")
        TakePartyItem("mh#comp4")
        DestroyItem("mh#comp4")
	TakePartyGold(1000)
	DestroyGold(1000)
	GiveItemCreate("mh#swrd8", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@1060)
        SetGlobal("mh#BrokkKatana", "GLOBAL", 2)~
    SOLVED_JOURNAL @1063
    EXIT
END

IF ~PartyHasItem("mh#comp2")
    Global("mh#BrokkArandur", "GLOBAL", 0)~
BEGIN arandur1
  SAY @1076
  IF ~PartyGoldGT(19999)~
    REPLY @1077
    GOTO arandur3
  IF ~PartyGoldGT(19999)~
    REPLY @1078
    GOTO arandur4
  IF ~~
    REPLY @1079
    GOTO arandur2
END

IF ~~
BEGIN arandur2
  SAY @1080
  IF ~~
    DO ~SetGlobal("mh#BrokkArandur", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @1081
    EXIT
END

IF ~~
BEGIN arandur3
  SAY @1082
  =
  @1083
  IF ~~
    DO ~TakePartyItem("mh#comp2")
        DestroyItem("mh#com2")
	TakePartyGold(20000)
	DestroyGold(20000)
	GiveItemCreate("mh#plat1", LastTalkedToBy(Myself), 0, 0, 0)
	EraseJournalEntry(@1081)
	DayNight(MIDNIGHT)
	SetGlobal("mh#BrokkArandur", "GLOBAL", 2)~
    SOLVED_JOURNAL @1084
    EXIT
END
    
IF ~~
BEGIN arandur4
  SAY @1085
  =
  @1086
  =
  @1083
  IF ~~
    DO ~TakePartyItem("mh#comp2")
        DestroyItem("mh#com2")
	TakePartyGold(20000)
	DestroyGold(20000)
	GiveItemCreate("mh#chan2", LastTalkedToBy(Myself), 0, 0, 0)
	EraseJournalEntry(@1081)
	DayNight(MIDNIGHT)
	SetGlobal("mh#BrokkArandur", "GLOBAL", 2)~
    SOLVED_JOURNAL @1087
    EXIT
END

IF ~True()~
BEGIN default
  SAY @1041
  IF ~Global("mh#BrokkMeteor", "GLOBAL", 1)
      PartyHasItem("mh#comp1")
      PartyHasItem("misc41")
      PartyGoldGT(2999)~
    REPLY @1042
    GOTO meteor3
  IF ~Global("mh#BrokkAnkheg", "GLOBAL", 1)
      PartyHasItem("misc12")
      PartyGoldGT(1999)~
    REPLY @1043
    GOTO ankheg3
  IF ~Global("mh#BrokkKatana", "GLOBAL", 1)
      PartyHasItem("mh#comp4")
      PartyHasItem("misc42")
      PartyGoldGT(999)~
    REPLY @1064
    GOTO katana3
  IF ~Global("mh#BrokkAlicorn", "GLOBAL", 1)
      PartyHasItem("mh#comp5")
      PartyGoldGT(1999)~
    REPLY @1075
    GOTO alicorn3
  IF ~Global("mh#BrokkArandur", "GLOBAL", 1)~
    REPLY @1088
    GOTO arandur1
  IF ~~
    REPLY @1044
    GOTO store
  IF ~~
    REPLY @1045
    GOTO goodbye
  IF ~Global("mh#BrokkChat", "GLOBAL", 0)~
    REPLY @1046
    GOTO chat1
  IF ~Global("mh#BrokkChat", "GLOBAL", 1)~
    REPLY @1047
    GOTO chat2
END

IF ~~
BEGIN store
  SAY @1048
  IF ~~
    DO ~StartStore("mh#brokk", LastTalkedToBy(Myself))~
    EXIT
END

IF ~~
BEGIN goodbye
  SAY @1049
  IF ~~
    EXIT
END

IF ~~
BEGIN chat1
  SAY @1050
  IF ~~
    REPLY @1051
    DO ~SetGlobal("mh#BrokkChat", "GLOBAL", 1)~
    GOTO goodbye
END

IF ~~
BEGIN chat2
  SAY @1052
  = @1053
  IF ~~
    REPLY @1054
    DO ~SetGlobal("mh#BrokkChat", "GLOBAL", 2)~
    GOTO goodbye
END


