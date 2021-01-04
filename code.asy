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

	string dependencies[];

	// below variables for processing

	int idx;
	real xl, xr;
	real yt, yb, y;

	picture pic;
};

Item items[];

void AddTask(string tag, string name, string pri="", string ass="?", string cons="", string resp="?", string stat="",
	string pr="", string due="", string dep[] = new string[], string comments="")
{
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

	t.idx = -1;
	t.xl = 0;
	t.xr = 10;
	t.y = 0;

	t.dependencies = dep;

	items.push(t);
}

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

			string pr = (it.pr != "") ? "\ulink{https://github.com/cms-sw/cmssw/pull/" + it.pr + "}{\#" + it.pr + "}" : "";

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

void PlotItems()
{
	unitsize(1mm);

	real x0 = 250, dy = 3;

	label(BuildItemLine("\bf tag", "\noindent\hskip-5mm\bf task", "\bf priority", "\bf assignee", "\bf consultant", "\bf responsible", "\bf due date", "\bf PR", "\bf status + dependence"), (0, -5), E);

	for (Item it : items)
	{
		draw((-10, it.yt + 1)--(360, it.yt + 1), dotted);

		add(it.pic, (0, it.yt));

		if (it.type == "task")
		{
			pen p = gray;
			if (it.status == "pending") p = red;
			if (it.status == "prepare" || it.status == "preparing" || it.status == "prep") p = 0.7*orange + 0.3*yellow;
			if (it.status == "ongoing" || it.status == "open") p = yellow;
			if (it.status == "done" || it.status == "merged") p = green;

			filldraw((x0+it.xl, it.yb)--(x0+it.xr, it.yb)--(x0+it.xr, it.yt)--(x0+it.xl, it.yt)--cycle, p, black+0.1pt);

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

void MakePlot()
{
	ProcessItems();
	PlotItems();
}
