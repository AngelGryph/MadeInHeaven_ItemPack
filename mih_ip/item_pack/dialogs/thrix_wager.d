APPEND "bdthrix"

IF ~~
BEGIN descibe_belt_1
  SAY @3000
  COPY_TRANS "bdthrix" 14
END

IF ~~
BEGIN descibe_belt_2
  SAY @3000
  COPY_TRANS "bdthrix" 16
END

IF ~~
BEGIN chose_belt
  SAY @3001
  IF ~~
    DO ~GiveItemCreate("mh#belt6", Player1, 1, 0, 0)~
    GOTO 147
END

END	// APPEND


REPLACE_SAY "bdthrix" 14 @3002

ALTER_TRANS "bdthrix"
BEGIN 14 END	// State(s)
BEGIN END	// Transaction(s)
BEGIN
  "EPILOGUE"	~GOTO descibe_belt_1~
END


REPLACE_SAY "bdthrix" 16 @3002

ALTER_TRANS "bdthrix"
BEGIN 16 END	// State(s)
BEGIN END	// Transaction(s)
BEGIN
  "EPILOGUE"	~GOTO descibe_belt_2~
END


EXTEND_BOTTOM "bdthrix" 142
  IF ~~
    REPLY @3003
    GOTO chose_belt
END

EXTEND_BOTTOM "bdthrix" 143
  IF ~~
    REPLY @3004
    GOTO chose_belt
END


