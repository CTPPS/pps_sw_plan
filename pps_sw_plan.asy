import code;

//----------------------------------------
//AddCategory("data formats");



//----------------------------------------
//AddCategory("config");



//----------------------------------------
AddCategory("geometry");

AddTask("g1", "final Run3 geometry update (XML)", ass="Fabrizio, Gustavo", stat="merged", pr="35380", flags="new-gm");

AddTask("g2", "fix: submit missing files", ass="Gustavo", stat="merged", pr="35399", flags="new-gm", dep=deps("g1"));

AddTask("g8", "upload of geometry to DB (pre-processed)", ass="Wagner", cons="", resp="Fabrizio", stat="done", dep=deps("g2"), comments="also GT update");

AddTask("g18", "default reco sequence uses pre-processed geometry", ass="Wagner, Helena", cons="Jan", resp="Fabrizio", stat="merged", pr="35772",
	dep=deps(), flags="new-gm", comments="");

AddTask("g10", "remove geometry specs from reco cff files", ass="", stat="pending", dep=deps("g18"), comments="https://github.com/cms-sw/cmssw/issues/31360");

AddTask("g11", "organise files in Geometry/VeryForwardData/data", ass="a newcomer", cons="Clemencia", resp="Fabrizio", stat="pending", dep=deps());

AddTask("g19", "disable building of misaligned geometry by default", ass="Jan", stat="merged", pr="35423", flags="new-gm", comments="misaligned geometry causes problems in PPS HLT\\ sequence (probably due to missing conditions in DB)");

