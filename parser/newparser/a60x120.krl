{"global":[],"dispatch":[{"domain":"docs.kynetx.com"}],"ruleset_name":"a60x120","rules":[{"blocktype":"every","emit":null,"name":"redirector","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"http://docs.kynetx.com/krl/kynetx-rule-language-documentation/actions/redirect/","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Redirecting","type":"str"},{"val":"You are being redirected to api.jquery.com","type":"str"}],"name":"notify","modifiers":null}},{"action":{"source":null,"args":[{"val":"http://api.jquery.com/","type":"str"}],"name":"redirect","modifiers":[{"name":"delay","value":{"val":3,"type":"num"}}]}}]}],"meta":{"author":"Mike Grace","description":"\nRedirect example for documentation     \n","name":"Redirect Example","logging":"on"}}
