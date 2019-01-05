BEGIN "mh#brokk"

IF ~GlobalLT("Chapter", "GLOBAL", %tutu_chapter_3%)
    NumTimesTalkedTo(0)~
BEGIN nosell1
  SAY @0
  IF ~~
    REPLY @1
    GOTO nosell2
  IF ~~
    REPLY @2
    GOTO nosell3
  IF ~~
    REPLY @3
    GOTO nosell3
END

IF ~~
BEGIN nosell2
  SAY @4
  IF ~~
    UNSOLVED_JOURNAL @5
    EXIT
END

IF ~~
BEGIN nosell3
  SAY @6
  IF ~~
    UNSOLVED_JOURNAL @5
    EXIT
END

IF ~GlobalLT("Chapter", "GLOBAL", %tutu_chapter_3%)
    NumTimesTalkedToGT(0)~
BEGIN nosell4
  SAY @7
  IF ~~
    EXIT
END

IF ~GlobalGT("Chapter", "GLOBAL", %tutu_chapter_2%)
    Global("mh#BrokkVambrace", "GLOBAL", 0)~
BEGIN vambrace1
  SAY @8
  = @9
  IF ~~
    REPLY @10
    GOTO vambrace2
  IF ~~
    REPLY @11
    GOTO vambrace3
END

IF ~~
BEGIN vambrace2
  SAY @12
  IF ~~
    GOTO vambrace4
END

IF ~~
BEGIN vambrace3
  SAY @13
  IF ~~
    GOTO vambrace4
END

