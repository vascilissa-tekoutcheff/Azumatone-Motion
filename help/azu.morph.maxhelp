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
		"rect" : [ 201.0, -912.0, 900.0, 650.0 ],
		"default_fontsize" : 14.0,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"fontsize" : 26.0,
					"id" : "title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 20.0, 800.0, 36.0 ],
					"text" : "azu.morph"
				}

			}
, 			{
				"box" : 				{
					"id" : "intro",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 66.0, 830.0, 22.0 ],
					"text" : "Move between two lists of values with one easing curve. No DSP needed."
				}

			}
, 			{
				"box" : 				{
					"id" : "state-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 112.0, 800.0, 22.0 ],
					"text" : "1. Click to start again: A = [220, 0.1, -1], B = [880, 0.8, 1]."
				}

			}
, 			{
				"box" : 				{
					"id" : "load",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 150.0, 85.0, 24.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "init",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 140.0, 150.0, 400.0, 24.0 ],
					"text" : "clear, list 220. 0.1 -1., list 880. 0.8 1., 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "progress-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 196.0, 410.0, 22.0 ],
					"text" : "2. Move from A (0) to B (1)."
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "slider",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"orientation" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 30.0, 232.0, 300.0, 24.0 ],
					"size" : 1.0
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "progress",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 30.0, 274.0, 90.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "morph",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 30.0, 330.0, 220.0, 24.0 ],
					"text" : "azu.morph @headroom 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "result",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 30.0, 390.0, 380.0, 24.0 ],
					"text" : "220. 0.1 -1."
				}

			}
, 			{
				"box" : 				{
					"id" : "result-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 428.0, 420.0, 22.0 ],
					"text" : "4. Read the output list: frequency, amplitude, pan."
				}

			}
, 			{
				"box" : 				{
					"id" : "settings-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 480.0, 196.0, 380.0, 22.0 ],
					"text" : "3. Choose a curve, then move again."
				}

			}
, 			{
				"box" : 				{
					"attr" : "function",
					"id" : "function-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 490.0, 232.0, 350.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "mode",
					"id" : "mode-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 490.0, 274.0, 350.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "curve-note",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 480.0, 330.0, 380.0, 53.0 ],
					"text" : "Try hesitate or recoil.\nAll values share the same shaped progression.\nHeadroom 0 keeps them between the two states."
				}

			}
, 			{
				"box" : 				{
					"id" : "semantics",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 484.0, 830.0, 38.0 ],
					"text" : "The first list initializes; each later list sets a new destination from the current output.\nLists must have the same length. Send clear to start with a different number of values."
				}

			}
, 			{
				"box" : 				{
					"id" : "timed-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 556.0, 570.0, 22.0 ],
					"text" : "Want automatic timing instead of a slider? Use @duration <ms>:"
				}

			}
, 			{
				"box" : 				{
					"id" : "open-timed",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 30.0, 594.0, 250.0, 24.0 ],
					"text" : "load azu.morph-timed.maxpat"
				}

			}
, 			{
				"box" : 				{
					"id" : "pcontrol",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 320.0, 594.0, 58.0, 24.0 ],
					"text" : "pcontrol"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "morph", 0 ],
					"hidden" : 1,
					"source" : [ "function-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "morph", 0 ],
					"source" : [ "init", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "init", 0 ],
					"source" : [ "load", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "morph", 0 ],
					"hidden" : 1,
					"source" : [ "mode-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "result", 1 ],
					"source" : [ "morph", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "pcontrol", 0 ],
					"source" : [ "open-timed", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "morph", 0 ],
					"source" : [ "progress", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "progress", 0 ],
					"source" : [ "slider", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "azu.morph.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
