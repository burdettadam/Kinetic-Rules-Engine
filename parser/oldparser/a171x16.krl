{"global":[{"content":"#dango {    \tmargin-top: 5px;    }        ","type":"css"}],"global_start_line":17,"dispatch":[{"domain":"www.google.com","ruleset_id":null},{"domain":"google.com","ruleset_id":null},{"domain":"movies.yahoo.com","ruleset_id":null},{"domain":"www.fandango.com","ruleset_id":null},{"domain":"www.imdb.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"label":null,"emit":"var state = s.toLowerCase();          var city = \"\";          var zip = \"\";          var location = \"\";                    var name = \"near\";          name = name.replace(/[\\[]/,\"\\\\\\[\").replace(/[\\]]/,\"\\\\\\]\");          var regexS = \"[\\\\?&]\"+name+\"=([^&#]*)\";          var regex = new RegExp(regexS);          var results = regex.exec(window.location.href);          location = results[1];            if (location.indexOf(\"+\")>-1){                               var counter = 0;                var pos = \"-1\";  \t      for(i=0; i<location.length; i++) {                   if (location[i] == \"+\"){                      counter++;                      pos = i;                   }                }                     location = location.substr(0,pos) + \"_\" + location.substr(pos+1);             }                             "},{"action":{"source":null,"name":"after","args":[{"val":"div.times","type":"str"},{"args":[{"val":"msg1","type":"var"},{"args":[{"val":"location","type":"var"},{"val":"msg2","type":"var"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"page","predicate":"url","args":[{"val":"query","type":"str"}],"type":"qualified"},"lhs":"q","type":"expr"},{"rhs":{"source":"location","predicate":"region","args":[],"type":"qualified"},"lhs":"s","type":"expr"},{"rhs":"<div id=\"dango\"><a href=\"http://www.fandango.com/\n ","lhs":"msg1","type":"here_doc"},{"rhs":"_movietheatershowtimes\"><img src=\"http://www.mashworx.com/clients/fandango/buynow.jpg\" border=\"0\"></a></div> \n ","lhs":"msg2","type":"here_doc"}],"name":"google_movie","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"www.google.com/(.)*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":20},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"label":null,"emit":"var city = \"\";                       var zip = \"\";                       var location = \"\";                                 var name = \"location\";                       name = name.replace(/[\\[]/,\"\\\\\\[\").replace(/[\\]]/,\"\\\\\\]\");                       var regexS = \"[\\\\?&]\"+name+\"=([^&#]*)\";                       var regex = new RegExp(regexS);                       var results = regex.exec(window.location.href);                       location = results[1];             location = location.replace(\"%2C\",\"\");             var temp = location;                           if (location.indexOf(\"+\")>-1){                               var counter = 0;                var pos = \"-1\";  \t      for(i=0; i<location.length; i++) {                   if (location[i] == \"+\"){                      counter++;                      pos = i;                   }                }                     location = location.substr(0,pos) + \"_\" + location.substr(pos+1);             }                                            "},{"action":{"source":null,"name":"after","args":[{"val":"tr.odd","type":"str"},{"args":[{"val":"msg1","type":"var"},{"args":[{"val":"location","type":"var"},{"val":"msg2","type":"var"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"modifiers":null,"vars":null},"label":null},{"action":{"source":null,"name":"after","args":[{"val":"tr.even","type":"str"},{"args":[{"val":"msg1","type":"var"},{"args":[{"val":"location","type":"var"},{"val":"msg2","type":"var"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"page","predicate":"url","args":[{"val":"query","type":"str"}],"type":"qualified"},"lhs":"q","type":"expr"},{"rhs":"<div id=\"dango\"><a href=\"http://www.fandango.com/\n ","lhs":"msg1","type":"here_doc"},{"rhs":"_movietheatershowtimes\"><img src=\"http://www.mashworx.com/clients/fandango/buynow.jpg\" border=\"0\"></a></div> \n ","lhs":"msg2","type":"here_doc"}],"name":"yahoo_movie","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"movies.yahoo.com/(.)*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":40}],"meta_start_col":5,"meta":{"logging":"off","name":"Fandango_Theater","meta_start_line":2,"author":"Mark Mugleston","description":"Fandango Advertisement for Specific Theaters on Google    \n","meta_start_col":5},"dispatch_start_line":10,"global_start_col":5,"ruleset_name":"a171x16"}
