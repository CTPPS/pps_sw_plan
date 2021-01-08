import code;

//----------------------------------------
//AddCategory("data formats");

//----------------------------------------
AddCategory("geometry");
AddTask("g3", "update of diamond geometry for Run3", ass="Laurent", stat="done", pr="31484", dep=deps());

AddTask("g4", "fix z sign of diamonds", ass="Jan", cons="", resp="", stat="merged", dep=deps("g3"), pr="32603", comments="
LHC sector 45 should have z negative etc.\\
 * for Run3: correct z sign already in XML files\\
 * for Run2: z sign corrected in geometry builder\\
Remove sign fixing from: proton reco, direct simu
");

AddTask("g5", "fix overlaps of diamonds", ass="?", stat="pending", dep=deps("g3"));
AddTask("g6", "update pixels for Run3", ass="Fabrizio", resp="Wagner", stat="prepare", dep=deps("g3"));
AddTask("g7", "upload Run3 geometry XML to DB", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps("g4", "g5", "g6"));

AddTask("g11", "organise files in Geometry/VeryForwardData/data", ass="?", stat="pending", dep=deps("g5", "g6"));

AddTask("g8", "pre-processed geometry to DB -- initial", ass="Wagner", cons="Jan", resp="Fabrizio", stat="prepare", dep=deps(), comments="
* use a place-holder for Run3\\
* default reco sequence uses pre-processed geometry
");

AddTask("g2", "remove geometry specs from reco cff files", ass="?", stat="pending", dep=deps("g8"), comments="https://github.com/cms-sw/cmssw/issues/31360");

AddTask("g9", "pre-processed geometry to DB -- updated for Run3", ass="Wagner", resp="Fabrizio", stat="pending", dep=deps("g7", "g8"));

AddTask("g12", "check compatibility of scoring plane z", ass="Jan", resp="Fabrizio", stat="pending", due="Jan 2021", comments="
the same z should be used by strip RPs, pixel RPs and optics
");

AddTask("g13", "interprete DD4Hep values with DD4Hep units", ass="Gabrielle", resp="-",  pr="32538", stat="merged");

//----------------------------------------
//AddCategory("config");

//----------------------------------------
AddCategory("optimisations");

AddTask("opt1", "systematic use of edm::DetSetVector::emplace\_back", ass="Laurent", resp="Jan", stat="merged", pr="32572", comments="
cf. https://github.com/cms-sw/cmssw/pull/26069
");

//----------------------------------------
//AddCategory("alignment");

//----------------------------------------
//AddCategory("reconstruction");

//----------------------------------------
AddCategory("direct simulation");

AddTask("ds0", "per-year simulation with distributed conditions", ass="Chris, Jan", stat="done", pr="32207", dep=deps());

AddTask("ds1", "2021 profile", ass="Jan", resp="", stat="merged", dep=deps("g3"), pr="32602", comments="
adds also a default RP-position file with reasonable RP-beam distances (2mm for horizontal and 7mm for vertical RPs)
");

AddTask("ds2", "tracking-RP efficiency", ass="Jan", resp="Valentina", stat="prepare", dep=deps("ds0", "g4"));

AddTask("ds3", "use cloning in cff files", pri="high", ass="Laurent", resp="Jan", stat="prepare", dep=deps("g3", "ds1"), comments="
to address \ulink{https://github.com/cms-sw/cmssw/issues/32448}{issue \#32448}
"); // depends on ds1 since the 2021 configs will need updating

AddTask("ds4", "backport to 10\_6", ass="Jan", stat="pending", due="", dep=deps("ds2", "ds3"));

//----------------------------------------
AddCategory("DQM");

AddTask("dqm1", "pixels -- innocent bug fix", ass="Andrea", cons="Fabrizio", resp="Jan", stat="merged", pr="32584", comments="
NROCsMAX instead of NplaneMAX \ulink{https://github.com/cms-sw/cmssw/blob/ae40f9f461ab323a25c798728e99fbdfea645e1a/DQM/CTPPS/plugins/CTPPSPixelDQMSource.cc#L736}{here}
");

AddTask("dqm2", "timing RPs -- add new Run3 RPs", ass="Laurent", resp="Valentina", stat="prep", dep=deps("g3"));

AddTask("dqm3", "timing RPs -- other possible tasks", ass="?", stat="pending", comments="
config flags to enable/disable plots for online/offline DQM,
acquisition window size steered with a run-time parameter,\\
TotemTimingDQMSource adapted for SAMPIC,
extract harvesting code to harverster modules
");

//----------------------------------------
AddCategory("PCLs");

AddTask("pcl1", "timing calibration", ass="Laurent", cons="-", resp="Valentina", stat="prepare");
AddTask("pcl2", "alignment", ass="Mateusz?", cons="Jan", resp="Valentina", stat="pending");

//----------------------------------------
AddCategory("nanoAOD");

AddTask("na1", "reco tracks and protons in nanoAOD", ass="Justin", cons="Jan", resp="Antonio, Ksenia", stat="done", pr="31531", dep=deps(), comments="
Includes filter module to apply POG quality recommendations
");

AddTask("na2", "simu tracks and protons in nanoAOD", ass="Justin?", cons="Jan", resp="Antonio, Ksenia", stat="pending", dep=deps("na1"), comments="
idea: run ``direct'' simu during nanoAOD production\\
by default, this would be disabled, but available for private use
");

AddTask("na3", "backport of \#31531 to 10\_6", pri="high", ass="Justin", cons="", resp="Antonio, Ksenia", stat="open", pr="32616", dep=deps("na1"), comments="");

//----------------------------------------
//AddCategory("filters");

//----------------------------------------
AddCategory("framework");

AddTask("fwk1", "thread-safe ES data retrieval in all PPS code", ass="Laurent", resp="Jan", stat="merged", pr="32606", dep=deps());


MakePlot();
