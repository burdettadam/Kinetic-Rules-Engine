{"global":[{"source":"http://search.twitter.com/search.json","cachable":0,"name":"twitter_search","datatype":"JSON","type":"datasource"}],"dispatch":[{"domain":"example.com"}],"ruleset_name":"a60x155","rules":[{"blocktype":"every","emit":null,"pre":[{"rhs":{"source":"datasource","args":[{"val":"q=kynetx","type":"str"}],"predicate":"twitter_search","type":"qualified"},"type":"expr","lhs":"json"}],"name":"newrule","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"JSON","type":"str"},{"val":"json","type":"var"}],"name":"notify","modifiers":null}}]}],"meta":{"author":"Mike Grace","description":"\nexample for devex    \n","name":"Twitter search","logging":"on"}}