{"global":[],"global_start_line":null,"dispatch":[],"dispatch_start_col":null,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"noop","args":[],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"domtester","start_col":5,"emit":"$K('body').append('<div id=\"kobj_loaded\"></div>');  $K('#domTestClicker').bind('click',function(){  \t$K('#domTestContent').html('<div id=\"domTestPresent\">Clicked</div>');  });  KOBJ.watchDOM('#domTestContent',function(){  \t$K('body').append('<div id=\"domTestWorked\">DOM Test Worked</div>');  });            ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"http://k-misc.s3.amazonaws.com/runtime-dependencies/domWatch.html","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":6}],"meta_start_col":5,"meta":{"logging":"off","name":"domTest","meta_start_line":2,"meta_start_col":5},"dispatch_start_line":null,"global_start_col":null,"ruleset_name":"a41x91"}