AddTask("g20", "bug fix of Run2 pixel topology", ass="Fabrizio", cons="Jan", stat="merged", pr="35671", flags="new-gm", comments="
recovers low-x pixel acceptance in Run2 direct simu WFs
");

AddTask("g21", "bug fix in data GTs for persistent geometry tags", ass="Helena", cons="", stat="merged", pr="35846", flags="new-gm", comments="", dep=deps("g18"));

AddTask("g22", "corrected material for Timing Station", ass="Sunanda", cons="", stat="merged", pr="35961", flags="new-gm", comments="");

AddTask("g23", "update of cfi files to point to latest PPS geometry", ass="Gustavo", cons="", stat="merged", pr="35996", flags="new-gm", comments="", dep=deps("g22"));

AddTask("g24", "upload of geometry to DB (DDD4HEP)", ass="Wagner", cons="", resp="Fabrizio", stat="open", flags="new-gm");

AddTask("g25", "cleaning unused materials (DDD4HEP)", ass="Carl", cons="Gustavo", resp="Fabrizio", stat="merged", pr="36307", flags="new-swm, new-gm");

//----------------------------------------
//AddCategory("optimisations");



//----------------------------------------
//AddCategory("alignment");



//----------------------------------------
AddCategory("reconstruction");

AddTask("re3", "update of N-F association cuts: class, DB infrastructure", ass="Grzegorz", cons="Jan", resp="", stat="merged", pr="35248", flags="new-gm");

AddTask("re4", "update of N-F association cuts: DB upload", ass="Wagner", cons="Jan", resp="", stat="done", pr="", flags="new-gm", dep=deps("re3"));

AddTask("re5", "update of N-F association cuts: use DB by default", ass="Jan", cons="", resp="", stat="merged", pr="35766", flags="new-gm", dep=deps("re4"));

AddTask("re7", "N-F association cuts: update GTs for data and MC", ass="Helena", cons="", resp="", stat="merged", pr="35914", flags="new-gm", dep=deps("re4"));

AddTask("re6", "N-F association cuts: bugfix for crash on DB read", ass="Jan", cons="", resp="", stat="merged", pr="35941", flags="new-gm", dep=deps("re7"));


//----------------------------------------
AddCategory("direct simulation");

AddTask("ds1", "adjust Run3 alignment", pri="", ass="Jan", stat="merged", pr="35424", dep=deps("g2"), flags="new-gm");

AddTask("ds4", "backport to CMSSW 10\_6", pri="", ass="", stat="pending", resp="POG", due="", dep=deps(), comments="backport of features only available in 11\_X/12\_X to the release used for Run2 analyses");



//----------------------------------------
AddCategory("DQM and validation plots");

AddTask("dqm5", "timing RPs -- support for SAMPIC readout", ass="Chris", resp="DPG", stat="merged", pr="35445", flags="new-gm",
	comments="adds sampic reco to the standard PPS reco sequence, for PPS DQM sequence it removes TOTEM timing and adds diamond sampic, in the DQM module it adds flags to enable/disable plots for online/offline DQM");

AddTask("dqm10", "timing RPs -- update diamond DQM", ass="Chris", resp="DPG", stat="merged", pr="35454", flags="new-gm");

AddTask("dqm11", "common module -- update RP ids", ass="Jan", resp="DPG", stat="merged", pr="35484", flags="new-gm");

AddTask("dqm6", "timing RPs -- extract harvesting code to harverster modules", ass="", resp="DPG", stat="pending", comments="
and add per-LS plots
");

AddTask("dqm9", "include PPS to T0 processing", ass="Fabrizio", resp="DPG", stat="open", pr="https://github.com/dmwm/T0/pull/4588", flags="", comments="", dep=deps("pcl11"));

AddTask("dqm12", "use Run3 era in online DQM, fix in master", ass="Jan", stat="merged", pr="35550", flags="new-gm");

AddTask("dqm13", "use Run3 era in online DQM, backport to 12\_0", ass="Jan", stat="merged", pr="35551", flags="new-gm", dep=deps("dqm12"));

AddTask("val1", "more validation plots", ass="Jan", stat="merged", pr="35740", flags="new-gm", comments="details of N-F association efficiency, distances between tracks in each RP, t bias and resolution 2D histogram");

AddTask("val2", "dLyds perturbation scenario for modified optics", ass="Frizi", stat="merged", pr="36039", flags="new-gm", comments="implemented in modified optics ES generator");

//----------------------------------------
AddCategory("PCLs");

AddTask("pcl5", "alignment -- update of config classes", ass="Mateusz", cons="Jan", resp="DPG", stat="merged", pr="35174", flags="new-gm", dep=deps());

AddTask("pcl6", "alignment -- upload of alignment config", ass="Mateusz,Wagner", cons="Jan", resp="DPG", stat="done", pr="", flags="new-gm", dep=deps("pcl5"));

AddTask("pcl7", "alignment -- PCL-like matrix workflow", ass="Mateusz", cons="Jan", resp="DPG", stat="merged", pr="35631", flags="new-gm", dep=deps("pcl6"));

AddTask("pcl8", "alignment -- inclusion in central PCL", ass="AlCa", cons="", resp="DPG", stat="pending", dep=deps("pcl7"));

AddTask("pcl9", "fix of alignment matrix test", ass="Mateusz", cons="Jan", resp="DPG", stat="merged", pr="35874",
	flags="new-gm", dep=deps("pcl7"), comments="
details in \ulink{https://github.com/cms-sw/cmssw/issues/35764}{here}
");

AddTask("pcl10", "fix of timing calibration matrix test", ass="Chris", cons="", resp="DPG", stat="merged", pr="35988", flags="new-gm");

AddTask("pcl11", "AlCaReco producer for PPS calibrations", ass="Andrea", cons="Leszek", resp="", stat="open", pr="36273", flags="new-swm, new-gm");

AddTask("pcl12", "alignment -- reformatting, readme", ass="Mateusz", cons="", resp="", stat="merged", pr="36257", flags="new-swm, new-gm", dep=deps("pcl7"));


//----------------------------------------
AddCategory("nanoAOD");

AddTask("na2", "simu tracks and protons in nanoAOD", ass="", cons="", resp="POG", stat="pending", dep=deps(), comments="
idea: run ``direct'' simu during nanoAOD production\\
by default, this would be disabled, but available for private use
");



//----------------------------------------
AddCategory("framework");

AddTask("fmw1", "UBSAN issue in TotemSampicFrame", ass="Chris", stat="merged", pr="35654", flags="new-gm", comments="
details in \ulink{https://github.com/cms-sw/cmssw/issues/35012#issuecomment-937741753}{here}
");

AddTask("fmw2", "UBSAN issue in CTPPSPixelDigiToRaw", ass="Fabrizio", stat="merged", pr="35592", flags="new-gm", comments="
details in \ulink{https://github.com/cms-sw/cmssw/issues/35012#issuecomment-937741753}{here}
");

AddTask("fmw3", "migration of PoolDBOutput service to *IOV methods", ass="Fabrizio", stat="merged", pr="36180", flags="new-swm, new-gm", comments="
draft PR under review, mem leak details in \ulink{https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuidePoolDBOutputService}{here}
");

//----------------------------------------
//AddCategory("filters");



//----------------------------------------
AddCategory("other");

AddTask("ot1", "standardised code for simu + PU event merging", ass="Andrea?", resp="POG", stat="pending", dep=deps(), comments="
code for standard PPS procedure of mixing (rec-hit level) simu signal with PU from unrelated real LHC events
");



//----------------------------------------
MakePlot(330, "new-swm");
