{"global":[],"global_start_line":null,"dispatch":[{"domain":"lifelock.com","ruleset_id":null},{"domain":"identityguard.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"Hello from ID Watchdog.","type":"str"},{"val":"Why are you here?  Did you know the ID Watchdog provides a far superior service?.  I'm sending you to our site!","type":"str"}],"modifiers":[{"value":{"val":"true","type":"bool"},"name":"sticky"},{"value":{"val":"#150517","type":"str"},"name":"text_color"},{"value":{"val":"#7E2217","type":"str"},"name":"background_color"}],"vars":null},"label":null},{"action":{"source":null,"name":"notify","args":[{"val":"More from ID Watchdog.","type":"str"},{"val":"See you there!","type":"str"}],"modifiers":[{"value":{"val":10,"type":"num"},"name":"delay"}],"vars":null},"label":null},{"action":{"source":null,"name":"redirect","args":[{"val":"http://www.idwatchdog.com","type":"str"}],"modifiers":[{"value":{"val":5,"type":"num"},"name":"delay"}],"vars":null},"label":null}],"post":null,"pre":null,"name":"lifelock","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"http://www.lifelock.com/","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":13},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"Hello from ID Watchdog.","type":"str"},{"val":"Why are you here?  Did you know the ID Watchdog provides a far superior service?.  I'm sending you to our site in 10 seconds.","type":"str"}],"modifiers":[{"value":{"val":"true","type":"bool"},"name":"sticky"},{"value":{"val":"#150517","type":"str"},"name":"text_color"},{"value":{"val":"#7E2217","type":"str"},"name":"background_color"}],"vars":null},"label":null},{"action":{"source":null,"name":"notify","args":[{"val":"More from ID Watchdog.","type":"str"},{"val":"See you there!","type":"str"}],"modifiers":[{"value":{"val":10,"type":"num"},"name":"delay"}],"vars":null},"label":null},{"action":{"source":null,"name":"redirect","args":[{"val":"http://www.idwatchdog.com","type":"str"}],"modifiers":[{"value":{"val":5,"type":"num"},"name":"delay"}],"vars":null},"label":null}],"post":null,"pre":null,"name":"identityquard","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"http://www.identityguard.com/","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":30},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"More from ID Watchdog.","type":"str"},{"val":"I'm sending you to our site!","type":"str"}],"modifiers":[{"value":{"val":10,"type":"num"},"name":"delay"}],"vars":null},"label":null},{"action":{"source":null,"name":"redirect","args":[{"val":"http://www.idwatchdog.com","type":"str"}],"modifiers":[{"value":{"val":5,"type":"num"},"name":"delay"}],"vars":null},"label":null}],"post":null,"pre":null,"name":"lifelock_signup","start_col":5,"emit":null,"state":"inactive","callbacks":null,"pagetype":{"event_expr":{"pattern":"https://secure.lifelock.com/EnrollmentForm.aspx/","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":47}],"meta_start_col":5,"meta":{"logging":"off","name":"IDW Test","meta_start_line":2,"description":"test   \n","meta_start_col":5},"dispatch_start_line":9,"global_start_col":null,"ruleset_name":"a117x2"}
