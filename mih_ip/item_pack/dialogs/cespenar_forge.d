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

EXTEND_BOTTOM "botsmith" 4
  IF ~PartyHasItem("ring08")~
  THEN
    GOTO mh#PartyHasRingOfFreeAction
END

EXTEND_BOTTOM "botsmith" 4
  IF ~PartyHasItem("helm18")
      PartyHasItem("helm19")
      PartyHasItem("helm23")
      PartyHasItem("helm24")
      PartyHasItem("helm25")
      PartyHasItem("mh#ioun1")
      PartyHasItem("mh#ioun2")
      PartyHasItem("mh#ioun5")
      PartyHasItem("mh#ioun8")
      PartyHasItem("%dexterity_ioun_stone%")~
  THEN
    GOTO mh#PartyHasManyIounStones
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

IF ~~
BEGIN mh#PartyHasRingOfFreeAction
  SAY @4504
  = @4505
  IF ~PartyGoldLT(20000)~
    REPLY #66908
    GOTO 10
  IF ~PartyGoldGT(19999)
      PartyHasItem("scrl1t")
      PartyHasItem("scrl9r")~
    REPLY #66909
    DO ~SetGlobal("mh#CespenarForgeItem", "GLOBAL", 3)
        SetGlobal("ImpForgeStuff", "GLOBAL", 1)
	TakePartyItem("ring08")
	DestroyItem("ring08")
	TakePartyItemNum("scrl1t", 1)
	DestroyItem("scrl1t")
	TakePartyItemNum("scrl9r", 1)
	DestroyItem("scrl9r")
	TakePartyGold(20000)
	DestroyGold(20000)~
    GOTO 11
  IF ~~
    REPLY #66913
    GOTO mh#NotInterestedRingOfIzmur
END

IF ~~
BEGIN mh#NotInterestedRingOfIzmur
  SAY @4506
  COPY_TRANS "botsmith" 4
  IF ~PartyHasItem("mh#comp6")~
  THEN
    GOTO mh#PartyHasBlackDragonScale
  IF ~PartyHasItem("mh#comp7")~
  THEN
    GOTO mh#PartyHasGreenDragonScale
END


IF ~~
BEGIN mh#PartyHasManyIounStones
  SAY @4507
  = @4508
  = @4509
  IF ~PartyGoldLT(30000)~
    REPLY #66908
    GOTO 10
  IF ~PartyGoldGT(29999)
      PartyHasItem("scrl7w")
      PartyHasItem("scrl8p")~
    REPLY #66984
    DO ~SetGlobal("mh#CespenarForgeItem", "GLOBAL", 3)
        SetGlobal("ImpForgeStuff", "GLOBAL", 1)
	TakePartyItem("helm18")
	DestroyItem("helm18")
	TakePartyItem("helm19")
	DestroyItem("helm19")
	TakePartyItem("helm23")
	DestroyItem("helm23")
	TakePartyItem("helm24")
	DestroyItem("helm24")
	TakePartyItem("helm25")
	DestroyItem("helm25")
	TakePartyItem("mh#ioun1")
	DestroyItem("mh#ioun1")
	TakePartyItem("mh#ioun2")
	DestroyItem("mh#ioun2")
	TakePartyItem("mh#ioun5")
	DestroyItem("mh#ioun5")
	TakePartyItem("mh#ioun8")
	DestroyItem("mh#ioun8")
	TakePartyItem("%dexterity_ioun_stone%")
	DestroyItem("%dexterity_ioun_stone%")
	TakePartyItemNum("scrl7w", 1)
	DestroyItem("scrl7w")
	TakePartyItemNum("scrl8p", 1)
	DestroyItem("scrl8p")
	TakePartyGold(30000)
	DestroyGold(30000)~
    GOTO 11
  IF ~~
    REPLY #66913
    GOTO mh#NotInterestedWyvernCrown
END


IF ~~
BEGIN mh#NotInterestedWyvernCrown
  SAY @4510
  COPY_TRANS "botsmith" 4
  IF ~PartyHasItem("mh#comp6")~
  THEN
    GOTO mh#PartyHasBlackDragonScale
  IF ~PartyHasItem("mh#comp7")~
  THEN
    GOTO mh#PartyHasGreenDragonScale
  IF ~PartyHasItem("ring08")~
  THEN
    GOTO mh#PartyHasRingOfFreeAction
END

END	// APPEND


