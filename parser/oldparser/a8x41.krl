{"global":[],"global_start_line":19,"dispatch":[{"domain":"www.baconsalt.com","ruleset_id":null}],"dispatch_start_col":1,"meta_start_line":2,"rules":[{"cond":{"args":[{"source":"google","predicate":"authorized","args":[{"val":"calendar","type":"str"}],"type":"qualified"}],"type":"pred","op":"negation"},"blocktype":"every","actions":[{"action":{"source":"google","name":"authorize","args":[{"val":"calendar","type":"str"}],"modifiers":[{"value":{"val":1,"type":"num"},"name":"opacity"},{"value":{"val":"true","type":"bool"},"name":"sticky"}]},"label":null}],"post":{"alt":null,"type":"fired","cons":[{"test":null,"statement":"last","type":"control"}]},"pre":null,"name":"auth_app","start_col":1,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":22},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"Next Up","type":"str"},{"val":"nexttitle","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"google","predicate":"get","args":[{"val":"calendar","type":"str"},{"val":[{"rhs":{"val":"event","type":"str"},"lhs":"feed"},{"rhs":{"val":"true","type":"str"},"lhs":"futureevents"}],"type":"hashraw"}],"type":"qualified"},"lhs":"future","type":"expr"},{"rhs":{"obj":{"val":"future","type":"var"},"args":[{"val":"$..entry[0].title.$t","type":"str"}],"name":"pick","type":"operator"},"lhs":"nexttitle","type":"expr"}],"name":"calevents","start_col":1,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":38}],"meta_start_col":1,"meta":{"keys":{"google":{"consumer_secret":"x1bVodHKXlmenYKraZZO3WAm","consumer_key":"sam.curren.ws"}},"logging":"off","name":"ImpactCal","meta_start_line":2,"author":"Sam","description":"Google Calendar Demo \n  ","meta_start_col":1},"dispatch_start_line":15,"global_start_col":1,"ruleset_name":"a8x41"}
