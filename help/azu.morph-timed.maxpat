{
 "patcher": {
  "fileversion": 1,
  "appversion": {"major": 9, "minor": 0, "revision": 9, "architecture": "x64", "modernui": 1},
  "classnamespace": "box",
  "rect": [50, 80, 900, 490],
  "default_fontsize": 14,
  "boxes": [
   {"box": {"id": "title", "maxclass": "comment", "fontsize": 26, "text": "azu.morph / automatic timing", "patching_rect": [30, 20, 830, 36]}},
   {"box": {"id": "intro", "maxclass": "comment", "text": "Send a destination and let the object handle progression. No DSP needed.", "patching_rect": [30, 66, 830, 24]}},
   {"box": {"id": "steps", "maxclass": "comment", "linecount": 2, "text": "Click 500 or 200: the value moves there in two seconds.\nClick again while moving to change the destination without a jump.", "patching_rect": [30, 112, 830, 48]}},
   {"box": {"id": "load", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": ["bang"], "text": "loadbang", "patching_rect": [30, 190, 85, 24]}},
   {"box": {"id": "set", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "text": "clear, 100.", "patching_rect": [30, 232, 100, 24]}},
   {"box": {"id": "target-a", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "text": "500.", "patching_rect": [170, 232, 70, 24]}},
   {"box": {"id": "target-b", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "text": "200.", "patching_rect": [280, 232, 70, 24]}},
   {"box": {"id": "stop", "maxclass": "message", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "text": "stop", "patching_rect": [390, 232, 70, 24]}},
   {"box": {"id": "driver", "maxclass": "newobj", "numinlets": 1, "numoutlets": 2, "outlettype": ["", ""], "text": "azu.morph @duration 2000 @headroom 0", "patching_rect": [30, 320, 350, 24]}},
   {"box": {"id": "unpack", "maxclass": "newobj", "numinlets": 1, "numoutlets": 1, "outlettype": ["float"], "text": "unpack f", "patching_rect": [30, 374, 85, 24]}},
   {"box": {"id": "result", "maxclass": "flonum", "numinlets": 1, "numoutlets": 2, "outlettype": ["", "bang"], "patching_rect": [30, 428, 120, 24]}},
   {"box": {"id": "done-route", "maxclass": "newobj", "numinlets": 2, "numoutlets": 2, "outlettype": ["", ""], "text": "route done", "patching_rect": [250, 374, 105, 24]}},
   {"box": {"id": "done", "maxclass": "button", "numinlets": 1, "numoutlets": 1, "outlettype": ["bang"], "patching_rect": [250, 428, 24, 24]}},
   {"box": {"id": "done-note", "maxclass": "comment", "text": "Arrived", "patching_rect": [290, 428, 150, 24]}},
   {"box": {"id": "settings-note", "maxclass": "comment", "text": "Choose a curve and a duration for the next move.", "patching_rect": [490, 190, 380, 24]}},
   {"box": {"id": "function-ui", "maxclass": "attrui", "attr": "function", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [500, 232, 340, 24]}},
   {"box": {"id": "duration", "maxclass": "attrui", "attr": "duration", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [500, 274, 340, 24]}},
   {"box": {"id": "notes", "maxclass": "comment", "linecount": 3, "text": "The initial value is 100. Click clear, 100. to start again.\nstop holds the current value; the next destination starts from there.\nFor several parameters, send lists instead of single numbers.", "patching_rect": [490, 352, 380, 104]}}
  ],
  "lines": [
   {"patchline": {"source": ["load", 0], "destination": ["set", 0]}},
   {"patchline": {"source": ["set", 0], "destination": ["driver", 0]}},
   {"patchline": {"source": ["target-a", 0], "destination": ["driver", 0]}},
   {"patchline": {"source": ["target-b", 0], "destination": ["driver", 0]}},
   {"patchline": {"source": ["stop", 0], "destination": ["driver", 0]}},
   {"patchline": {"source": ["function-ui", 0], "destination": ["driver", 0], "hidden": 1}},
   {"patchline": {"source": ["duration", 0], "destination": ["driver", 0], "hidden": 1}},
   {"patchline": {"source": ["driver", 0], "destination": ["unpack", 0]}},
   {"patchline": {"source": ["unpack", 0], "destination": ["result", 0]}},
   {"patchline": {"source": ["driver", 1], "destination": ["done-route", 0]}},
   {"patchline": {"source": ["done-route", 0], "destination": ["done", 0]}}
  ],
  "dependency_cache": [
   {"name": "azu.morph.mxo", "type": "iLaX"}
  ],
  "autosave": 0
 }
}
