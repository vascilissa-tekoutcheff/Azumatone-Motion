{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 0,
			"revision": 9,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"openrect": [
			100.0,
			100.0,
			900.0,
			700.0
		],
		"default_fontsize": 14.0,
		"gridsize": [
			15.0,
			15.0
		],
		"boxes": [
			{
				"box": {
					"fontsize": 26.0,
					"id": "title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						20.0,
						860.0,
						36.0
					],
					"text": "mc.azu.ease~"
				}
			},
			{
				"box": {
					"id": "intro",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						66.0,
						870.0,
						22.0
					],
					"text": "Shape each channel of a normalized signal with expressive easing curves."
				}
			},
			{
				"box": {
					"id": "dsp",
					"maxclass": "ezdac~",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						112.0,
						45.0,
						45.0
					]
				}
			},
			{
				"box": {
					"id": "dsp-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						95.0,
						122.0,
						740.0,
						22.0
					],
					"text": ""
				}
			},
			{
				"box": {
					"id": "input-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						180.0,
						420.0,
						22.0
					],
					"text": "The same 0..1 ramp feeds all four channels."
				}
			},
			{
				"box": {
					"id": "ramp",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						30.0,
						220.0,
						110.0,
						24.0
					],
					"text": "phasor~ 0.5"
				}
			},
			{
				"box": {
					"id": "duplicate",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"multichannelsignal"
					],
					"patching_rect": [
						30.0,
						274.0,
						110.0,
						24.0
					],
					"text": "mc.dup~ 4"
				}
			},
			{
				"box": {
					"id": "ease",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"multichannelsignal"
					],
					"patching_rect": [
						30.0,
						350.0,
						390.0,
						24.0
					],
					"text": "mc.azu.ease~ @function ricochet @drift 0.6"
				}
			},
			{
				"box": {
					"id": "unpack",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"signal",
						"signal",
						"signal",
						"signal"
					],
					"patching_rect": [
						30.0,
						438.0,
						390.0,
						24.0
					],
					"text": "mc.unpack~ 4"
				}
			},
			{
				"box": {
					"id": "settings-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						470.0,
						180.0,
						420.0,
						22.0
					],
					"text": "Compare drift 0 and 0.6."
				}
			},
			{
				"box": {
					"attr": "function",
					"id": "function-ui",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						480.0,
						220.0,
						294.0,
						24.0
					]
				}
			},
			{
				"box": {
					"attr": "mode",
					"id": "mode-ui",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						480.0,
						262.0,
						170.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "drift-note",
					"linecount": 3,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						470.0,
						420.0,
						420.0,
						57.0
					],
					"text": "Drift 0: identical channels. Above 0: independent variation\non each ramp restart, even with the same input.\nnextdrift: next variation. resetdrift: first variation."
				}
			},
			{
				"box": {
					"activebgcolor": [
						0.156862745098039,
						0.156862745098039,
						0.156862745098039,
						0.0
					],
					"activelinecolor": [
						1.0,
						1.0,
						1.0,
						1.0
					],
					"id": "s0",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30.0,
						480.0,
						552.0,
						170.0
					],
					"range": [
						-0.5,
						1.5
					],
					"samples": 96000.0
				}
			},
			{
				"box": {
					"activebgcolor": [
						0.156862745098039,
						0.156862745098039,
						0.156862745098039,
						0.0
					],
					"activelinecolor": [
						0.054901960784314,
						1.0,
						0.0,
						1.0
					],
					"id": "s1",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30.0,
						480.0,
						552.0,
						170.0
					],
					"range": [
						-0.5,
						1.5
					],
					"samples": 96000.0
				}
			},
			{
				"box": {
					"activebgcolor": [
						0.156862745098039,
						0.156862745098039,
						0.156862745098039,
						0.0
					],
					"activelinecolor": [
						0.580392156862745,
						0.03921568627451,
						0.847058823529412,
						1.0
					],
					"id": "s2",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30.0,
						480.0,
						552.0,
						170.0
					],
					"range": [
						-0.5,
						1.5
					],
					"samples": 96000.0
				}
			},
			{
				"box": {
					"activebgcolor": [
						0.156862745098039,
						0.156862745098039,
						0.156862745098039,
						0.0
					],
					"activelinecolor": [
						0.486274509803922,
						0.027450980392157,
						0.227450980392157,
						1.0
					],
					"id": "s3",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30.0,
						480.0,
						552.0,
						170.0
					],
					"range": [
						-0.5,
						1.5
					],
					"samples": 96000.0
				}
			},
			{
				"box": {
					"id": "footer",
					"linecount": 2,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						660.0,
						860.0,
						38.0
					],
					"text": "Character / Overshoot: 1 = native. Headroom 0 keeps outputs within 0..1.\nChannel count follows the input unless @chans fixes it."
				}
			},
			{
				"box": {
					"attr": "drift",
					"id": "obj-1",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						477.0,
						390.0,
						190.0,
						24.0
					]
				}
			},
			{
				"box": {
					"attr": "headroom",
					"id": "obj-2",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						477.0,
						350.0,
						297.0,
						24.0
					]
				}
			},
			{
				"box": {
					"attr": "overshoot",
					"id": "obj-3",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						477.0,
						305.0,
						297.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "channels-legend",
					"linecount": 5,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						615.0,
						500.0,
						230.0,
						86.0
					],
					"text": "Four channels:\n1  white\n2  green\n3  purple\n4  burgundy"
				}
			},
			{
				"box": {
					"id": "nextdrift",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						675.0,
						390.0,
						66.0,
						24.0
					],
					"text": "nextdrift"
				}
			},
			{
				"box": {
					"id": "resetdrift",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						747.0,
						390.0,
						74.0,
						24.0
					],
					"text": "resetdrift"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"source": [
						"duplicate",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"unpack",
						0
					],
					"source": [
						"ease",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"hidden": 1,
					"source": [
						"function-ui",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"hidden": 1,
					"source": [
						"mode-ui",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"source": [
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"source": [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"source": [
						"obj-3",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"duplicate",
						0
					],
					"source": [
						"ramp",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"s0",
						0
					],
					"source": [
						"unpack",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"s1",
						0
					],
					"source": [
						"unpack",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"s2",
						0
					],
					"source": [
						"unpack",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"s3",
						0
					],
					"source": [
						"unpack",
						3
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"source": [
						"nextdrift",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ease",
						0
					],
					"source": [
						"resetdrift",
						0
					]
				}
			}
		],
		"dependency_cache": [
			{
				"name": "mc.azu.ease~.mxo",
				"type": "iLaX"
			}
		],
		"autosave": 0
	}
}