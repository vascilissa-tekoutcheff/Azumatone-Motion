{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 9,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"openrect" : [ 100.0, 100.0, 900.0, 700.0 ],
		"default_fontsize" : 14.0,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"fontsize" : 26.0,
					"id" : "title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 20.0, 157.0, 36.0 ],
					"text" : "azu.fluence~"
				}

			}
, 			{
				"box" : 				{
					"id" : "intro",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 66.0, 408.0, 22.0 ],
					"text" : "One target signal, several elastic trajectories that move together."
				}

			}
, 			{
				"box" : 				{
					"id" : "dsp",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 112.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "dsp-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 95.0, 122.0, 273.0, 22.0 ],
					"text" : "1. Enable DSP. This help makes no sound."
				}

			}
, 			{
				"box" : 				{
					"id" : "target-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 180.0, 331.0, 22.0 ],
					"text" : "2. Click a target, then watch the four voices follow it."
				}

			}
, 			{
				"box" : 				{
					"id" : "up",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 30.0, 220.0, 47.0, 24.0 ],
					"text" : "1. 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "down",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 145.0, 220.0, 47.0, 24.0 ],
					"text" : "0. 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "target",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 30.0, 270.0, 54.0, 24.0 ],
					"text" : "line~ 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "classic",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 30.0, 388.0, 289.0, 24.0 ],
					"text" : "azu.fluence~ 4 @mode bounded @range 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "controls-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 460.0, 220.0, 302.0, 22.0 ],
					"text" : "3. Change the motion, then click a target again."
				}

			}
, 			{
				"box" : 				{
					"attr" : "dispersion",
					"id" : "dispersion-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 470.000014007091522, 260.0, 158.666671395301819, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "dispersion-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 261.0, 90.0, 22.0 ],
					"text" : "Spread (0..1)"
				}

			}
, 			{
				"box" : 				{
					"attr" : "cohesion",
					"id" : "cohesion-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 470.000014007091522, 302.0, 158.666671395301819, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "cohesion-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 303.0, 129.0, 22.0 ],
					"text" : "Togetherness (0..1)"
				}

			}
, 			{
				"box" : 				{
					"attr" : "inertia",
					"id" : "inertia-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 470.000014007091522, 344.0, 158.666671395301819, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "inertia-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 345.0, 108.0, 22.0 ],
					"text" : "Time scale (ms)"
				}

			}
, 			{
				"box" : 				{
					"attr" : "damping",
					"id" : "damping-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 470.000014007091522, 386.0, 158.666671395301819, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "damping-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 387.0, 92.0, 22.0 ],
					"text" : "Settling (0..1)"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "s0",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 437.0, 606.0, 156.0 ],
					"range" : [ -0.05, 1.05 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.054901960784314, 1.0, 0.0, 1.0 ],
					"id" : "s1",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 437.0, 606.0, 156.0 ],
					"range" : [ -0.05, 1.05 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "s2",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 437.0, 606.0, 156.0 ],
					"range" : [ -0.05, 1.05 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.580392156862745, 0.03921568627451, 0.847058823529412, 1.0 ],
					"id" : "s3",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 437.0, 606.0, 156.0 ],
					"range" : [ -0.05, 1.05 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "footer",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 610.0, 860.0, 38.0 ],
					"text" : "This example stays within 0..1. Without @mode bounded, Fluence runs free and may overshoot.\nThe argument 4 creates four outlets. For one multichannel cable instead, use mc.azu.fluence~."
				}

			}
, 			{
				"box" : 				{
					"id" : "voices-legend",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.0, 455.0, 210.0, 86.0 ],
					"text" : "Four voices:\n1  white\n2  green\n3  red\n4  purple"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "s0", 0 ],
					"source" : [ "classic", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "s1", 0 ],
					"midpoints" : [ 129.5, 424.333339840173721, 39.5, 424.333339840173721 ],
					"source" : [ "classic", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "s2", 0 ],
					"midpoints" : [ 219.5, 424.333339840173721, 39.5, 424.333339840173721 ],
					"source" : [ "classic", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "s3", 0 ],
					"midpoints" : [ 309.5, 424.333339840173721, 39.5, 424.333339840173721 ],
					"source" : [ "classic", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "classic", 0 ],
					"hidden" : 1,
					"source" : [ "cohesion-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "classic", 0 ],
					"hidden" : 1,
					"midpoints" : [ 479.500014007091522, 420.0, 442.394538253545761, 420.0, 442.394538253545761, 378.0, 39.5, 378.0 ],
					"source" : [ "damping-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "classic", 0 ],
					"hidden" : 1,
					"source" : [ "dispersion-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "target", 0 ],
					"source" : [ "down", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "classic", 0 ],
					"hidden" : 1,
					"source" : [ "inertia-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "classic", 0 ],
					"source" : [ "target", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "target", 0 ],
					"source" : [ "up", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "azu.fluence~.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
