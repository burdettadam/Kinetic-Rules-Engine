{"global":[{"content":".percolated {\n\t\t\t    \tbackground-color : #F80000;    \n\t\t\t}\n\t\t\t\n\t\t\t#kGrowl {\n\t\t\t\tright:100% !important;\n\t\t\t\tleft:0px !important;\n\t\t\t}\n\t\t","type":"css"}],"global_start_line":10,"dispatch":[],"dispatch_start_col":null,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"percolate","args":[{"val":"selector","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"percolate_via_result_num","start_col":2,"emit":"KOBJ.randomNumber = 0;\n\t\t\t\tfunction selector(obj){\n\t\t\t\t\tKOBJ.randomNumber++;\n\t\t\t\t\tif(KOBJ.randomNumber == 26 || KOBJ.randomNumber == 45 || KOBJ.randomNumber == 89 || KOBJ.randomNumber == 94){\n\t\t\t\t\t\treturn true;\n\t\t\t\t\t} else {\n\t\t\t\t\t\treturn false;\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t","state":"inactive","callbacks":null,"pagetype":{"event_expr":{"pattern":"google.com|search.yahoo.com|bing.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":23},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"label":null,"emit":"$K('#undoify').live('click', function() {\n\t\t\t\t\tKOBJ.log(\"Unhighlightified!\");\n\t\t\t\t});\n\n\t\t\t\tKOBJ.a41x93.num = 1;\n\t\t\t\tKOBJ.a41x93.cutoff = 10;\n\t\t\t\tvar mySelectorFunc = function(obj) {\n\t\t\t\t\tvar thisObject = $K(obj);\n\t\t\t\t\tvar normLogs = [];\n\t\t\t\t\tvar logicLogs = [];\n\t\t\t\t\tKOBJ.log(\"Current DOM object:\");\n\t\t\t\t\tKOBJ.log(thisObject);\n\t\t\t\t\tvar boolToReturn = false;\n\t\t\t\t\tif(a41x93.num <= KOBJ.a41x93.cutoff){\n\t\t\t\t\t\tboolToRetun = true;\n\t\t\t\t\t}\n\t\t\t\t\tnormLogs.push(\"Return value for search result \" +KOBJ.a41x93.num+ \":\");\n\t\t\t\t\tnormLogs.push(boolToReturn);    \n\t\t\t\t\tKOBJ.log(normLogs);   \n\t\t\t\t\tif (boolToReturn) {\n\t\t\t\t\t\tlogicLogs.push(\"Percolating search result: \" +KOBJ.a41x93.num);   \n\t\t\t\t\t\t$K('.KOBJ_item',obj).addClass('percolated'); \n\t\t\t\t\t} else {    \n\t\t\t\t\t\tlogicLogs.push(\"Not percolating result: \" +KOBJ.a41x93.num+ \", because it is greater than \" +KOBJ.a41x93.cutoff+ \".\"); \n\t\t\t\t\t}\n\t\t\t\t\tKOBJ.log(logicLogs);      \n\t\t\t\t\tKOBJ.log(\"\\n\");   \n\t\t\t\t\tKOBJ.a41x93.num++;  \n\t\t\t\t\treturn boolToReturn;\n\t\t\t\t};             \n\n\t\t\t"},{"action":{"source":null,"name":"percolate","args":[{"val":"mySelectorFunc","type":"var"}],"modifiers":null},"label":null},{"action":{"source":null,"name":"notify","args":[{"val":"Percolate Example","type":"str"},{"val":"msg","type":"var"}],"modifiers":[{"value":{"val":"true","type":"bool"},"name":"sticky"}]},"label":null}],"post":null,"pre":[{"rhs":"<div id=\"notifyMsg\">Hello There! Percolated results have been turned <span style=\"color:#F80000;\">this color</span>. If you would no longer like to have them highlighted, <div id=\"undoify\" style=\"cursor:pointer;color:#0a94d6\">click here</div></div>    \t     \n\t\t\t\t","lhs":"msg","type":"here_doc"}],"name":"percolate_first_n_results","start_col":2,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"google.com/search|bing.com/search|search.yahoo.com/search","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":41}],"meta_start_col":2,"meta":{"logging":"off","name":"Percolate Demo","meta_start_line":2,"author":"AKO & JAM","description":"A demo of the action Percolate    \n\t\t\t","meta_start_col":2},"dispatch_start_line":null,"global_start_col":2,"ruleset_name":"a41x93"}
