import code;

//----------------------------------------
//AddCategory("data formats");



//----------------------------------------
//AddCategory("config");



//----------------------------------------
AddCategory("geometry");

AddTask("g7", "final upload of Run3 geometry XML to DB", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps());

AddTask("g8", "pre-processed geometry to DB", ass="Wagner", cons="AlCa", resp="Fabrizio", stat="prepare", dep=deps(), comments="
also inclusion to GT
");

AddTask("g18", "default reco sequence uses pre-processed geometry", ass="Wagner", cons="Jan", resp="Fabrizio", stat="open", pr="34549", dep=deps("g8"), flags="", comments="");

AddTask("g2", "remove geometry specs from reco cff files", ass="", stat="pending", dep=deps("g18"), comments="https://github.com/cms-sw/cmssw/issues/31360");

AddTask("g11", "organise files in Geometry/VeryForwardData/data", ass="a newcomer", cons="Clemencia", resp="Fabrizio", stat="pending", dep=deps());



//----------------------------------------
//AddCategory("optimisations");



//----------------------------------------
//AddCategory("alignment");



//----------------------------------------
AddCategory("reconstruction");

AddTask("re3", "update of N-F association cuts: class, DB infrastructure", ass="Grzegorz", cons="Jan", resp="", stat="open", pr="35248", flags="");

AddTask("re4", "update of N-F association cuts: DB upload", ass="Wagner", cons="Jan", resp="", stat="pending", pr="", flags="", dep=deps("re3"));

AddTask("re5", "update of N-F association cuts: use DB by default", ass="Grzegorz", cons="Jan", resp="", stat="pending", pr="", flags="", dep=deps("re4"));



//----------------------------------------
AddCategory("direct simulation");

AddTask("ds4", "backport to 10\_6", pri="", ass="", stat="pending", resp="POG", due="", dep=deps());



//----------------------------------------
AddCategory("DQM");

AddTask("dqm2", "timing RPs -- add new Run3 RPs", ass="Laurent?", resp="DPG", stat="prep", dep=deps());

AddTask("dqm3", "timing RPs -- config flags to enable/disable plots for online/offline DQM", ass="", resp="DPG", stat="pending", comments="");

AddTask("dqm4", "timing RPs -- acquisition window size steered with a run-time parameter", ass="", resp="DPG", stat="pending", comments="");

AddTask("dqm5", "timing RPs -- TotemTimingDQMSource adapted for SAMPIC", ass="Chris ?", resp="DPG", stat="pending", comments="");

AddTask("dqm6", "timing RPs -- extract harvesting code to harverster modules", ass="", resp="DPG", stat="pending", comments="");

AddTask("dqm7", "timing RPs -- adjust ranges for better readability", ass="Chris ?", resp="DPG", stat="pending", comments="");

AddTask("dqm9", "include PPS to T0 processing", ass="Fabrizio", resp="DPG", stat="open", pr="https://github.com/dmwm/T0/pull/4588", flags="", comments="");



//----------------------------------------
AddCategory("PCLs");

AddTask("pcl5", "alignment -- update of config classes", ass="Mateusz", cons="Jan", resp="DPG", stat="merged", pr="35174", flags="new-swm,new-gm", dep=deps());

AddTask("pcl6", "alignment -- upload of alignment config", ass="Mateusz,Wagner", cons="Jan", resp="DPG", stat="prepare", pr="", flags="", dep=deps("pcl5"));

AddTask("pcl7", "alignment -- PCL-like matrix workflow", ass="Mateusz", cons="Jan", resp="DPG", stat="prepare", dep=deps("pcl6"));

AddTask("pcl8", "alignment -- inclusion in central PCL", ass="Mateusz", cons="Jan", resp="DPG", stat="pending", dep=deps("pcl7"));



//----------------------------------------
AddCategory("nanoAOD");

AddTask("na2", "simu tracks and protons in nanoAOD", ass="", cons="Jan", resp="POG", stat="pending", dep=deps(), comments="
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

MakePlot(370, "new-swm");
