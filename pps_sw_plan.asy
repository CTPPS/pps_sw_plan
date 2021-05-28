import code;

//----------------------------------------
//AddCategory("data formats");



//----------------------------------------
//AddCategory("config");



//----------------------------------------
AddCategory("geometry");

AddTask("g14", "update pixels for Run3 -- XML files", ass="Fabrizio", resp="Jan, Luiz", stat="prepare", dep=deps("g16"), flags="", comments="");

AddTask("g5", "fix overlaps of diamonds", ass="", stat="pending", dep=deps());

AddTask("g17", "fix of DD4Hep related issues", ass="Fabrizio", resp="", stat="pending", dep=deps("g14"));

AddTask("g7", "final upload of Run3 geometry XML to DB", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps("g5", "g17"));

AddTask("g16", "pre-processed geometry to DB -- preparation 2", ass="Wagner", cons="Jan", resp="Fabrizio", pr="33851", stat="merged", dep=deps(), flags="new,new-gm");

AddTask("g8", "pre-processed geometry to DB", ass="Wagner", cons="AlCa", resp="Fabrizio", stat="prepare", dep=deps("g16", "g14"), comments="
also inclusion to GT
");

AddTask("g18", "default reco sequence uses pre-processed geometry", ass="Wagner", cons="Jan", resp="Fabrizio", stat="prepare", dep=deps("g8"), comments="");

AddTask("g11", "organise files in Geometry/VeryForwardData/data", ass="a newcomer", cons="Clemencia", resp="Fabrizio", stat="pending", dep=deps("g5", "g14"));

AddTask("g2", "remove geometry specs from reco cff files", ass="Jan", stat="pending", dep=deps("g18"), comments="https://github.com/cms-sw/cmssw/issues/31360");

AddTask("g12", "check compatibility of scoring plane z", pri="low", ass="Jan", resp="Fabrizio", stat="pending", due="", comments="
the same z should be used by strip RPs, pixel RPs and optics
");



//----------------------------------------
//AddCategory("optimisations");



//----------------------------------------
//AddCategory("alignment");



//----------------------------------------
AddCategory("reconstruction");

AddTask("re2", "diamonds: SAMPIC readout support", ass="Chris", cons="Edoardo", resp="Valentina", stat="prepare", pr="", flags="");



//----------------------------------------
AddCategory("direct simulation");

AddTask("ds4", "backport to 10\_6", pri="high", ass="Jan?", stat="pending", resp="POG", due="", dep=deps());



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

AddTask("pcl2", "alignment", ass="Mateusz", cons="Jan", resp="DPG", stat="prepare");



//----------------------------------------
AddCategory("nanoAOD");

AddTask("na2", "simu tracks and protons in nanoAOD", ass="", cons="Jan", resp="POG", stat="pending", dep=deps(), comments="
idea: run ``direct'' simu during nanoAOD production\\
by default, this would be disabled, but available for private use
");

//----------------------------------------
AddCategory("framework");

AddTask("fw1", "esConsumes in CalibPPS and DQM/CTPPS", ass="Fabrizio", cons="", resp="", stat="merged", dep=deps(), pr="33848", flags="new,new-gm", comments="");

//----------------------------------------
//AddCategory("filters");

//----------------------------------------
AddCategory("other");

AddTask("ot1", "standardised code for simu + PU event merging", ass="Andrea", resp="POG", stat="pending", dep=deps(), comments="
code for standard PPS procedure of mixing (rec-hit level) simu signal with PU from unrelated real LHC events
");

//----------------------------------------

MakePlot(360, "new");
