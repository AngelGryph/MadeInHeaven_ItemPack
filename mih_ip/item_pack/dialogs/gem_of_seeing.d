// Patches to exiting dialog

ADD_TRANS_ACTION "halftr"
BEGIN 7 END	// State list
BEGIN END	// Transaction list (empty=all)
  ~SetGlobal("mh#GemOfSeeing", "GLOBAL", 2)~

ADD_TRANS_ACTION "halftr"
BEGIN 1 6 END	// State list
BEGIN END	// Transaction list (empty=all)
  ~SetGlobal("mh#GemOfSeeing", "GLOBAL", 1)~


// Halfling trader "Furret" dialog.

BEGIN "mh#hlftr"

IF ~Global("mh#GemOfSeeing", "GLOBAL", 2)~
BEGIN caught_you
  SAY @2100
  IF ~~
    REPLY @2101
    GOTO friendly
  IF ~~
    REPLY @2102
    GOTO hostile
END

IF ~~
BEGIN friendly
  SAY @2103
  IF ~~
    REPLY @2104
    GOTO story
  IF ~~
    REPLY @2105
    GOTO hostile
END

IF ~~
BEGIN hostile
  SAY @2106
  IF ~~
    REPLY @2107
    GOTO story
  IF ~~
    REPLY @2108
    GOTO violence
END

IF ~~
BEGIN violence
  SAY @2109
  IF ~~
    DO ~ReputationInc(-2)
        Kill(Myself)~
    UNSOLVED_JOURNAL @2110
    EXIT
END

IF ~~
BEGIN story
  SAY @2111
  = @2112
  = @2113
  IF ~~
    REPLY @2114
    GOTO wizards
  IF ~~
    REPLY @2115
    GOTO wizards
  IF ~~
    REPLY @2116
    GOTO violence
END

IF ~~
  BEGIN wizards
  SAY @2117
  = @2118
  IF ~~
    DO ~GiveItem("mh#comp3", LastTalkedToBy())
        EscapeArea()~
    UNSOLVED_JOURNAL @2119
    EXIT
END


IF ~~
BEGIN panic1
  SAY @2139
  IF ~~
    EXTERN "mh#bobas" intro2
END

IF ~~
BEGIN panic2
  SAY @2140
  IF ~~
    EXTERN "mh#bobas" intro3
END

IF ~~
BEGIN panic3
  SAY @2141
  =
  @2142
  IF ~~
    EXTERN "mh#bobas" intro4
END

IF ~Global("mh#GemOfSeeing", "GLOBAL", 1)
    !Dead("mh#bobas")~
BEGIN watch_out
  SAY @2143
  IF ~~
    EXIT
END

IF ~Global("mh#GemOfSeeing", "GLOBAL", 1)
    Dead("mh#bobas")~
BEGIN thanks
  SAY @2144
  IF ~~
    REPLY @2145
    GOTO story
  IF ~~
    REPLY @2146
    GOTO story
  IF ~~
    REPLY @2147
    GOTO story
END


// Bobas the dwarf

BEGIN "mh#bobas"

IF ~NumTimesTalkedTo(0)~
BEGIN intro1
  SAY @2148
  IF ~~
    EXTERN "mh#hlftr" panic1
END

IF ~~
BEGIN intro2
  SAY @2149
  IF ~~
    EXTERN "mh#hlftr" panic2
END

IF ~~
BEGIN intro3
  SAY @2150
  IF ~~
    EXTERN "mh#hlftr" panic3
END

IF ~~
BEGIN intro4
  SAY @2151
  IF ~~
    DO ~Enemy()~
    EXIT
END


// Creating the gem - Thalantyr

EXTEND_BOTTOM "thalan" 1
  IF ~PartyHasItem("mh#comp3")~
    REPLY @2120
    GOTO gem1
END


APPEND "thalan"

IF ~~
BEGIN gem1
  SAY @2121
  = @2122
  = @2123
  IF ~PartyHasItem("misc42")
      PartyGoldGT(4999)~
    REPLY @2124
    GOTO gem3
  IF ~~
    REPLY @2125
    GOTO gem2
END

IF ~~
BEGIN gem2
  SAY @2126
  IF ~~
    UNSOLVED_JOURNAL @2127
    EXIT
END

IF ~~
BEGIN gem3
  SAY @2128
  IF ~~
    DO ~TakePartyItem("mh#comp3")
        DestroyItem("mh#comp3")
	TakePartyItemNum("misc42", 1)
        DestroyItem("misc42")
	TakePartyGold(5000)
	DestroyGold(5000)
	EraseJournalEntry(@2110)
	EraseJournalEntry(@2119)
	EraseJournalEntry(@2127)
	EraseJournalEntry(@2136)
	GiveItemCreate("mh#misc4", LastTalkedToBy(Myself), 1, 0, 0)~
    SOLVED_JOURNAL @2129
    EXIT
END

END	// APPEND Thalantyr
    

// Creating the gem - Halbazzer Drin

EXTEND_BOTTOM "halbaz" 0
  IF ~PartyHasItem("mh#comp3")~
    REPLY @2120
    GOTO gem1
END


APPEND "halbaz"

IF ~~
BEGIN gem1
  SAY @2130
  = @2131
  = @2132
  IF ~PartyHasItem("misc42")
      PartyGoldGT(4999)~
    REPLY @2133
    GOTO gem3
  IF ~~
    REPLY @2134
    GOTO gem2
END

IF ~~
BEGIN gem2
  SAY @2135
  IF ~~
    UNSOLVED_JOURNAL @2136
    EXIT
END

IF ~~
BEGIN gem3
  SAY @2137
  IF ~~
    DO ~TakePartyItem("mh#comp3")
        DestroyItem("mh#comp3")
	TakePartyItemNum("misc42", 1)
        DestroyItem("misc42")
	TakePartyGold(5000)
	DestroyGold(5000)
	EraseJournalEntry(@2110)
	EraseJournalEntry(@2119)
	EraseJournalEntry(@2127)
	EraseJournalEntry(@2136)
	GiveItemCreate("mh#misc4", LastTalkedToBy(Myself), 1, 0, 0)~
    SOLVED_JOURNAL @2138
    EXIT
END

END	// APPEND Halbazzer Drin


