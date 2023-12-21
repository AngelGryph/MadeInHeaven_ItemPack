REPLACE_SAY "vaelasa" 8
  @5200

ADD_TRANS_ACTION "vaelasa"
BEGIN 8 END	// State list
BEGIN END	// Transition list
  ~GiveItem("mh#belt2", LastTalkedToBy(Myself))~


