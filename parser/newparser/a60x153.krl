{"global":[],"dispatch":[{"domain":"example.com"}],"ruleset_name":"a60x153","rules":[{"blocktype":"every","emit":null,"pre":[{"rhs":{"source":"stocks","args":[{"val":"^DJI","type":"str"}],"predicate":"name","type":"qualified"},"type":"expr","lhs":"name"}],"name":"stock_name_test","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Stock Name","type":"str"},{"val":"name","type":"var"}],"name":"notify","modifiers":null}}]}],"meta":{"author":"Mike Grace","name":"stock name","logging":"on"}}