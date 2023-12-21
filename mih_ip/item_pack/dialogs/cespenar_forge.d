EXTEND_BOTTOM "botsmith" 4
  IF ~PartyHasItem("mh#comp6")~
  THEN
    GOTO mh#PartyHasBlackDragonScale
END

EXTEND_BOTTOM "botsmith" 4
  IF ~PartyHasItem("mh#comp7")~
  THEN
    GOTO mh#PartyHasGreenDragonScale
END


APPEND "botsmith"

IF ~~
BEGIN mh#PartyHasBlackDragonScale
  SAY #66903
  = @4500
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
  SAY @4501
  COPY_TRANS "botsmith" 4
END

IF ~~
BEGIN mh#PartyHasGreenDragonScale
  SAY #66903
  = @4502
  IF ~PartyGoldLT(5000)~
    REPLY #66908
    GOTO 10
  IF ~PartyGoldGT(4999)~
    REPLY #66909
    DO ~SetGlobal("mh#CespenarForgeItem", "GLOBAL", 2)
        SetGlobal("ImpForgeStuff", "GLOBAL", 1)
	TakePartyItem("mh#comp7")
	DestroyItem("mh#comp7")
	TakePartyGold(5000)
	DestroyGold(5000)~
    GOTO 11
  IF ~~
    REPLY #66913
    GOTO mh#NotInterestedGreenDragonScale
END

IF ~~
BEGIN mh#NotInterestedGreenDragonScale
  SAY @4503
  COPY_TRANS "botsmith" 4
  IF ~PartyHasItem("mh#comp6")~
  THEN
    GOTO mh#PartyHasBlackDragonScale
END

END	// APPEND


