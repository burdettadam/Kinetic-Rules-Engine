{"global":[],"dispatch":[],"ruleset_name":"a685x1","rules":[{"blocktype":"every","emit":null,"pre":[],"name":"first_rule","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Hello World","type":"str"},{"val":"This is a sample rule.","type":"str"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}}]}},{"action":{"source":null,"args":[{"val":"#area9","type":"str"},{"val":"added to area 9","type":"str"}],"name":"append","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area9","type":"str"},{"val":"prepend to area 9","type":"str"}],"name":"prepend","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area9","type":"str"},{"val":"<div id='area10'>data after area 9<\/div>","type":"str"}],"name":"after","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area9","type":"str"},{"val":"<div id='area8.5'>data before area 9<\/div>","type":"str"}],"name":"before","modifiers":null}},{"action":{"source":null,"args":[{"val":"absolute","type":"str"},{"val":"top: 10px","type":"str"},{"val":"right: 10px","type":"str"},{"val":"http://k-misc.s3.amazonaws.com/runtime-dependencies/floattext.html","type":"str"}],"name":"float","modifiers":null}},{"action":{"source":null,"args":[{"val":"absolute","type":"str"},{"val":"top:50px","type":"str"},{"val":"right:50px","type":"str"},{"val":"<h1 id='floatid'>I'm Floating HTML!<\/h1>","type":"str"}],"name":"float_html","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area4","type":"str"},{"val":"#area2","type":"str"}],"name":"move_after","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area5","type":"str"}],"name":"move_to_top","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area6","type":"str"},{"val":"<div id='newarea6replace'>new area 6<\/div>","type":"str"}],"name":"replace_html","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area7","type":"str"},{"val":"http://k-misc.s3.amazonaws.com/runtime-dependencies/replacetext.html","type":"str"}],"name":"replace","modifiers":null}},{"action":{"source":null,"args":[{"val":"#area8","type":"str"},{"val":"The content has been replaced","type":"str"}],"name":"replace_inner","modifiers":null}},{"action":{"source":null,"args":[{"val":"#myimage","type":"str"},{"val":"http://k-misc.s3.amazonaws.com/runtime-dependencies/Asshole_20Watcher.jpg","type":"str"}],"name":"replace_image_src","modifiers":null}},{"action":{"source":null,"args":[{"val":"#mychangeelement","type":"str"},{"val":"value","type":"str"},{"val":"Ihavechanged","type":"str"}],"name":"set_element_attr","modifiers":null}}]}],"meta":{"author":"Cid Dennis","description":"\n      This is a test app to put as much stuff on one pages as we can to verify as many actions as we can.\n    ","name":"MostCrapOnOnePage","logging":"off"}}