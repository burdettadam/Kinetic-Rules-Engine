{"global":[{"content":"#KOBJ_replace {background-color: black;}        ","type":"css"}],"dispatch":[{"domain":"yahoo.com"},{"domain":"bing.com"},{"domain":"google.com"},{"domain":"cnn.com"},{"domain":"chevelle.confettiantiques.com"}],"ruleset_name":"a41x27","rules":[{"blocktype":"every","emit":null,"name":"alert","callbacks":null,"state":"inactive","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"[^chevelle]\\w+","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"KOBJ_alert","type":"str"}],"name":"alert","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"after","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"body","type":"str"},{"val":"<span id='KOBJ_after'>KOBJ_after<\/span>","type":"str"}],"name":"after","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"append","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"body","type":"str"},{"val":"<div id='KOBJ_app_bef_aft_test'><span id='KOBJ_append'>KOBJ_append<\/span><\/div>","type":"str"}],"name":"append","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"before","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"#KOBJ_append","type":"str"},{"val":"<span id='KOBJ_before'>KOBJ_before<\/span>","type":"str"}],"name":"before","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"float","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"absolute","type":"str"},{"val":"top:10px","type":"str"},{"val":"right:10px","type":"str"},{"val":"http://k-misc.s3.amazonaws.com/random/test/annotate.html","type":"str"}],"name":"float","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"float_html","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"absolute","type":"str"},{"val":"bottom:10px","type":"str"},{"val":"left:10px","type":"str"},{"val":"<span id='KOBJ_float_html'>KOBJ_float_html<\/span>","type":"str"}],"name":"float_html","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"move_after","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"#KOBJ_before","type":"str"},{"val":"#KOBJ_after","type":"str"}],"name":"move_after","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"move_to_top","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"#KOBJ_float_html","type":"str"}],"name":"move_to_top","modifiers":null}}]},{"blocktype":"every","emit":null,"name":"notify","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"KOBJ_test","type":"str"},{"val":"<div id='KOBJ_notify'><h3>KOBJ_notify<\/h3><\/div>","type":"str"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}}]}}]},{"blocktype":"every","emit":null,"name":"prepend","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"#KOBJ_float_html","type":"str"},{"val":"<span id='KOBJ_prepend'>KOBJ_prepend<\/span>","type":"str"}],"name":"prepend","modifiers":null}}]}],"meta":{"name":"AutoJAM Tests","logging":"on"}}
