{"global":[{"source":"http://query.yahooapis.com/v1/public/yql","cachable":0,"name":"yql","datatype":"JSON","type":"datasource"}],"dispatch":[{"domain":"craigslist.org"}],"ruleset_name":"a60x41","rules":[{"blocktype":"every","emit":null,"post":{"type":null,"cons":[null]},"pre":[{"rhs":{"source":"page","args":[{"val":"caller","type":"str"}],"predicate":"env","type":"qualified"},"type":"expr","lhs":"caller"},{"rhs":{"val":"caller","type":"var"},"type":"expr","lhs":"call"},{"rhs":{"source":"page","args":[{"val":"hostname","type":"str"}],"predicate":"url","type":"qualified"},"type":"expr","lhs":"host"}],"name":"images","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"op":"+","args":[{"val":"select * from html where url=%22","type":"str"},{"op":"+","args":[{"val":"caller","type":"var"},{"val":"%22 and xpath=%22//span[@class='p']/../a%22","type":"str"}],"type":"prim"}],"type":"prim"}],"name":"query","modifiers":null}}]}],"meta":{"author":"Mike Grace","description":"\nSearching craigslist by image     \n","name":"Craigslist Image","logging":"on"}}
