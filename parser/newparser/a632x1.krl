{"global":[],"dispatch":[{"domain":"www.google.com"},{"domain":"www.frozengalaxy.com"}],"ruleset_name":"a632x1","rules":[{"blocktype":"every","emit":null,"pre":[{"rhs":{"source":"weather","args":[],"predicate":"curr_temp","type":"qualified"},"type":"expr","lhs":"temp"}],"name":"hello","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Hello World","type":"str"},{"op":"+","args":[{"val":"Current Temp:","type":"str"},{"val":"temp","type":"var"}],"type":"prim"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}}]}}]}],"meta":{"description":"\nA simple Hello World app   \n","name":"Hello World","logging":"off"}}
