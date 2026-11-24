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
		"rect": [
			34.0,
			100.0,
			1660.0,
			983.0
		],
		"openinpresentation": 1,
		"gridsize": [
			15.0,
			15.0
		],
		"boxes": [
			{
				"box": {
					"fontsize": 20.0,
					"id": "title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						43.0,
						48.0,
						322.0,
						29.0
					],
					"presentation": 1,
					"presentation_rect": [
						40.0,
						15.0,
						600.0,
						29.0
					],
					"text": "Ease functions - static curve viewer"
				}
			},
			{
				"box": {
					"id": "function-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						43.0,
						83.0,
						55.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						40.0,
						50.0,
						140.0,
						20.0
					],
					"text": "Function"
				}
			},
			{
				"box": {
					"id": "obj-3",
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
						43.0,
						116.0,
						160.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						40.0,
						75.0,
						160.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "mode-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						223.0,
						83.0,
						39.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						220.0,
						50.0,
						90.0,
						20.0
					],
					"text": "Mode"
				}
			},
			{
				"box": {
					"id": "mode",
					"items": [
						"in",
						",",
						"out",
						",",
						"inout"
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
						223.0,
						116.0,
						90.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						220.0,
						75.0,
						90.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "overshoot-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						350.0,
						83.0,
						127.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						330.0,
						50.0,
						150.0,
						20.0
					],
					"text": "Character / Overshoot"
				}
			},
			{
				"box": {
					"format": 6,
					"id": "overshoot",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						356.0,
						116.0,
						100.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						330.0,
						75.0,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "headroom-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						505.0,
						83.0,
						128.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						500.0,
						50.0,
						145.0,
						20.0
					],
					"text": "Headroom (0 = clamp)"
				}
			},
			{
				"box": {
					"format": 6,
					"id": "headroom",
					"maxclass": "flonum",
					"minimum": 0.0,
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						505.0,
						116.0,
						100.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						500.0,
						75.0,
						100.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "drift-label",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						663.0,
						83.0,
						62.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						660.0,
						50.0,
						100.0,
						20.0
					],
					"text": "Drift (0..1)"
				}
			},
			{
				"box": {
					"format": 6,
					"id": "drift",
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
						663.0,
						116.0,
						100.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						660.0,
						75.0,
						100.0,
						22.0
					]
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
						43.0,
						156.0,
						65.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						40.0,
						115.0,
						65.0,
						22.0
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
						123.0,
						156.0,
						72.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						120.0,
						115.0,
						72.0,
						22.0
					],
					"text": "resetdrift"
				}
			},
			{
				"box": {
					"id": "drift-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						61.0,
						192.0,
						377.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						205.0,
						115.0,
						560.0,
						20.0
					],
					"text": "nextdrift: next drift variation. resetdrift: generation 0 (keeps all settings)."
				}
			},
			{
				"box": {
					"id": "range-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						359.0,
						149.0,
						420.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						40.0,
						155.0,
						720.0,
						20.0
					],
					"text": "1025 samples, including 0 and 1. Y: -0.5..1.5; expands when headroom > 0.5."
				}
			},
			{
				"box": {
					"bgcolor": [
						0.290196,
						0.309804,
						0.301961,
						1.0
					],
					"domainlabel": "Progress",
					"id": "obj-12",
					"margins": [
						55.0,
						15.0,
						15.0,
						45.0
					],
					"maxclass": "plot~",
					"numinlets": 1,
					"numoutlets": 1,
					"numpoints": 1025,
					"outlettype": [
						""
					],
					"patching_rect": [
						108.0,
						453.0,
						720.0,
						360.0
					],
					"presentation": 1,
					"presentation_rect": [
						40.0,
						190.0,
						720.0,
						360.0
					],
					"rangelabel": "Output",
					"subplots": [
						{
							"color": [
								0.80392199754715,
								0.898038983345032,
								0.909803986549377,
								1.0
							],
							"thickness": 2.0,
							"point_style": "none",
							"line_style": "lines",
							"number_style": "none",
							"filter": "none",
							"domain_start": 0.0,
							"domain_end": 1.0,
							"domain_style": "linear",
							"domain_markers": [
								0.0,
								0.25,
								0.5,
								0.75,
								1.0
							],
							"domain_labels": [
								0.0,
								"0",
								0.25,
								"0.25",
								0.5,
								"0.5",
								0.75,
								"0.75",
								1.0,
								"1"
							],
							"range_start": -0.5,
							"range_end": 1.5,
							"range_style": "linear",
							"range_markers": [
								-0.5,
								0.0,
								0.5,
								1.0,
								1.5
							],
							"range_labels": [
								-0.5,
								"-0.5",
								0.0,
								"0",
								0.5,
								"0.5",
								1.0,
								"1",
								1.5,
								"1.5"
							],
							"origin_x": 0.0,
							"origin_y": 0.0
						}
					]
				}
			},
			{
				"box": {
					"id": "static-note",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						101.0,
						890.0,
						739.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						40.0,
						570.0,
						739.0,
						20.0
					],
					"text": "Actual azu.ease output, including headroom limiting. DSP not required. Static view: no audio crossfade or automatic drift restart detection."
				}
			},
			{
				"box": {
					"comment": "Function menu selection",
					"hidden": 1,
					"id": "obj-2",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						7.0,
						112.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"comment": "Ease settings and drift commands",
					"hidden": 1,
					"id": "obj-1",
					"index": 0,
					"maxclass": "outlet",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						43.0,
						555.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "obj-42",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						110.0,
						266.0,
						98.0,
						22.0
					],
					"text": "prepend function"
				}
			},
			{
				"box": {
					"id": "mode-message",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						258.0,
						266.0,
						86.0,
						22.0
					],
					"text": "prepend mode"
				}
			},
			{
				"box": {
					"id": "overshoot-message",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						356.0,
						266.0,
						109.0,
						22.0
					],
					"text": "prepend overshoot"
				}
			},
			{
				"box": {
					"id": "headroom-order",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"float",
						"float"
					],
					"patching_rect": [
						505.0,
						191.0,
						45.0,
						22.0
					],
					"text": "t f f"
				}
			},
			{
				"box": {
					"id": "headroom-message",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						506.0,
						266.0,
						110.0,
						22.0
					],
					"text": "prepend headroom"
				}
			},
			{
				"box": {
					"id": "drift-message",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						663.0,
						266.0,
						76.0,
						22.0
					],
					"text": "prepend drift"
				}
			},
			{
				"box": {
					"id": "settings",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						43.0,
						345.0,
						84.0,
						22.0
					],
					"text": "t l l"
				}
			},
			{
				"box": {
					"id": "range-margin",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						758.0,
						226.0,
						106.0,
						22.0
					],
					"text": "expr max(0.5\\, $f1)"
				}
			},
			{
				"box": {
					"id": "range-order",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"float",
						"float"
					],
					"patching_rect": [
						758.0,
						266.0,
						75.0,
						22.0
					],
					"text": "t f f"
				}
			},
			{
				"box": {
					"id": "range-upper",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						814.0,
						306.0,
						29.5,
						22.0
					],
					"text": "+ 1."
				}
			},
			{
				"box": {
					"id": "range-lower",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						758.0,
						306.0,
						31.0,
						22.0
					],
					"text": "* -1."
				}
			},
			{
				"box": {
					"id": "range-pack",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						758.0,
						345.0,
						75.0,
						22.0
					],
					"text": "pack 0. 0."
				}
			},
			{
				"box": {
					"id": "range-message",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						758.0,
						384.0,
						119.0,
						22.0
					],
					"text": "prepend definerange"
				}
			},
			{
				"box": {
					"id": "load",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						796.0,
						16.0,
						65.0,
						22.0
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "init-order",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 5,
					"outlettype": [
						"bang",
						"bang",
						"bang",
						"bang",
						"bang"
					],
					"patching_rect": [
						796.0,
						48.0,
						299.0,
						22.0
					],
					"text": "t b b b b b"
				}
			},
			{
				"box": {
					"id": "init-function",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						796.0,
						80.0,
						29.5,
						22.0
					],
					"text": "0"
				}
			},
			{
				"box": {
					"id": "init-mode",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						866.0,
						80.0,
						29.5,
						22.0
					],
					"text": "0"
				}
			},
			{
				"box": {
					"id": "init-overshoot",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						936.0,
						80.0,
						29.5,
						22.0
					],
					"text": "1."
				}
			},
			{
				"box": {
					"id": "init-headroom",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1006.0,
						80.0,
						29.5,
						22.0
					],
					"text": "0.5"
				}
			},
			{
				"box": {
					"id": "init-drift",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1076.0,
						80.0,
						29.5,
						22.0
					],
					"text": "0."
				}
			},
			{
				"box": {
					"id": "obj-39",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
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
						"rect": [
							100.0,
							100.0,
							620.0,
							500.0
						],
						"gridsize": [
							15.0,
							15.0
						],
						"boxes": [
							{
								"box": {
									"comment": "",
									"id": "input",
									"index": 1,
									"maxclass": "inlet",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										40.0,
										20.0,
										30.0,
										30.0
									],
									"varname": "u450002289"
								}
							},
							{
								"box": {
									"id": "defer-calculate",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										40.0,
										52.0,
										60.0,
										22.0
									],
									"text": "deferlow"
								}
							},
							{
								"box": {
									"id": "calculate",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 3,
									"outlettype": [
										"bang",
										"bang",
										""
									],
									"patching_rect": [
										40.0,
										90.0,
										139.0,
										22.0
									],
									"text": "t b b l"
								}
							},
							{
								"box": {
									"id": "clear",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										245.0,
										116.0,
										50.0,
										22.0
									],
									"text": "zlclear"
								}
							},
							{
								"box": {
									"id": "samples",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 3,
									"outlettype": [
										"bang",
										"bang",
										"int"
									],
									"patching_rect": [
										40.0,
										124.0,
										65.0,
										22.0
									],
									"text": "uzi 1025"
								}
							},
							{
								"box": {
									"id": "zero-based",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"float"
									],
									"patching_rect": [
										85.0,
										164.0,
										40.0,
										22.0
									],
									"text": "- 1."
								}
							},
							{
								"box": {
									"id": "normalize",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"float"
									],
									"patching_rect": [
										85.0,
										204.0,
										60.0,
										22.0
									],
									"text": "/ 1024."
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
										160.0,
										257.0,
										65.0,
										22.0
									],
									"text": "azu.ease"
								}
							},
							{
								"box": {
									"id": "group",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										245.0,
										312.0,
										130.0,
										22.0
									],
									"text": "zl 1025 group 1025"
								}
							},
							{
								"box": {
									"comment": "",
									"id": "output",
									"index": 1,
									"maxclass": "outlet",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										245.0,
										364.0,
										30.0,
										30.0
									],
									"varname": "u827002288"
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"clear",
										0
									],
									"source": [
										"calculate",
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
									"source": [
										"calculate",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"samples",
										0
									],
									"source": [
										"calculate",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"group",
										0
									],
									"source": [
										"clear",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"group",
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
										"output",
										0
									],
									"source": [
										"group",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"calculate",
										0
									],
									"source": [
										"defer-calculate",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"defer-calculate",
										0
									],
									"source": [
										"input",
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
										"normalize",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"zero-based",
										0
									],
									"source": [
										"samples",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"normalize",
										0
									],
									"source": [
										"zero-based",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						108.0,
						384.0,
						40.0,
						22.0
					],
					"text": "p calc"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"drift-message",
						0
					],
					"source": [
						"drift",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"settings",
						0
					],
					"midpoints": [
						672.5,
						332.0,
						52.5,
						332.0
					],
					"source": [
						"drift-message",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"headroom-order",
						0
					],
					"source": [
						"headroom",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"settings",
						0
					],
					"midpoints": [
						515.5,
						332.0,
						52.5,
						332.0
					],
					"source": [
						"headroom-message",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"headroom-message",
						0
					],
					"source": [
						"headroom-order",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"range-margin",
						0
					],
					"midpoints": [
						540.5,
						219.5,
						767.5,
						219.5
					],
					"source": [
						"headroom-order",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"drift",
						0
					],
					"midpoints": [
						1085.5,
						109.0,
						672.5,
						109.0
					],
					"source": [
						"init-drift",
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
					"midpoints": [
						805.5,
						109.0,
						52.5,
						109.0
					],
					"source": [
						"init-function",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"headroom",
						0
					],
					"midpoints": [
						1015.5,
						109.0,
						514.5,
						109.0
					],
					"source": [
						"init-headroom",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"mode",
						0
					],
					"midpoints": [
						875.5,
						109.0,
						232.5,
						109.0
					],
					"source": [
						"init-mode",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"init-drift",
						0
					],
					"source": [
						"init-order",
						4
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"init-function",
						0
					],
					"source": [
						"init-order",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"init-headroom",
						0
					],
					"source": [
						"init-order",
						3
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"init-mode",
						0
					],
					"source": [
						"init-order",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"init-overshoot",
						0
					],
					"source": [
						"init-order",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"overshoot",
						0
					],
					"midpoints": [
						945.5,
						109.0,
						365.5,
						109.0
					],
					"source": [
						"init-overshoot",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"init-order",
						0
					],
					"source": [
						"load",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"mode-message",
						0
					],
					"source": [
						"mode",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"settings",
						0
					],
					"midpoints": [
						267.5,
						332.0,
						52.5,
						332.0
					],
					"source": [
						"mode-message",
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
						"obj-2",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-42",
						0
					],
					"source": [
						"obj-3",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-12",
						0
					],
					"source": [
						"obj-39",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"settings",
						0
					],
					"source": [
						"obj-42",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"overshoot-message",
						0
					],
					"source": [
						"overshoot",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"settings",
						0
					],
					"midpoints": [
						365.5,
						332.0,
						52.5,
						332.0
					],
					"source": [
						"overshoot-message",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"range-pack",
						0
					],
					"source": [
						"range-lower",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"range-order",
						0
					],
					"source": [
						"range-margin",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-12",
						0
					],
					"source": [
						"range-message",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"range-lower",
						0
					],
					"source": [
						"range-order",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"range-upper",
						0
					],
					"source": [
						"range-order",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"range-message",
						0
					],
					"source": [
						"range-pack",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"range-pack",
						1
					],
					"source": [
						"range-upper",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"settings",
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
						"settings",
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
						"obj-1",
						0
					],
					"source": [
						"settings",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-39",
						0
					],
					"source": [
						"settings",
						1
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