IF ~~
BEGIN vambrace4
  SAY @14
  = @15
  IF ~~
    DO ~GiveItemCreate("mh#brac1", LastTalkedToBy(Myself), 0, 0, 0)
        SetGlobal("mh#BrokkVambrace", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @16
    EXIT
END

IF ~GlobalGT("Chapter", "GLOBAL", %tutu_chapter_3%)
    Global("mh#BrokkGirdle", "GLOBAL", 0)~
BEGIN girdle1
  SAY @17
  = @18
  = @19
  IF ~~
    DO ~GiveItemCreate("mh#belt1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@5)
        EraseJournalEntry(@16)
        SetGlobal("mh#BrokkGirdle", "GLOBAL", 1)~
    SOLVED_JOURNAL @20
    EXIT
END

IF ~PartyHasItem("mh#comp1")
    Global("mh#BrokkMeteor", "GLOBAL", 0)~
BEGIN meteor1
  SAY @21
  = @22
  IF ~PartyHasItem("misc41")
      PartyGoldGT(2999)~
    REPLY @23
    GOTO meteor3
  IF ~~
    REPLY @24
    GOTO meteor2
END

IF ~~
BEGIN meteor2
  SAY @25
  IF ~~
    DO ~SetGlobal("mh#BrokkMeteor", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @26
    EXIT
END

IF ~~
BEGIN meteor3
  SAY @27
  IF ~~
    DO ~TakePartyItem("mh#comp1")
        DestroyItem("mh#comp1")
        TakePartyItemNum("misc41", 1)
        DestroyItem("misc41")
	TakePartyGold(3000)
	DestroyGold(3000)
	SetGlobal("mh#BrokkMeteor", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkMeteorForge", "GLOBAL", TWELVE_HOURS)~
    UNSOLVED_JOURNAL @28
    EXIT
END

IF ~Global("mh#BrokkMeteor", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkMeteorForge", "GLOBAL")~
BEGIN meteor4
  SAY @29
  IF ~~
    DO ~GiveItemCreate("mh#shld1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@26)
        EraseJournalEntry(@28)
        SetGlobal("mh#BrokkMeteor", "GLOBAL", 3)~
    SOLVED_JOURNAL @30
    EXIT
END

IF ~PartyHasItem("plat06%eet_var%")
    Global("mh#BrokkAnkheg", "GLOBAL", 0)~
BEGIN ankheg1
  SAY @31
  = @32
  IF ~PartyHasItem("misc12")
      PartyGoldGT(1999)~
    REPLY @33
    GOTO ankheg3
  IF ~~
    REPLY @34
    GOTO ankheg2
END

IF ~~
BEGIN ankheg2
  SAY @35
  IF ~~
    DO ~SetGlobal("mh#BrokkAnkheg", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @36
    EXIT
END

IF ~~
BEGIN ankheg3
  SAY @37
  IF ~~
    DO ~TakePartyItem("misc12")
        DestroyItem("misc12")
	TakePartyGold(2000)
	DestroyGold(2000)
	SetGlobal("mh#BrokkAnkheg", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkAnkhegForge", "GLOBAL", TWELVE_HOURS)~
    UNSOLVED_JOURNAL @38
    EXIT
END

IF ~Global("mh#BrokkAnkheg", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkAnkhegForge", "GLOBAL")~
BEGIN ankheg4
  SAY @39
  IF ~~
    DO ~GiveItemCreate("mh#shld2", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@36)
        EraseJournalEntry(@38)
        SetGlobal("mh#BrokkAnkheg", "GLOBAL", 3)~
    SOLVED_JOURNAL @40
    EXIT
END

IF ~PartyHasItem("mh#comp4")
    Global("mh#BrokkKatana", "GLOBAL", 0)~
BEGIN katana1
  SAY @55
  =
  @56
  IF ~PartyHasItem("misc42")
      PartyGoldGT(999)~
    REPLY @57
    GOTO katana3
  IF ~~
    REPLY @58
    GOTO katana2
END

IF ~~
BEGIN katana2
  SAY @59
  IF ~~
    DO ~SetGlobal("mh#BrokkKatana", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @60
    EXIT
END

IF ~~
BEGIN katana3
  SAY @61
  =
  @62
  IF ~~
    DO ~TakePartyItemNum("misc42", 1)
        DestroyItem("misc42")
	TakePartyGold(1000)
	DestroyGold(1000)
	GiveItemCreate("mh#swrd8", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@60)
        SetGlobal("mh#BrokkKatana", "GLOBAL", 2)~
    SOLVED_JOURNAL @63
    EXIT
END

IF ~PartyHasItem("mh#comp5")
    Global("mh#BrokkAlicorn", "GLOBAL", 0)~
BEGIN alicorn1
  SAY @65
  =
  @66
  IF ~PartyGoldGT(1999)~
    REPLY @67
    GOTO alicorn3
  IF ~~
    REPLY @68
    GOTO alicorn2
END

IF ~~
BEGIN alicorn2
  SAY @69
  IF ~~
    DO ~SetGlobal("mh#BrokkAlicorn", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @70
    EXIT
END

IF ~~
BEGIN alicorn3
  SAY @71
  IF ~~
    DO ~TakePartyItem("mh#comp5")
        DestroyItem("mh#comp5")
	TakePartyGold(2000)
	DestroyGold(2000)
	SetGlobal("mh#BrokkAlicorn", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkAlicornForge", "GLOBAL", TWELVE_HOURS)~
    UNSOLVED_JOURNAL @72
    EXIT
END

IF ~Global("mh#BrokkAlicorn", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkAlicornForge", "GLOBAL")~
BEGIN alicorn4
  SAY @73
  IF ~~
    DO ~GiveItemCreate("mh#sper1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@70)
        EraseJournalEntry(@72)
        SetGlobal("mh#BrokkAlicorn", "GLOBAL", 3)~
    SOLVED_JOURNAL @74
    EXIT
END

IF ~True()~
BEGIN default
  SAY @41
  IF ~Global("mh#BrokkMeteor", "GLOBAL", 1)
      PartyHasItem("mh#comp1")
      PartyHasItem("misc41")
      PartyGoldGT(2999)~
    REPLY @42
    GOTO meteor3
  IF ~Global("mh#BrokkAnkheg", "GLOBAL", 1)
      PartyHasItem("misc12")
      PartyGoldGT(1999)~
    REPLY @43
    GOTO ankheg3
  IF ~Global("mh#BrokkKatana", "GLOBAL", 1)
      PartyHasItem("mh#comp4")
      PartyHasItem("misc42")
      PartyGoldGT(999)~
    REPLY @64
    GOTO katana3
  IF ~Global("mh#BrokkAlicorn", "GLOBAL", 1)
      PartyHasItem("mh#comp5")
      PartyGoldGT(1999)~
    REPLY @75
    GOTO alicorn3
  IF ~~
    REPLY @44
    GOTO store
  IF ~~
    REPLY @45
    GOTO goodbye
  IF ~Global("mh#BrokkChat", "GLOBAL", 0)~
    REPLY @46
    GOTO chat1
  IF ~Global("mh#BrokkChat", "GLOBAL", 1)~
    REPLY @47
    GOTO chat2
END

IF ~~
BEGIN store
  SAY @48
  IF ~~
    DO ~StartStore("mh#brokk", LastTalkedToBy(Myself))~
    EXIT
END

IF ~~
BEGIN goodbye
  SAY @49
  IF ~~
    EXIT
END

IF ~~
BEGIN chat1
  SAY @50
  IF ~~
    REPLY @51
    DO ~SetGlobal("mh#BrokkChat", "GLOBAL", 1)~
    GOTO goodbye
END

IF ~~
BEGIN chat2
  SAY @52
  = @53
  IF ~~
    REPLY @54
    DO ~SetGlobal("mh#BrokkChat", "GLOBAL", 2)~
    GOTO goodbye
END


