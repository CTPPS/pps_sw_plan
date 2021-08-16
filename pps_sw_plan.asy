import code;

//----------------------------------------
//AddCategory("data formats");



//----------------------------------------
//AddCategory("config");



//----------------------------------------
AddCategory("geometry");

AddTask("g14", "update pixels for Run3 -- XML files", ass="Fabrizio", resp="Jan, Luiz", stat="merged", dep=deps("g16"), flags="new,new-gm", pr="34499", comments="");

AddTask("g19", "bugfix -- missing file", ass="Fabrizio", resp="", stat="open", dep=deps("g14"), flags="new,new-gm", pr="34588", comments="");

AddTask("g5", "fix overlaps of diamonds", ass="Gustavo", stat="done", flags="new,new-gm", dep=deps());

AddTask("g17", "fix of DD4Hep related issues", ass="Fabrizio", resp="", stat="done", flags="new,new-gm", dep=deps("g19"));

AddTask("g7", "final upload of Run3 geometry XML to DB", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps("g5", "g17"));

AddTask("g16", "pre-processed geometry to DB -- preparation 2", ass="Wagner", cons="Jan", resp="Fabrizio", pr="33851", stat="merged", dep=deps(), flags="new,new-gm");

AddTask("g8", "pre-processed geometry to DB", ass="Wagner", cons="AlCa", resp="Fabrizio", stat="prepare", dep=deps("g16", "g19"), comments="
also inclusion to GT
");

AddTask("g18", "default reco sequence uses pre-processed geometry", ass="Wagner", cons="Jan", resp="Fabrizio", stat="open", pr="34549", dep=deps("g8"), flags="new,new-gm", comments="");

AddTask("g11", "organise files in Geometry/VeryForwardData/data", ass="a newcomer", cons="Clemencia", resp="Fabrizio", stat="pending", dep=deps("g5", "g19"));

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

AddTask("re2", "diamonds: SAMPIC readout support", ass="Chris", cons="Edoardo", resp="Valentina", stat="merged", pr="34759", flags="new,new-gm");



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

AddTask("dqm8", "add PPS to common sequences", ass="Fabrizio", resp="DPG", stat="open", pr="34454", flags="new,new-gm", comments="");

// https://github.com/dmwm/T0/pull/4588
AddTask("dqm9", "include PPS to T0 processing", ass="Fabrizio", resp="DPG", stat="open", pr="4588", flags="new,new-gm", comments="");



//----------------------------------------
AddCategory("PCLs");

AddTask("pcl3", "fix: PPSAlignmentConfigRcd registered", ass="Mateusz", cons="Jan", resp="DPG", stat="merged", pr="34844", flags="new,new-gm");

AddTask("pcl4", "fix: PPSAlignmentConfigRcd registered, backport to 12\_0", ass="Mateusz", cons="Jan", resp="DPG", stat="open", pr="34845",
	flags="new,new-gm", dep=deps("pcl3"));

AddTask("pcl5", "update of alignment classes", ass="Mateusz", cons="Jan", resp="DPG", stat="prepare", pr="", flags="new,new-gm", dep=deps("pcl3"));

AddTask("pcl6", "upload of alignment config", ass="Mateusz,Wagner", cons="Jan", resp="DPG", stat="prepare", pr="", flags="new,new-gm", dep=deps("pcl5"));

AddTask("pcl7", "alignment PCL-like matrix workflow", ass="Mateusz", cons="Jan", resp="DPG", stat="prepare", dep=deps("pcl6"));

AddTask("pcl8", "alignment in central PCL", ass="Mateusz", cons="Jan", resp="DPG", stat="pending", dep=deps("pcl7"));



//----------------------------------------
AddCategory("nanoAOD");

AddTask("na2", "simu tracks and protons in nanoAOD", ass="", cons="Jan", resp="POG", stat="pending", dep=deps(), comments="
idea: run ``direct'' simu during nanoAOD production\\
by default, this would be disabled, but available for private use
");



//----------------------------------------
AddCategory("framework");

AddTask("fw1", "esConsumes in CalibPPS and DQM/CTPPS", ass="Fabrizio", cons="", resp="", stat="merged", dep=deps(), pr="33848", flags="new,new-gm", comments="");

AddTask("fw2", "esConsumes in CondTools/CTPPS", ass="Jan", cons="", resp="", stat="merged", dep=deps(), pr="34377", flags="new,new-gm", comments="");



//----------------------------------------
AddCategory("filters");

AddTask("fi1", "PPS HLT filter for PCL", ass="Mariana", stat="open", pr="34827", flags="new,new-gm");



//----------------------------------------
AddCategory("other");

AddTask("ot1", "standardised code for simu + PU event merging", ass="Andrea", resp="POG", stat="pending", dep=deps(), comments="
code for standard PPS procedure of mixing (rec-hit level) simu signal with PU from unrelated real LHC events
");



//----------------------------------------

MakePlot(370, "new");
