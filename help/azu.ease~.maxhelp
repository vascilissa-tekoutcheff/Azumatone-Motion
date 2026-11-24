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
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1199.0, 478.0, 201.0, 24.0 ],
					"text" : "window size 100 100 1000 800"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1199.0, 525.0, 77.0, 24.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 429.0, 336.0, 216.0, 22.0 ],
					"text" : "0 = identical; 1 = more variation."
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.580392156862745, 0.03921568627451, 0.847058823529412, 1.0 ],
					"id" : "obj-6",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 24.0, 405.0, 862.0, 223.0 ],
					"range" : [ -0.5, 1.5 ],
					"samples" : 96000.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 772.0, 320.0, 91.0, 24.0 ],
					"text" : "tapout~ 2000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 772.0, 280.0, 82.0, 24.0 ],
					"text" : "tapin~ 2000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 635.0, 860.0, 38.0 ],
					"text" : "Drift adds deterministic variation at each ramp restart; at drift = 0, the curve repeats identically.\nnextdrift: next variation; resetdrift: first variation. Each delay is 2 s, matching the 0.5 Hz phasor."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 709.0, 240.0, 91.0, 24.0 ],
					"text" : "tapout~ 2000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 709.0, 200.0, 82.0, 24.0 ],
					"text" : "tapin~ 2000"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 0.054901960784314, 1.0, 0.0, 1.0 ],
					"id" : "obj-1",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 24.0, 405.0, 862.0, 223.0 ],
					"range" : [ -0.5, 1.5 ],
					"samples" : 96000.0
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 26.0,
					"id" : "title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 18.0, 129.0, 36.0 ],
					"text" : "azu.ease~"
				}

			}
, 			{
				"box" : 				{
					"id" : "intro",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 56.0, 550.0, 22.0 ],
					"text" : "Shape a normalized signal with one of 19 expressive easing curves."
				}

			}
, 			{
				"box" : 				{
					"id" : "dsp",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 92.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "dsp-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 84.0, 103.0, 530.0, 22.0 ],
					"text" : "Enable DSP to view the signal. This help patch makes no sound."
				}

			}
, 			{
				"box" : 				{
					"id" : "input-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 151.0, 223.0, 22.0 ],
					"text" : "1. A 0..1 ramp at 0.5 Hz"
				}

			}
, 			{
				"box" : 				{
					"id" : "ramp",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 24.0, 190.0, 83.0, 24.0 ],
					"text" : "phasor~ 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "ease",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 24.0, 270.0, 217.0, 24.0 ],
					"text" : "azu.ease~ @function smoothstep"
				}

			}
, 			{
				"box" : 				{
					"id" : "scope-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 43.0, 340.0, 324.0, 22.0 ],
					"text" : "3. Compare the output with its two previous cycles:"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
					"activelinecolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "scope",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 24.0, 405.0, 862.0, 223.0 ],
					"range" : [ -0.5, 1.5 ],
					"samples" : 96000.0
				}

			}
, 			{
				"box" : 				{
					"id" : "settings-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 264.0, 151.0, 340.0, 22.0 ],
					"text" : "2. Choose a curve and adjust its behavior:"
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
					"patching_rect" : [ 264.0, 186.0, 210.0, 24.0 ]
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
					"patching_rect" : [ 264.0, 216.0, 154.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "overshoot",
					"id" : "overshoot-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 264.0, 246.0, 154.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "headroom",
					"id" : "headroom-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 264.0, 276.0, 154.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "drift",
					"id" : "drift-ui",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 264.0, 306.0, 154.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "controls-note",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 429.0, 216.0, 205.0, 53.0 ],
					"text" : "Mode: in / out / inout.\nOvershoot 1 = native character.\nHeadroom 0 clamps to 0..1."
				}

			}
, 			{
				"box" : 				{
					"id" : "footer",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 677.0, 645.0, 22.0 ],
					"text" : "Character changes ramp over 5 ms; function changes crossfade over 10 ms. Output is a control signal."
				}

			}
, 			{
				"box" : 				{
					"id" : "legend-previous",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 43.0, 372.0, 144.0, 22.0 ],
					"text" : "Green: previous cycle",
					"textcolor" : [ 0.054901960784314, 1.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "legend-older",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 263.0, 372.0, 156.0, 22.0 ],
					"text" : "Cyan: two cycles earlier",
					"textcolor" : [ 0.580392156862745, 0.03921568627451, 0.847058823529412, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "delay-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 709.0, 151.0, 159.0, 22.0 ],
					"text" : "Cycle history (2 s / step)"
				}

			}
, 			{
				"box" : 				{
					"id" : "window-note",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 468.0, 372.0, 205.0, 22.0 ],
					"text" : "96,000 samples = 2 s at 48 kHz"
				}

			}
, 			{
				"box" : 				{
					"id" : "nextdrift",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 429.0, 306.0, 66.0, 24.0 ],
					"text" : "nextdrift"
				}

			}
, 			{
				"box" : 				{
					"id" : "resetdrift",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 501.0, 306.0, 74.0, 24.0 ],
					"text" : "resetdrift"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"midpoints" : [ 273.5, 335.0, 252.0, 335.0, 252.0, 260.0, 33.5, 260.0 ],
					"source" : [ "drift-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 33.5, 335.35546875, 699.0, 335.35546875, 699.0, 190.0, 718.5, 190.0 ],
					"order" : 0,
					"source" : [ "ease", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "scope", 0 ],
					"order" : 1,
					"source" : [ "ease", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"midpoints" : [ 273.5, 212.0, 252.0, 212.0, 252.0, 260.0, 33.5, 260.0 ],
					"source" : [ "function-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"midpoints" : [ 273.5, 302.0, 252.0, 302.0, 252.0, 260.0, 33.5, 260.0 ],
					"source" : [ "headroom-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"midpoints" : [ 273.5, 242.0, 252.0, 242.0, 252.0, 260.0, 33.5, 260.0 ],
					"source" : [ "mode-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"source" : [ "nextdrift", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 718.5, 395.0, 33.5, 395.0 ],
					"order" : 1,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"order" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 781.5, 399.0, 33.5, 399.0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"midpoints" : [ 273.5, 272.0, 252.0, 272.0, 252.0, 260.0, 33.5, 260.0 ],
					"source" : [ "overshoot-ui", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"source" : [ "ramp", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "ease", 0 ],
					"source" : [ "resetdrift", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "azu.ease~.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
