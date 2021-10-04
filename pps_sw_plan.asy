import code;

//----------------------------------------
//AddCategory("data formats");



//----------------------------------------
//AddCategory("config");



//----------------------------------------
AddCategory("geometry");

AddTask("g1", "final Run3 geometry update (XML)", ass="Fabrizio, Gustavo", stat="merged", pr="35380", flags="new-gm");

AddTask("g2", "fix: submit missing files", ass="Gustavo", stat="merged", pr="35399", flags="new-gm", dep=deps("g1"));

AddTask("g7", "upload of geometry to DB (fileblob)", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps("g2"));

AddTask("g8", "upload of ggometry to DB (pre-processed)", ass="Wagner", cons="", resp="Fabrizio", stat="pending", dep=deps("g2"), comments="also GT update");

AddTask("g18", "default reco sequence uses pre-processed geometry", ass="Wagner", cons="Jan", resp="Fabrizio", stat="open", pr="34549",
	dep=deps(), flags="", comments="");

AddTask("g10", "remove geometry specs from reco cff files", ass="", stat="pending", dep=deps("g18"), comments="https://github.com/cms-sw/cmssw/issues/31360");

AddTask("g11", "organise files in Geometry/VeryForwardData/data", ass="a newcomer", cons="Clemencia", resp="Fabrizio", stat="pending", dep=deps());

AddTask("g19", "disable building of misaligned geometry by default", ass="Jan", stat="merged", pr="35423", flags="new-gm", comments="misaligned geometry causes problems in PPS HLT\\ sequence (probably due to missing conditions in DB)");



//----------------------------------------
//AddCategory("optimisations");



//----------------------------------------
//AddCategory("alignment");



//----------------------------------------
AddCategory("reconstruction");

AddTask("re3", "update of N-F association cuts: class, DB infrastructure", ass="Grzegorz", cons="Jan", resp="", stat="merged", pr="35248", flags="new-gm");

AddTask("re4", "update of N-F association cuts: DB upload", ass="Wagner", cons="Jan", resp="", stat="prepare", pr="", flags="", dep=deps("re3"));

AddTask("re5", "update of N-F association cuts: use DB by default", ass="Grzegorz", cons="Jan", resp="", stat="pending", pr="", flags="", dep=deps("re4"));



//----------------------------------------
AddCategory("direct simulation");

AddTask("ds1", "adjust Run3 alignment", pri="", ass="Jan", stat="merged", pr="35424", dep=deps("g2"), flags="new-swm,new-gm");

AddTask("ds4", "backport to CMSSW 10\_6", pri="", ass="", stat="pending", resp="POG", due="", dep=deps(), comments="backport of features only available in 11\_X/12\_X to the release used for Run2 analyses");



//----------------------------------------
AddCategory("DQM");

AddTask("dqm5", "timing RPs -- support for SAMPIC readout", ass="Chris", resp="DPG", stat="open", pr="35445", flags="new-gm",
	comments="adds sampic reco to the standard PPS reco sequence, for PPS DQM sequence it removes TOTEM timing and adds diamond sampic, in the DQM module it adds flags to enable/disable plots for online/offline DQM");

AddTask("dqm10", "timing RPs -- update diamond DQM", ass="Chris", resp="DPG", stat="open", pr="35454", flags="new-gm");

AddTask("dqm11", "common module -- update RP ids", ass="Jan", resp="DPG", stat="merged", pr="35484", flags="new-swm,new-gm");

AddTask("dqm6", "timing RPs -- extract harvesting code to harverster modules", ass="", resp="DPG", stat="pending", comments="");

AddTask("dqm9", "include PPS to T0 processing", ass="Fabrizio", resp="DPG", stat="open", pr="https://github.com/dmwm/T0/pull/4588", flags="", comments="");


//----------------------------------------
AddCategory("PCLs");

AddTask("pcl5", "alignment -- update of config classes", ass="Mateusz", cons="Jan", resp="DPG", stat="merged", pr="35174", flags="new-gm", dep=deps());

AddTask("pcl6", "alignment -- upload of alignment config", ass="Mateusz,Wagner", cons="Jan", resp="DPG", stat="prepare", pr="", flags="", dep=deps("pcl5"));

AddTask("pcl7", "alignment -- PCL-like matrix workflow", ass="Mateusz", cons="Jan", resp="DPG", stat="prepare", dep=deps("pcl6"));

AddTask("pcl8", "alignment -- inclusion in central PCL", ass="AlCa", cons="", resp="DPG", stat="pending", dep=deps("pcl7"));



//----------------------------------------
AddCategory("nanoAOD");

AddTask("na2", "simu tracks and protons in nanoAOD", ass="", cons="", resp="POG", stat="pending", dep=deps(), comments="
idea: run ``direct'' simu during nanoAOD production\\
by default, this would be disabled, but available for private use
");



//----------------------------------------
//AddCategory("framework");



//----------------------------------------
//AddCategory("filters");



//----------------------------------------
AddCategory("other");

AddTask("ot1", "standardised code for simu + PU event merging", ass="Andrea?", resp="POG", stat="pending", dep=deps(), comments="
code for standard PPS procedure of mixing (rec-hit level) simu signal with PU from unrelated real LHC events
");



//----------------------------------------
MakePlot(330, "new-swm");
