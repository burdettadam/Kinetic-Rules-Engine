{"global":[],"global_start_line":null,"dispatch":[{"domain":"example.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"Setting up","type":"str"},{"val":"html","type":"var"}],"modifiers":[{"value":{"val":"true","type":"bool"},"name":"sticky"}],"vars":null},"label":null}],"post":null,"pre":[{"rhs":"<div id=\"setup\">Setup Div</div>    \n ","lhs":"html","type":"here_doc"}],"name":"setup","start_col":5,"emit":"var found = $K(\"div#setup\");      if(found) {        alert(\"found the setup div\");      } else {        alert(\"couldn't find the setup div\");      }          ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":13}],"meta_start_col":5,"meta":{"logging":"on","name":"Timing Test","meta_start_line":2,"author":"Mike Grace","description":"To demonstrate timing     \n","meta_start_col":5},"dispatch_start_line":10,"global_start_col":null,"ruleset_name":"a60x169"}
