struct Item
{
	string type;
	string tag;
	string name;

	string priority;
	string assigned;
	string consultant;
	string responsible;
	string status;
	string pr;
	string due_date;
	string comments;
	string flags;

	string dependencies[];

	// below variables for processing

	int idx;
	real xl, xr;
	real yt, yb, y;

	picture pic;
};

//----------------------------------------------------------------------------------------------------

Item items[];

void AddTask(string tag, string name, string pri="", string ass="", string cons="", string resp="?", string stat="",
	string pr="", string due="", string dep[] = new string[], string comments="", string flags="")
{
	// check if task with the tag already exists
	bool exists = false;
	for (Item t : items)
	{
		if (t.type == "task" && t.tag == tag)
			abort("ERROR in AddTask: task with tag '" + tag + "' already exists.");
	}

	// add task
	if (ass == "")
		ass = "\cRed{\bf missing!}\cBlack";

	Item t;
	t.type = "task";
	t.tag = tag;
	t.name = name;

	t.priority = pri;
	t.assigned = ass;
	t.consultant = cons;
	t.responsible = resp;
	t.status = stat;
	t.pr = pr;
	t.due_date = due;
	t.comments = comments;
	t.flags = flags;

	t.idx = -1;
	t.xl = 0;
	t.xr = 10;
	t.y = 0;

	t.dependencies = dep;

	items.push(t);
}

//----------------------------------------------------------------------------------------------------

void AddCategory(string name)
{
	Item t;
	t.type = "category";
	t.name = name;
	items.push(t);
}

//----------------------------------------------------------------------------------------------------

Item FindTask(string tag)
{
	for (Item t : items)
	{
		if (t.type == "task" && t.tag == tag)
			return t;
	}

	abort("ERROR in FindTaks: cannot find task with tag '" + tag + "'.");

	Item t;
	return t;
}

//----------------------------------------------------------------------------------------------------

string[] deps(... string[] d)
{
	return d;
}

//----------------------------------------------------------------------------------------------------
// pre-process task graph

string BuildItemLine(string tag, string description, string priority, string assigned_to, string consultant, string responsible, string due, string pr, string sd="")
{
	return "\hbox{\hbox to 1.5cm{" + tag + "\hfil}\hskip5mm\vtop{\hsize9cm " + description + "}\hbox to1.5cm{" + priority
		+ "\hfil}\hbox to3cm{" + assigned_to + "\hfil}\hbox to3cm{" + consultant + "\hfil}\hbox to3cm{" + responsible
		+ "\hfil}\hbox to2cm{" + due + "\hfil}\hbox to1.3cm{" + pr + "\hfil}\hbox to5cm{" + sd + "\hfil}}";
}

//----------------------------------------------------------------------------------------------------

void ProcessItems()
{
	// resolve dependency graph
	bool work = true;

	while (work)
	{
		work = false;

		for (Item t : items)
		{
			if (t.idx < 0)
			{
				int max_idx = -1;
				bool unresolved = false;
				for (string d : t.dependencies)
				{
					Item td = FindTask(d);
					if (td.idx < 0)
					{
						unresolved = true;
						break;
					} else {
						max_idx = max(max_idx, td.idx);
					}
				}

				if (unresolved)
				{
					work = true;
				} else {
					t.idx = max_idx + 1;			
				}
			}
		}
	}

	// build line pictures, set x and y positions
	real y = 0, yg = 2;
	real xw = 10, xg = 10;

	for (Item it : items)
	{
		// build picture	
		if (it.type == "category")
		{
			label(it.pic, "\hbox{\bf " + it.name + ":}", (-30, 0), SE);
			y -= 10;
		}

		if (it.type == "task")
		{
			string description = "\noindent\hskip-5mm {\it\cBlue " + it.name + "\cBlack}";
			if (it.comments != "")
			{
				description = description + "\\\SmallerFonts " + it.comments;
			}

			string pr = "";
			if (it.pr != "")
			{
				if (find(it.pr, "http") == 0)
					pr = "\ulink{" + it.pr + "}{link}";
				else
					pr = "\ulink{https://github.com/cms-sw/cmssw/pull/" + it.pr + "}{\#" + it.pr + "}";
			}

			string line = BuildItemLine(it.tag, description, it.priority, it.assigned, it.consultant, it.responsible, it.due_date, pr);
			label(it.pic, line, (0, 0), SE);
		}

		real sy = size(it.pic).y / 1mm * 1pt;

		// set x and y positions
		it.xl = it.idx * (xw + xg);
		it.xr = it.xl + xw;

		it.yt = y;
		it.yb = y - sy;
		it.y = (it.yt + it.yb) / 2;

		y -= sy + yg;
	}
}

//----------------------------------------------------------------------------------------------------
// make plot

void PlotItems(real width, string highlight_flag)
{
	unitsize(1mm);

	real x0 = 250, dy = 3;

	label(BuildItemLine("\bf tag", "\noindent\hskip-5mm\bf task", "\bf priority", "\bf assignee", "\bf consultant", "\bf responsible", "\bf due date", "\bf PR", "\bf status + dependence"), (0, -5), E);

	for (Item it : items)
	{
		draw((-10, it.yt + 1)--(width, it.yt + 1), dotted);

		add(it.pic, (0, it.yt));

		if (it.type == "task")
		{
			pen p = gray;
			if (it.status == "pending") p = red;
			if (it.status == "prepare" || it.status == "preparing" || it.status == "prep") p = 0.7*orange + 0.3*yellow;
			if (it.status == "ongoing" || it.status == "open") p = yellow;
			if (it.status == "done" || it.status == "merged") p = green;

			pen p_border = black + 0.1pt;

			string flags[] = split(it.flags, ",");

			for (string flag : flags)
			{
				if (flag == highlight_flag)
				{
					p_border = blue + 3pt + linetype(new real[] {2, 2});
					break;
				}
			}

			filldraw((x0+it.xl, it.yb)--(x0+it.xr, it.yb)--(x0+it.xr, it.yt)--(x0+it.xl, it.yt)--cycle, p, p_border);

			for (string dep : it.dependencies)
			{
				Item td = FindTask(dep);
				draw((x0+it.xl, it.y)--(x0+td.xr, td.y), EndArrow);
			}
		}
	}
}

//----------------------------------------------------------------------------------------------------
// user plot command

void MakePlot(real width = 360, string highlight_flag="new")
{
	ProcessItems();
	PlotItems(width, highlight_flag);
}

//----------------------------------------------------------------------------------------------------

texpreamble("\def\\{\hfil\break}");
texpreamble("\def\cBlack{\pdfliteral{0 0 0 1 k}}");
texpreamble("\def\cBlue{\pdfliteral{1 1 0 0 k}}");
texpreamble("\def\cRed{\pdfliteral{0 0.8 0.8 0 k}}");

texpreamble("\def\SmallerFonts{}");

texpreamble("\def\uline#1{\vtop{\hbox{#1}\vskip.5mm\vskip-\prevdepth\hrule\vskip1.5mm}}");
texpreamble("\def\link#1#2{\pdfstartlink attr{/Border [0 0 0]} user{/Subtype/Link/A<</Type/Action/S/URI/URI(#1)>>}#2\pdfendlink}");
texpreamble("\def\ulink#1#2{\uline{\link{#1}{#2}}}");
