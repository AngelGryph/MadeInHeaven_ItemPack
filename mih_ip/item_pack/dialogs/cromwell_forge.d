EXTEND_BOTTOM "wsmith01" 13
  IF ~PartyHasItem("mh#comp6")~
  THEN
    GOTO mh#PartyHasBlackDragonScale
END


APPEND "wsmith01"

IF ~~
BEGIN mh#PartyHasBlackDragonScale
  SAY #59709
  = @4000
  IF ~~
    REPLY #59717
    GOTO mh#InterestedBlackDragonScale
  IF ~~
    REPLY #59718
    GOTO mh#NotInterestedBlackDragonScale
END

IF ~~
BEGIN mh#NotInterestedBlackDragonScale
  SAY #59723
  COPY_TRANS "wsmith01" 13
END

IF ~~
BEGIN mh#InterestedBlackDragonScale
  SAY #59771
  IF ~PartyGoldGT(4999)~
    REPLY #59775
    DO ~SetGlobal("mh#CromwellForgeItem", "GLOBAL", 1)
        SetGlobal("ForgeStuff", "GLOBAL", 1)
	TakePartyItem("mh#comp6")
	DestroyItem("mh#comp6")
	TakePartyGold(5000)
	DestroyGold(5000)~
    GOTO 56
  IF ~~
    REPLY #59718
    GOTO mh#NotInterestedBlackDragonScale
END

END	// APPEND


