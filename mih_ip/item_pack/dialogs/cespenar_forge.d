EXTEND_BOTTOM "botsmith" 4
  IF ~PartyHasItem("mh#comp6")~
  THEN
    GOTO mh#PartyHasBlackDragonScale
END


APPEND "botsmith"

IF ~~
BEGIN mh#PartyHasBlackDragonScale
  SAY #66903
  = @0
  IF ~PartyGoldLT(5000)~
    REPLY #66908
    GOTO 10
  IF ~PartyGoldGT(4999)~
    REPLY #66909
    DO ~SetGlobal("mh#CespenarForgeItem", "GLOBAL", 1)
        SetGlobal("ImpForgeStuff", "GLOBAL", 1)
	TakePartyItem("mh#comp6")
	DestroyItem("mh#comp6")
	TakePartyGold(5000)
	DestroyGold(5000)~
    GOTO 11
  IF ~~
    REPLY #66913
    GOTO mh#NotInterestedBlackDragonScale
END

IF ~~
BEGIN mh#NotInterestedBlackDragonScale
  SAY @1
  COPY_TRANS "botsmith" 4
END

END	// APPEND


