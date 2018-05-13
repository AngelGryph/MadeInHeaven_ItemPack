// Patches to exiting dialog

ADD_TRANS_ACTION "halftr"
BEGIN 7 END	// State list
BEGIN END	// Transaction list (empty=all)
  ~SetGlobal("mh#GemOfSeeing", "GLOBAL", 2)~

ADD_TRANS_ACTION "halftr"
BEGIN 1 6 END	// State list
BEGIN END	// Transaction list (empty=all)
  ~SetGlobal("mh#GemOfSeeing", "GLOBAL", 1)~


// New dialog file

//BEGIN "mh#hlftr"


