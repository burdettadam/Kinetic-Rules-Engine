{"global":[],"global_start_line":null,"dispatch":[{"domain":"example.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"15 + 5 is ...","type":"str"},{"val":"newnum","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":{"expr":{"args":[{"val":"x","type":"var"},{"val":5,"type":"num"}],"type":"prim","op":"+"},"vars":["x"],"type":"function","decls":[]},"lhs":"add5","type":"expr"},{"rhs":{"args":[{"val":15,"type":"num"}],"function_expr":{"val":"add5","type":"var"},"type":"app"},"lhs":"newnum","type":"expr"}],"name":"newrule","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":10}],"meta_start_col":5,"meta":{"logging":"on","name":"Function sandbox","meta_start_line":2,"author":"Mike Grace","meta_start_col":5},"dispatch_start_line":7,"global_start_col":null,"ruleset_name":"a60x136"}
