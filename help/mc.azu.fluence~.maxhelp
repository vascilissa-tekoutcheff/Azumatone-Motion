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
		"rect" : [ 100.0, 100.0, 900.0, 700.0 ],
		"default_fontsize" : 14.0,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"bubblesize" : 24,
					"id" : "obj-1",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "preset", "int", "preset", "int", "" ],
					"patching_rect" : [ 818.0, 360.0, 34.0, 34.0 ],
					"preset_data" : [ 						{
							"number" : 1,
							"data" : [ 5, "damping-ui", "attrui", "attr", "damping", 5, "damping-ui", "attrui", "float", 0.35, 5, "inertia-ui", "attrui", "attr", "inertia", 5, "inertia-ui", "attrui", "float", 150.0, 5, "cohesion-ui", "attrui", "attr", "cohesion", 5, "cohesion-ui", "attrui", "float", 0.35, 5, "dispersion-ui", "attrui", "attr", "dispersion", 5, "dispersion-ui", "attrui", "float", 0.5 ]
						}
 ]
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 26.0,
					"id" : "title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 20.0, 260.0, 36.0 ],
					"text" : "mc.azu.fluence~"
				}

			}
, 			{
				"box" : 				{
					"id" : "intro",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 62.0, 610.0, 22.0 ],
					"text" : "One mono target signal, several elastic trajectories in one multichannel cable."
				}

			}
, 			{
				"box" : 				{
					"id" : "dsp",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 105.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "dsp-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 90.0, 116.0, 330.0, 22.0 ],
					"text" : "1. Enable DSP. This help makes no sound."
				}

			}
, 			{
				"box" : 				{
					"id" : "target-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 170.0, 390.0, 22.0 ],
					"text" : "2. Choose a target for the four voices."
				}

			}
, 			{
				"box" : 				{
					"id" : "up",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 30.0, 208.0, 55.0, 24.0 ],
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
					"patching_rect" : [ 120.0, 208.0, 55.0, 24.0 ],
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
					"patching_rect" : [ 30.0, 252.0, 70.0, 24.0 ],
					"text" : "line~ 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "mc",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 30.0, 300.0, 340.0, 24.0 ],
					"text" : "mc.azu.fluence~ 4 @mode bounded @range 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "unpack",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 30.0, 345.0, 110.0, 24.0 ],
					"text" : "mc.unpack~ 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "controls-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 470.0, 170.0, 375.0, 22.0 ],
					"text" : "3. Shape the motion, then try another target."
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
					"patching_rect" : [ 470.0, 208.0, 170.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "dispersion-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.0, 209.0, 150.0, 22.0 ],
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
					"patching_rect" : [ 470.0, 248.0, 170.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "cohesion-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.0, 249.0, 150.0, 22.0 ],
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
					"patching_rect" : [ 470.0, 288.0, 170.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "inertia-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.0, 289.0, 150.0, 22.0 ],
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
					"patching_rect" : [ 470.0, 328.0, 170.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "damping-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.0, 329.0, 150.0, 22.0 ],
					"text" : "Settling (0..1)"
				}

			}
, 			{
				"box" : 				{
					"id" : "voice-1-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 438.0, 100.0, 22.0 ],
					"text" : "Voice 1",
					"textcolor" : [ 0.72, 0.43, 0.04, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "voice-2-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 470.0, 100.0, 22.0 ],
					"text" : "Voice 2",
					"textcolor" : [ 0.47, 0.16, 0.68, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "voice-3-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 502.0, 100.0, 22.0 ],
					"text" : "Voice 3",
					"textcolor" : [ 0.08, 0.53, 0.08, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "voice-4-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 534.0, 100.0, 22.0 ],
					"text" : "Voice 4",
					"textcolor" : [ 0.08, 0.30, 0.76, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.945098039215686, 0.654901960784314, 0.141176470588235, 1.0 ],
					"id" : "s0",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 405.0, 670.0, 190.0 ],
					"range" : [ -0.05, 1.05 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.580392156862745, 0.03921568627451, 0.847058823529412, 1.0 ],
					"id" : "s1",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 405.0, 670.0, 190.0 ],
					"range" : [ -0.05, 1.05 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.054901960784314, 1.0, 0.0, 1.0 ],
					"id" : "s2",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 405.0, 670.0, 190.0 ],
					"range" : [ -0.05, 1.05 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.047058823529412, 0.305882352941176, 1.0, 1.0 ],
					"id" : "s3",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 30.0, 405.0, 670.0, 190.0 ],
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
					"patching_rect" : [ 30.0, 625.0, 820.0, 38.0 ],
					"text" : "This example stays within 0..1. Without @mode bounded, Fluence runs free and may overshoot.\nThe argument 4 creates four channels. mc.unpack~ separates them here only for display."
				}

			}
, 			{
				"box" : 				{
					"id" : "preset-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 724.0, 366.0, 90.0, 22.0 ],
					"text" : "Defaults"
				}

			}
, 			{
				"box" : 				{
					"id" : "scope-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 405.0, 145.0, 22.0 ],
					"text" : "Four voices"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "mc", 0 ],
					"hidden" : 1,
					"source" : [ "cohesion-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mc", 0 ],
					"hidden" : 1,
					"source" : [ "damping-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mc", 0 ],
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
					"destination" : [ "mc", 0 ],
					"hidden" : 1,
					"source" : [ "inertia-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "unpack", 0 ],
					"source" : [ "mc", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "cohesion-ui", 0 ],
					"hidden" : 1,
					"order" : 2,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "damping-ui", 0 ],
					"hidden" : 1,
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "dispersion-ui", 0 ],
					"hidden" : 1,
					"order" : 3,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "inertia-ui", 0 ],
					"hidden" : 1,
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "mc", 0 ],
					"source" : [ "target", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "s0", 0 ],
					"source" : [ "unpack", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "s1", 0 ],
					"source" : [ "unpack", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "s2", 0 ],
					"source" : [ "unpack", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "s3", 0 ],
					"source" : [ "unpack", 3 ]
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
				"name" : "mc.azu.fluence~.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
