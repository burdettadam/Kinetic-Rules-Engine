{"global":[],"global_start_line":null,"dispatch":[{"domain":"example.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"Tries","type":"str"},{"val":"msg","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"expr":{"test":{"args":[{"val":"num","type":"var"},{"val":"tries","type":"var"}],"type":"ineq","op":"=="},"then":{"val":"tries","type":"var"},"else":{"args":[{"val":"num","type":"var"},{"args":[{"val":"tries","type":"var"},{"val":1,"type":"num"}],"type":"prim","op":"+"}],"function_expr":{"val":"equal","type":"var"},"type":"app"},"type":"condexpr"},"vars":["num","tries"],"type":"function","decls":[]},"lhs":"equal","type":"expr"},{"rhs":{"args":[{"val":3,"type":"num"},{"val":0,"type":"num"}],"function_expr":{"val":"equal","type":"var"},"type":"app"},"lhs":"msg","type":"expr"}],"name":"compare_a_number","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":10}],"meta_start_col":5,"meta":{"logging":"on","name":"Number comparison","meta_start_line":2,"author":"Mike Grace","meta_start_col":5},"dispatch_start_line":7,"global_start_col":null,"ruleset_name":"a60x146"}
