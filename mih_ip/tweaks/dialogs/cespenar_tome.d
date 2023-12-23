REPLACE_SAY "botsmith" 114 @1008

ALTER_TRANS "botsmith"
BEGIN 4 9 15 19 23 27 31 35 39 43 47 51 55 59 63 67 72 76 82 86 89 92 96 100 105 109 END	// State(s)
BEGIN 9 END	// Transaction
BEGIN
  "TRIGGER"
  ~OR(4)
     PartyHasItem("tome01")
     PartyHasItem("tome02")
     PartyHasItem("tome03")
     PartyHasItem("tome04")~
END

EXTEND_BOTTOM "botsmith" 110
  IF ~OR(4)
        PartyHasItem("tome01")
        PartyHasItem("tome02")
        PartyHasItem("tome03")
        PartyHasItem("tome04")
      PartyHasItem("tome05a")~
    GOTO mh#PartyHasIronGolemPage
END


APPEND "botsmith"

IF ~~
BEGIN mh#PartyHasIronGolemPage
  SAY @1009
  IF ~PartyGoldLT(20000)~
    REPLY #66961
    GOTO 10
  IF ~PartyGoldGT(19999)~
    REPLY #66962
    DO ~SetGlobal("mh#CespenarIronGolemPage", "GLOBAL", 1)
        SetGlobal("ImpForgeStuff", "GLOBAL", 1)
	TakePartyItem("tome01")
        TakePartyItem("tome02")
        TakePartyItem("tome03")
        TakePartyItem("tome04")
        DestroyItem("tome01")
        DestroyItem("tome02")
        DestroyItem("tome03")
        DestroyItem("tome04")
        TakePartyItem("tome02a")
        TakePartyItem("tome03a")
        TakePartyItem("tome04a")
        TakePartyItem("tome05a")
        DestroyItem("tome02a")
        DestroyItem("tome03a")
        DestroyItem("tome04a")
        DestroyItem("tome05a")
	TakePartyGold(20000)
	DestroyGold(20000)~
    GOTO 11
  IF ~~
    REPLY #66963
    GOTO 115
END

END	// APPEND


