import code;

//----------------------------------------
//AddCategory("data formats");

//----------------------------------------
AddCategory("geometry");

AddTask("g5", "fix overlaps of diamonds", ass="", stat="pending", dep=deps());

AddTask("g6", "update pixels for Run3 -- topology", ass="Fabrizio", resp="Jan, Luiz", stat="merged", pr="32868", dep=deps(), comments="
different pixel topology needed for Run 2 and 3 -- solved by moving the topology objects to ES with naturally associated IOVs
");

AddTask("g14", "update pixels for Run3 -- XML files", ass="Fabrizio", resp="Jan, Luiz", stat="prepare", dep=deps("g6"), comments="");

AddTask("g7", "upload Run3 geometry XML to DB", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps("g5", "g14"));

AddTask("g11", "organise files in Geometry/VeryForwardData/data", ass="a newcomer", cons="Clemencia", resp="Fabrizio", stat="pending", dep=deps("g5", "g14"));

AddTask("g13", "pre-processed geometry to DB -- preparation", ass="Wagner", cons="Jan", resp="Fabrizio", pr="32836", stat="merged", dep=deps());

AddTask("g8", "pre-processed geometry to DB -- initial upload", ass="Wagner", cons="Jan", resp="Fabrizio", stat="prepare", dep=deps("g13"), comments="
* use a place-holder for Run3\\
* default reco sequence uses pre-processed geometry
");

AddTask("g9", "pre-processed geometry to DB -- updated for Run3", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps("g7", "g8"));

AddTask("g2", "remove geometry specs from reco cff files", ass="Jan", stat="pending", dep=deps("g8"), comments="https://github.com/cms-sw/cmssw/issues/31360");

AddTask("g12", "check compatibility of scoring plane z", pri="low", ass="Jan", resp="Fabrizio", stat="pending", due="", comments="
the same z should be used by strip RPs, pixel RPs and optics
");

//----------------------------------------
//AddCategory("config");

//----------------------------------------
//AddCategory("optimisations");

//----------------------------------------
//AddCategory("alignment");

//----------------------------------------
AddCategory("reconstruction");

AddTask("re1", "pixels: use InputTag instead of plain string labels", ass="Andrea", resp="Fabrizio", stat="merged", pr="32971", flags="updated");

AddTask("re3", "fix of direct simulation workflow", ass="Laurent", resp="", stat="merged", pr="32998", dep=deps("re1"), flags="updated");

AddTask("re2", "diamonds: SAMPIC readout support", ass="Chris", cons="Edoardo", resp="Valentina", stat="prepare", pr="", flags="updated");



//----------------------------------------
AddCategory("direct simulation");

AddTask("ds2", "tracking-RP efficiency", ass="Jan", cons="Andrea", resp="DPG", stat="merged", pr="32788", due="", dep=deps());

AddTask("ds3", "use cloning in cff files", pri="", ass="Laurent", resp="Jan", stat="merged", pr="32974", due="", dep=deps(), flags="updated", comments="
to address \ulink{https://github.com/cms-sw/cmssw/issues/32448}{issue \#32448}
");

AddTask("ds4", "backport to 10\_6", pri="high", ass="Jan", stat="pending", resp="POG", due="Mar 2021", dep=deps("ds2", "ds3"));



//----------------------------------------
AddCategory("DQM");

AddTask("dqm2", "timing RPs -- add new Run3 RPs", ass="Laurent", resp="DPG", stat="prep", dep=deps());

AddTask("dqm3", "timing RPs -- config flags to enable/disable plots for online/offline DQM", ass="", resp="DPG", stat="pending", comments="");

AddTask("dqm4", "timing RPs -- acquisition window size steered with a run-time parameter", ass="", resp="DPG", stat="pending", comments="");

AddTask("dqm5", "timing RPs -- TotemTimingDQMSource adapted for SAMPIC", ass="Chris ?", resp="DPG", stat="pending", comments="");

AddTask("dqm6", "timing RPs -- extract harvesting code to harverster modules", ass="", resp="DPG", stat="pending", comments="");

AddTask("dqm7", "timing RPs -- adjust ranges for better readability", ass="Chris ?", resp="DPG", stat="pending", comments="");



//----------------------------------------
AddCategory("PCLs");

AddTask("pcl1", "timing calibration", ass="Laurent", cons="DB", resp="DPG", stat="prepare");
AddTask("pcl2", "alignment", ass="Mateusz", cons="Jan, DB", resp="DPG", stat="prepare");

//----------------------------------------
AddCategory("nanoAOD");

AddTask("na2", "simu tracks and protons in nanoAOD", ass="", cons="Jan", resp="POG", stat="pending", dep=deps(), comments="
idea: run ``direct'' simu during nanoAOD production\\
by default, this would be disabled, but available for private use
");


//----------------------------------------
//AddCategory("filters");

//----------------------------------------
AddCategory("other");

AddTask("ot1", "standardised code for simu + PU event merging", ass="Andrea", resp="POG", stat="pending", dep=deps(), comments="
code for standard PPS procedure of mixing (rec-hit level) simu signal with PU from unrelated real LHC events
");

//----------------------------------------

MakePlot(320);
