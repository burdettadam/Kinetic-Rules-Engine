{"global":[],"global_start_line":null,"dispatch":[{"domain":"google.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"after","args":[{"val":"#logo","type":"str"},{"val":"msg","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":"<br/><img src=\"http://www.frameaction.com/plexpages/images/freewifi.jpg\" border=\"0\">  \t\t\n ","lhs":"msg","type":"here_doc"}],"name":"replace","start_col":5,"emit":null,"state":"inactive","callbacks":null,"pagetype":{"event_expr":{"pattern":"www.google.com/$","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":9},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"noop","args":[],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"googleplex","start_col":5,"emit":"$K(\"#logo\").parent().attr(\"href\",\"http://www.google.com\");  $K(\"#logo\").attr(\"src\",\"http://www.frameaction.com/plexpages/images/logoGooglePlex.jpg\");          ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"www.google.com/$","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":19}],"meta_start_col":5,"meta":{"logging":"off","name":"Plex Free Wifi","meta_start_line":2,"meta_start_col":5},"dispatch_start_line":6,"global_start_col":null,"ruleset_name":"a41x6"}
