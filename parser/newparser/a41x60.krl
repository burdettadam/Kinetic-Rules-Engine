{"global":[],"dispatch":[],"ruleset_name":"a41x60","rules":[{"blocktype":"every","emit":"\nbusinessData = {    \t'8014929012': 'www.bobstowing.com',  \t'8017565883': 'www.geneharvey.com',  \t'8013415088': 'www.bobstowing.com',  \t'4162912868': 'www.bobstowing.com',  \t'8012255404': 'www.geneharvey.com'  };    domainData = {  \t'www.geneharvey.com': {'url':'www.geneharvey.com'},  \t'www.bobstowing.com': {'url':'www.bobstowing.com'}  };    \t  function my_selector(obj){    \tdomain = $K(obj.KOBJ).data(\"domain\");  \tphone = $K(obj.KOBJ).data(\"phone\");  \tcompact = $K(obj.KOBJ).data(\"compact\");  \tconsole.log(phone);  \tvar p = businessData[phone];  \tif(!p){  \t\tp = domainData[domain];  \t\tif(p){  \t\t\tp = businessData[p];  \t\t}  \t}  \tif(p && compact) {  \t\treturn \"<img src='http://k-misc.s3.amazonaws.com/resources/a8x17/bbbaccredited.png'/>\";  \t} else if(p && !compact) {  \t\treturn \"<img src='http://k-misc.s3.amazonaws.com/resources/a8x17/bbb-full.jpg' />\";  \t} else {  \t\treturn false;  \t}  }            ","name":"test_local_annotate","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"my_selector","type":"var"}],"name":"annotate_local_search_results","modifiers":null}}]}],"meta":{"name":"TestLocalAnnotate","logging":"off"}}
