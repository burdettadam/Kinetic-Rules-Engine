{"global":[],"global_start_line":null,"dispatch":[],"dispatch_start_col":null,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"annotate_local_search_results","args":[{"val":"my_selector","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"test_local_annotate","start_col":5,"emit":"businessData = {    \t'8014929012': 'www.bobstowing.com',  \t'8017565883': 'www.geneharvey.com',  \t'8013415088': 'www.bobstowing.com',  \t'4162912868': 'www.bobstowing.com',  \t'8012255404': 'www.geneharvey.com'  };    domainData = {  \t'www.geneharvey.com': {'url':'www.geneharvey.com'},  \t'www.bobstowing.com': {'url':'www.bobstowing.com'}  };    \t  function my_selector(obj){    \tdomain = $K(obj.KOBJ).data(\"domain\");  \tphone = $K(obj.KOBJ).data(\"phone\");  \tcompact = $K(obj.KOBJ).data(\"compact\");  \tconsole.log(phone);  \tvar p = businessData[phone];  \tif(!p){  \t\tp = domainData[domain];  \t\tif(p){  \t\t\tp = businessData[p];  \t\t}  \t}  \tif(p && compact) {  \t\treturn \"<img src='http://k-misc.s3.amazonaws.com/resources/a8x17/bbbaccredited.png'/>\";  \t} else if(p && !compact) {  \t\treturn \"<img src='http://k-misc.s3.amazonaws.com/resources/a8x17/bbb-full.jpg' />\";  \t} else {  \t\treturn false;  \t}  }            ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":6}],"meta_start_col":5,"meta":{"logging":"off","name":"TestLocalAnnotate","meta_start_line":2,"meta_start_col":5},"dispatch_start_line":null,"global_start_col":null,"ruleset_name":"a41x60"}
