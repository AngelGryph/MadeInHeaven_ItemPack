EXTEND_TOP thalan %gem_state% #19

  // convenient that these two fall next to each other alphabetically so we only need one e_t to squeexe between 'rogue stone' and 'shandon'
  IF ~Global("cd_mh#gem01","LOCALS",0) PartyHasItem("mh#gem01")~ THEN REPLY @0
    DO ~SetGlobal("cd_mh#gem01","LOCALS",1) TakePartyItem("mh#gem01") DestroyItem("mh#gem01") IncrementGlobal("CDGemQuality","GLOBAL",3)~ GOTO %gem_q3%
  IF ~Global("cd_mh#gem02","LOCALS",0) PartyHasItem("mh#gem02")~ THEN REPLY @2
    DO ~SetGlobal("cd_mh#gem02","LOCALS",1) TakePartyItem("mh#gem02") DestroyItem("mh#gem02") IncrementGlobal("CDGemQuality","GLOBAL",3)~ GOTO %gem_q3%

END