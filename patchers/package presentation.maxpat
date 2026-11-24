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
		"rect" : [ 278.0, 208.0, 864.0, 842.0 ],
		"openinpresentation" : 1,
		"default_fontsize" : 14.0,
		"gridsize" : [ 10.0, 10.0 ],
		"toolbarvisible" : 0,
		"enablehscroll" : 0,
		"enablevscroll" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lato Regular",
					"fontsize" : 48.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 48.0, 34.0, 1150.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 34.0, 421.0, 64.0 ],
					"text" : "Azumatone Motion",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.909803921568627 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 16.0,
					"id" : "obj-6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 49.0, 88.0, 692.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 100.0, 225.0, 26.0 ],
					"text" : "Expressive trajectories for Max",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.909803921568627 ]
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 15.0,
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 49.0, 135.0, 1010.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 49.0, 135.0, 521.0, 23.0 ],
					"text" : "Easing curves, state transitions and elastic voices, for messages and signals."
				}

			}
, 			{
				"box" : 				{
					"angle" : 133.994913994745843,
					"background" : 1,
					"grad1" : [ 0.6, 0.4, 1.0, 1.0 ],
					"grad2" : [ 0.163688058058427, 0.163688010157025, 0.163688022674427, 1.0 ],
					"id" : "divider",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 184.0, 1020.0, 4.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 50.0, 177.0, 753.0, 14.0 ],
					"proportion" : 0.416928557917448,
					"pt1" : [ 0.97979797979798, 1.045454545454545 ],
					"pt2" : [ -0.01010101010101, 0.02020202020202 ],
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.27843137254902, 0.274509803921569, 0.274509803921569, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"id" : "row-ease",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 48.0, 208.0, 1024.0, 102.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 208.0, 760.0, 102.0 ],
					"proportion" : 0.5,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 11.0,
					"id" : "label-ease",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 70.0, 270.0, 173.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 270.0, 112.0, 20.0 ],
					"text" : "NUMBERS & LISTS"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 15.0,
					"id" : "obj-21",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.0, 224.0, 555.0, 60.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 222.0, 224.0, 572.0, 60.0 ],
					"text" : "Maps numbers or lists in 0..1 through one of 19 easing curves, without DSP.\n@function, @mode and @overshoot set the curve; @drift varies it per nextdrift.\n@headroom sets a margin into which excursions beyond 0..1 are softly compressed.",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.909803921568627 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.27843137254902, 0.274509803921569, 0.274509803921569, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"id" : "row-morph",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 48.0, 324.0, 1024.0, 102.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 324.0, 760.0, 102.0 ],
					"proportion" : 0.5,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 11.0,
					"id" : "label-morph",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 70.0, 386.0, 171.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 386.0, 113.0, 20.0 ],
					"text" : "STATE TRANSITIONS"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 15.0,
					"id" : "obj-20",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.0, 340.0, 532.0, 60.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 222.0, 340.0, 572.0, 60.0 ],
					"text" : "Interpolates numbers or lists between two states along any of azu.ease's curves.\nProgress comes from the input or from a timer set by @duration (ms).\nRetargeting starts the next transition from the current output.",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.909803921568627 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.27843137254902, 0.274509803921569, 0.274509803921569, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"id" : "row-audio",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 48.0, 440.0, 1024.0, 102.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 440.0, 760.0, 102.0 ],
					"proportion" : 0.5,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 11.0,
					"id" : "label-audio",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 70.0, 502.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 502.0, 39.0, 20.0 ],
					"text" : "ALSO:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 15.0,
					"id" : "obj-18",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.0, 456.0, 509.0, 42.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 222.0, 465.0, 572.0, 42.0 ],
					"text" : "Signal-rate counterpart of azu.ease, driven by a progress signal.\n@drift is renewed by nextdrift or by input jumps over 0.5 landing near 0 or 1.",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.909803921568627 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.27843137254902, 0.274509803921569, 0.274509803921569, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"id" : "row-fluence",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 48.0, 556.0, 1024.0, 102.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 556.0, 760.0, 102.0 ],
					"proportion" : 0.5,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 11.0,
					"id" : "label-fluence",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 70.0, 618.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 618.0, 39.0, 20.0 ],
					"text" : "ALSO:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 15.0,
					"id" : "obj-16",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.0, 572.0, 571.0, 60.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 222.0, 572.0, 572.0, 60.0 ],
					"text" : "A mono target signal drives several coupled elastic voices.\n@inertia (ms) and @damping set their response, @cohesion draws them together,\n@dispersion spreads them during transitions; @mode bounded keeps them in @range.",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.909803921568627 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.27843137254902, 0.274509803921569, 0.274509803921569, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"id" : "row-gen",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 48.0, 672.0, 1024.0, 102.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 672.0, 760.0, 102.0 ],
					"proportion" : 0.5,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 11.0,
					"id" : "label-gen",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 70.0, 734.0, 185.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 734.0, 127.0, 20.0 ],
					"text" : "ALSO: mc.gen~ azu.ease"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato Regular",
					"fontsize" : 15.0,
					"id" : "obj-14",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.0, 688.0, 489.0, 60.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 222.0, 688.0, 572.0, 60.0 ],
					"text" : "gen~ port of the same curves: azu.ease.gendsp, or the azuEase* functions\nof AzumatoneEaseFunctions.genexpr for use in codeboxes.\nWith @drift above 0, each mc.gen~ channel varies independently.",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.909803921568627 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lato",
					"fontsize" : 11.0,
					"id" : "help-button-ease",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1002.0, 286.0, 70.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 231.0, 83.0, 24.0 ],
					"text" : "azu.ease"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lato",
					"fontsize" : 11.0,
					"id" : "help-button-morph",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1002.0, 402.0, 70.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 347.0, 83.0, 24.0 ],
					"text" : "azu.morph"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lato",
					"fontsize" : 11.0,
					"id" : "help-button-audio",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1002.0, 518.0, 70.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 463.0, 83.0, 24.0 ],
					"text" : "azu.ease~"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lato",
					"fontsize" : 11.0,
					"id" : "help-button-fluence",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1002.0, 634.0, 70.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 579.0, 83.0, 24.0 ],
					"text" : "azu.fluence~"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lato",
					"fontsize" : 11.0,
					"id" : "help-button-gen",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1002.0, 750.0, 70.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.0, 695.0, 83.0, 24.0 ],
					"text" : "gen~ azu.ease"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "help-target-ease",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1100.0, 230.0, 65.0, 24.0 ],
					"text" : "azu.ease"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "help-target-morph",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1100.0, 272.333333333333314, 75.0, 24.0 ],
					"text" : "azu.morph"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "help-target-audio",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1100.0, 314.666666666666629, 73.0, 24.0 ],
					"text" : "azu.ease~"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "help-target-fluence",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1100.0, 356.999999999999943, 88.0, 24.0 ],
					"text" : "azu.fluence~"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "open-target-gen",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1100.0, 441.666666666666572, 145.0, 24.0 ],
					"text" : "load azu.ease.gendsp"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "prepend-help",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1240.0, 300.0, 90.0, 24.0 ],
					"text" : "prepend help"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "presentation-control",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1240.0, 350.0, 67.0, 24.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"fontname" : "Lato Regular",
					"fontsize" : 11.0,
					"id" : "help-button-mc-audio",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 978.0, 496.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 104.0, 502.0, 100.0, 20.0 ],
					"rounded" : 4.0,
					"text" : "mc.azu.ease~",
					"textcolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"textoncolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"textovercolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "help-target-mc-audio",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1100.5, 399.333333333333258, 96.0, 24.0 ],
					"text" : "mc.azu.ease~"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgoncolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"fontname" : "Lato Regular",
					"fontsize" : 11.0,
					"id" : "help-button-mc-fluence",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 978.0, 612.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 104.0, 618.0, 100.0, 20.0 ],
					"rounded" : 4.0,
					"text" : "mc.azu.fluence~",
					"textcolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"textoncolor" : [ 0.705882352941177, 0.772549019607843, 0.733333333333333, 1.0 ],
					"textovercolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "help-target-mc-fluence",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1100.0, 483.999999999999886, 111.0, 24.0 ],
					"text" : "mc.azu.fluence~"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "help-target-audio", 0 ],
					"source" : [ "help-button-audio", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "help-target-ease", 0 ],
					"source" : [ "help-button-ease", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "help-target-fluence", 0 ],
					"source" : [ "help-button-fluence", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "open-target-gen", 0 ],
					"source" : [ "help-button-gen", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "help-target-mc-audio", 0 ],
					"source" : [ "help-button-mc-audio", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "help-target-mc-fluence", 0 ],
					"source" : [ "help-button-mc-fluence", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "help-target-morph", 0 ],
					"source" : [ "help-button-morph", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "prepend-help", 0 ],
					"source" : [ "help-target-audio", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "prepend-help", 0 ],
					"source" : [ "help-target-ease", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "prepend-help", 0 ],
					"source" : [ "help-target-fluence", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "prepend-help", 0 ],
					"source" : [ "help-target-mc-audio", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "prepend-help", 0 ],
					"source" : [ "help-target-mc-fluence", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "prepend-help", 0 ],
					"source" : [ "help-target-morph", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "presentation-control", 0 ],
					"source" : [ "open-target-gen", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "presentation-control", 0 ],
					"source" : [ "prepend-help", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ],
		"autosave" : 0,
		"bgcolor" : [ 0.27843137254902, 0.274509803921569, 0.274509803921569, 1.0 ],
		"editing_bgcolor" : [ 0.27843137254902, 0.274509803921569, 0.274509803921569, 1.0 ]
	}

}
