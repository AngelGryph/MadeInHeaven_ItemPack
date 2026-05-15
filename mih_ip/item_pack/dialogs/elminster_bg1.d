APPEND "elmin5"

IF ~~
BEGIN mh#circlet_doubt_1
  SAY @2200
  IF ~~
    DO ~GiveItemCreate("mh#band1", LastTalkedToBy(Myself), 1, 1, 0)~
    GOTO mh#circlet_doubt_2
  IF ~InParty("DYNAHEIR") !StateCheck("DYNAHEIR", CD_STATE_NOTVALID)~
    DO ~GiveItemCreate("mh#band1", LastTalkedToBy(Myself), 1, 1, 0)~
    EXTERN "dynahj" mh#dynaheir_circlet_doubt
END

IF ~~
BEGIN mh#circlet_doubt_2
  SAY @2204
  COPY_TRANS "elmin5" 8
END

IF ~~
BEGIN mh#circlet_trust_1
  SAY @2201
  IF ~~
    DO ~GiveItemCreate("mh#band1", LastTalkedToBy(Myself), 1, 1, 0)~
    GOTO mh#circlet_trust_2
  IF ~InParty("DYNAHEIR") !StateCheck("DYNAHEIR", CD_STATE_NOTVALID)~
    DO ~GiveItemCreate("mh#band1", LastTalkedToBy(Myself), 1, 1, 0)~
    EXTERN "dynahj" mh#dynaheir_circlet_trust
END

IF ~~
BEGIN mh#circlet_trust_2
  SAY @2204
  COPY_TRANS "elmin5" 9
END

END	// APPEND "elmin5"


APPEND "dynahj"

IF ~~
BEGIN mh#dynaheir_circlet_doubt
  SAY @2202
  IF ~~
    EXTERN "elmin5" mh#circlet_doubt_2
END

IF ~~
BEGIN mh#dynaheir_circlet_trust
  SAY @2203
  IF ~~
    EXTERN "elmin5" mh#circlet_trust_2
END

END	// APPEND "dynahj"


EXTEND_BOTTOM "elmin5" 8
  IF ~ReputationGT(Player1, 18) Or(6) Class(Player1, "RANGER_ALL") Class(Player2, "RANGER_ALL") Class(Player3, "RANGER_ALL") Class(Player4, "RANGER_ALL") Class(Player5, "RANGER_ALL") Class(Player6, "RANGER_ALL")~
    GOTO mh#circlet_doubt_1
END

EXTEND_BOTTOM "elmin5" 9
  IF ~ReputationGT(Player1, 16) Or(6) Class(Player1, "RANGER_ALL") Class(Player2, "RANGER_ALL") Class(Player3, "RANGER_ALL") Class(Player4, "RANGER_ALL") Class(Player5, "RANGER_ALL") Class(Player6, "RANGER_ALL")~
    GOTO mh#circlet_trust_1
END


