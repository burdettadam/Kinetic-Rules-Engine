{
   "dispatch": [],
   "global": [],
   "meta": {
      "author": "",
      "description": " \n    Display current weeks activities \n  ",
      "logging": "off",
      "name": "UVU Intramurals"
   },
   "rules": [{
      "actions": [{"action": {
         "args": [],
         "modifiers": null,
         "name": "noop",
         "source": null
      }}],
      "blocktype": "every",
      "callbacks": null,
      "cond": {
         "type": "bool",
         "val": "true"
      },
      "emit": null,
      "foreach": [],
      "name": "first_rule",
      "pagetype": {"event_expr": {
         "legacy": 1,
         "op": "pageview",
         "pattern": "",
         "type": "prim_event",
         "vars": []
      }},
      "state": "active"
   }],
   "ruleset_name": "a592x2"
}
