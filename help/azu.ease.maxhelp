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
		"openinpresentation": 1,
		"default_fontsize": 14.0,
		"gridsize": [
			15.0,
			15.0
		],
		"boxes": [
			{
				"box": {
					"id": "obj-14",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						593.0,
						288.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-11",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						565.0,
						208.0,
						68.0,
						24.0
					],
					"text": "loadmess"
				}
			},
			{
				"box": {
					"id": "obj-9",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1199.0,
						478.0,
						201.0,
						24.0
					],
					"text": "window size 100 100 1000 800"
				}
			},
			{
				"box": {
					"id": "obj-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						1199.0,
						525.0,
						77.0,
						24.0
					],
					"save": [
						"#N",
						"thispatcher",
						";",
						"#Q",
						"end",
						";"
					],
					"text": "thispatcher"
				}
			},
			{
				"box": {
					"id": "obj-10",
					"linecount": 21,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						773.0,
						192.0,
						134.0,
						335.0
					],
					"text": "Available functions:\n\nsmoothstep\ngompertz\nviscous\nink_diffusion\nphi_spiral\nmagnetic_snap\nhesitate\nrecoil\nspring_soft\nspring_tight\nbounce_gravity\nbounce_viscoelastic\nricochet\nbow_change\nspiccato\nstutter\nratchet\nfracture\ncollapse"
				}
			},
			{
				"box": {
					"id": "obj-8",
					"maxclass": "multislider",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						24.0,
						487.0,
						341.0,
						163.0
					],
					"presentation": 1,
					"presentation_rect": [
						359.0,
						221.0,
						341.0,
						163.0
					],
					"setminmax": [
						-0.5,
						1.5
					],
					"setstyle": 4
				}
			},
			{
				"box": {
					"id": "obj-7",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						495.0,
						288.0,
						44.0,
						24.0
					],
					"text": "/ 127."
				}
			},
			{
				"box": {
					"id": "obj-6",
					"maxclass": "newobj",
					"numinlets": 5,
					"numoutlets": 4,
					"outlettype": [
						"int",
						"",
						"",
						"int"
					],
					"patching_rect": [
						495.0,
						246.0,
						166.0,
						24.0
					],
					"text": "counter 127 @carryflag 1"
				}
			},
			{
				"box": {
					"id": "obj-5",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						495.0,
						166.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						482.0,
						140.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-3",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						495.0,
						208.0,
						64.0,
						24.0
					],
					"text": "metro 25"
				}
			},
			{
				"box": {
					"id": "obj-2",
					"maxclass": "multislider",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						374.0,
						487.0,
						341.0,
						163.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						221.0,
						341.0,
						163.0
					],
					"setminmax": [
						0.0,
						1.0
					],
					"setstyle": 4
				}
			},
			{
				"box": {
					"fontsize": 26.0,
					"id": "title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24.0,
						34.0,
						114.0,
						36.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						8.0,
						114.0,
						36.0
					],
					"text": "azu.ease"
				}
			},
			{
				"box": {
					"id": "description",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24.0,
						80.0,
						396.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						54.0,
						396.0,
						22.0
					],
					"text": "Shape numbers or lists with an easing curve. No DSP needed."
				}
			},
			{
				"box": {
					"id": "input-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						24.0,
						130.0,
						255.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						104.0,
						255.0,
						22.0
					],
					"text": "1. Move the slider (0 to 1), or click a list."
				}
			},
			{
				"box": {
					"floatoutput": 1,
					"id": "slider",
					"maxclass": "slider",
					"numinlets": 1,
					"numoutlets": 1,
					"orientation": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						24.0,
						166.0,
						300.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						140.0,
						300.0,
						24.0
					],
					"size": 1.0
				}
			},
			{
				"box": {
					"format": 6,
					"id": "progress",
					"maxclass": "flonum",
					"maximum": 1.0,
					"minimum": 0.0,
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						24.0,
						208.0,
						90.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						182.0,
						66.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "list",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						68.0,
						297.0,
						121.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						302.0,
						182.0,
						121.0,
						24.0
					],
					"text": "0. 0.25 0.5 0.75 1."
				}
			},
			{
				"box": {
					"id": "ease",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						24.0,
						334.0,
						209.0,
						24.0
					],
					"text": "azu.ease @function smoothstep"
				}
			},
			{
				"box": {
					"id": "result",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						166.0,
						368.0,
						67.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						105.0,
						417.0,
						250.0,
						24.0
					],
					"text": "0.611368"
				}
			},
			{
				"box": {
					"id": "result-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						103.0,
						402.0,
						321.0,
						22.0
					],
					"text": "Output: each list element is shaped independently."
				}
			},
			{
				"box": {
					"id": "settings-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						464.0,
						130.0,
						310.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						451.0,
						104.0,
						310.0,
						22.0
					],
					"text": "2. Choose a curve, then send input or bang."
				}
			},
			{
				"box": {
					"id": "function-ui",
					"items": [
						"smoothstep",
						",",
						"gompertz",
						",",
						"viscous",
						",",
						"ink_diffusion",
						",",
						"phi_spiral",
						",",
						"magnetic_snap",
						",",
						"hesitate",
						",",
						"recoil",
						",",
						"spring_soft",
						",",
						"spring_tight",
						",",
						"bounce_gravity",
						",",
						"bounce_viscoelastic",
						",",
						"ricochet",
						",",
						"bow_change",
						",",
						"spiccato",
						",",
						"stutter",
						",",
						"ratchet",
						",",
						"fracture",
						",",
						"collapse"
					],
					"maxclass": "umenu",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"int",
						"",
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						34.0,
						696.0,
						250.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						711.0,
						221.0,
						166.0,
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
						34.0,
						729.0,
						166.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						711.0,
						256.0,
						166.0,
						24.0
					]
				}
			},
			{
				"box": {
					"attr": "overshoot",
					"id": "overshoot-ui",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						34.0,
						771.0,
						166.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						711.0,
						290.0,
						166.0,
						24.0
					]
				}
			},
			{
				"box": {
					"attr": "headroom",
					"id": "headroom-ui",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						34.0,
						813.0,
						166.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						711.0,
						325.0,
						166.0,
						24.0
					]
				}
			},
			{
				"box": {
					"attr": "drift",
					"id": "drift-ui",
					"maxclass": "attrui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						34.0,
						855.0,
						166.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						711.0,
						359.0,
						166.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "drift-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						211.0,
						856.0,
						366.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						9.0,
						565.0,
						366.0,
						22.0
					],
					"text": "With drift above 0: click nextdrift, then send input or bang."
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
						210.0,
						297.0,
						61.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						151.0,
						182.0,
						61.0,
						24.0
					],
					"text": "nextdrift"
				}
			},
			{
				"box": {
					"id": "notes",
					"linecount": 3,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						211.0,
						891.0,
						678.0,
						53.0
					],
					"presentation": 1,
					"presentation_linecount": 3,
					"presentation_rect": [
						9.0,
						602.0,
						678.0,
						53.0
					],
					"text": "Settings apply to the next input or bang; no automatic output.\nNextdrift selects another deterministic variation; resetdrift returns to the initial variation. Neither outputs a value.\nMode: in / out / inout."
				}
			},
			{
				"box": {
					"hidden": 1,
					"id": "function-message",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						211.0,
						729.0,
						113.0,
						24.0
					],
					"text": "prepend function"
				}
			},
			{
				"box": {
					"id": "function-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						300.0,
						697.0,
						65.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						711.0,
						191.0,
						80.0,
						22.0
					],
					"text": "Function"
				}
			},
			{
				"box": {
					"id": "bang",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						24.0,
						249.0,
						45.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						105.0,
						182.0,
						40.0,
						24.0
					],
					"text": "bang"
				}
			},
			{
				"box": {
					"id": "bang-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						80.0,
						250.0,
						223.0,
						22.0
					],
					"text": "Recalculate the last number or list."
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
						283.0,
						297.0,
						68.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						226.0,
						182.0,
						68.0,
						24.0
					],
					"text": "resetdrift"
				}
			},
			{
				"box": {
					"id": "auto-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						530.0,
						166.0,
						106.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						517.0,
						140.0,
						106.0,
						22.0
					],
					"text": "Auto-run: 0 -> 1"
				}
			},
			{
				"box": {
					"id": "auto-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						424.0,
						80.0,
						350.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						411.0,
						54.0,
						350.0,
						22.0
					],
					"text": "Automatic progression uses Max messages, not DSP."
				}
			},
			{
				"box": {
					"id": "output-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						26.0,
						656.0,
						251.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						359.0,
						389.0,
						251.0,
						22.0
					],
					"text": "Shaped output (-0.5..1.5 display range)"
				}
			},
			{
				"box": {
					"id": "input-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						376.0,
						657.0,
						153.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						389.0,
						153.0,
						22.0
					],
					"text": "Input progression (0..1)"
				}
			},
			{
				"box": {
					"id": "character-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						211.0,
						806.0,
						859.0,
						22.0
					],
					"presentation": 1,
					"presentation_linecount": 2,
					"presentation_rect": [
						9.0,
						510.0,
						556.0,
						38.0
					],
					"text": "Overshoot / Character: 0 removes the character contribution; 1 gives the native gesture. The remaining baseline depends on the function."
				}
			},
			{
				"box": {
					"id": "headroom-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						211.0,
						772.0,
						1003.0,
						22.0
					],
					"presentation": 1,
					"presentation_linecount": 3,
					"presentation_rect": [
						9.0,
						441.0,
						456.0,
						53.0
					],
					"text": "Headroom: 0 clamps to 0..1; positive values allow bounded excursions. The output display covers the default headroom 0.5; larger margins can exceed its scale."
				}
			},
			{
				"box": {
					"id": "result-presentation-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						430.0,
						402.0,
						75.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						11.0,
						418.0,
						80.0,
						22.0
					],
					"text": "Output:"
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
						"bang",
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
						"drift-ui",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-8",
						0
					],
					"order": 1,
					"source": [
						"ease",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"result",
						1
					],
					"order": 0,
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
						"function-message",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"function-message",
						0
					],
					"hidden": 1,
					"source": [
						"function-ui",
						1
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
						"headroom-ui",
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
						"list",
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
						"obj-5",
						0
					],
					"source": [
						"obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"nextdrift",
						0
					],
					"source": [
						"obj-14",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-6",
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
						"obj-3",
						0
					],
					"source": [
						"obj-5",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-14",
						0
					],
					"source": [
						"obj-6",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-7",
						0
					],
					"source": [
						"obj-6",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"slider",
						0
					],
					"midpoints": [
						504.5,
						468.48828125,
						10.0,
						468.48828125,
						10.0,
						163.0,
						33.5,
						163.0
					],
					"source": [
						"obj-7",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-1",
						0
					],
					"source": [
						"obj-9",
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
						"overshoot-ui",
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
					"midpoints": [
						33.5,
						234.0,
						14.66796875,
						234.0,
						14.66796875,
						300.0,
						33.5,
						300.0
					],
					"order": 0,
					"source": [
						"progress",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-2",
						0
					],
					"order": 1,
					"source": [
						"progress",
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
						"progress",
						0
					],
					"source": [
						"slider",
						0
					]
				}
			}
		],
		"dependency_cache": [
			{
				"name": "azu.ease.mxo",
				"type": "iLaX"
			}
		],
		"autosave": 0
	}
}