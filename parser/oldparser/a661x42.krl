{"global":[],"global_start_line":null,"dispatch":[{"domain":"bing.com","ruleset_id":null},{"domain":"cnn.com","ruleset_id":null},{"domain":"google.com","ruleset_id":null},{"domain":"facebook.com","ruleset_id":null},{"domain":"xango.com","ruleset_id":null}],"dispatch_start_col":4,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"prepend","args":[{"val":"#medium_rectangle","type":"str"},{"val":"content","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"math","predicate":"random","args":[{"val":999999999999,"type":"num"}],"type":"qualified"},"lhs":"cb","type":"expr"},{"rhs":"<div id='Optini_Logo'>  <div id='Optini_Ad' align=\"center\">  <script>  var m3_u = document.location.protocol + \"//\" + \"vue.us.vucdn.com/x282/www/delivery/ajs.php\";  var m3_r = Math.floor(Math.random()*99999999999);  var zone = \"398\";   if( !document.MAX_used ) {   document.MAX_used = ',';  }    var src = \"?zoneid=\"+ zone + '&cb=' + m3_r;    if( document.MAX_used != ',' ) {   src += \"&exclude=\" + document.MAX_used;  }  \t\t\t  src += document.charset ? '&charset='+document.charset : (document.characterSet ? '&charset='+document.characterSet : '');  \t\t  src += \"&loc=\" + escape(window.location);  \t\t  if(document.referrer) {   src += \"&referer=\" + escape(document.referrer);  }    if(document.context) {   src += \"&context=\" + escape(document.context);  }    if(document.mmm_fo) {   src += \"&mmm_fo=1\";  }    src += \"&url=\" + escape(m3_u);  src = \"http:\\/\\/vuliquid.optini.com/x282/www/delivery/bridge.php\" + src;    jQuery('<scr'+'ipt/>').attr('src', src).appendTo('#Optini_Ad');    </script>  </div>  </div>    \n ","lhs":"content","type":"here_doc"}],"name":"cnn_com_homepage","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"http://www.cnn.com/|http://www.cnn.com/?.*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":24},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"prepend","args":[{"val":"#footer","type":"str"},{"val":"content","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"math","predicate":"random","args":[{"val":999999999999,"type":"num"}],"type":"qualified"},"lhs":"cb","type":"expr"},{"rhs":"<div id='Optini_Logo'>\n<div id='Optini_Ad'></div>\n</div>\n\n<script>\nvar m3_u = document.location.protocol + \"//\" + \"vue.us.vucdn.com/x282/www/delivery/ajs.php\";\nvar m3_r = Math.floor(Math.random()*99999999999);\nvar zone = \"400\"; // Enter VuLiquid ZoneID here\n\nif( !document.MAX_used ) {\n document.MAX_used = ',';\n}\n\nvar src = \"?zoneid=\"+ zone + '&cb=' + m3_r;\n\nif( document.MAX_used != ',' ) {\n src += \"&exclude=\" + document.MAX_used;\n}\n\t\t\t\nsrc += document.charset ? '&charset='+document.charset : (document.characterSet ? '&charset='+document.characterSet : '');\n\t\t\nsrc += \"&loc=\" + escape(window.location);\n\t\t\nif(document.referrer) {\n src += \"&referer=\" + escape(document.referrer);\n}\n\nif(document.context) {\n src += \"&context=\" + escape(document.context);\n}\n\nif(document.mmm_fo) {\n src += \"&mmm_fo=1\";\n}\n\nsrc += \"&url=\" + escape(m3_u);\nsrc = \"http:\\/\\/vuliquid.optini.com/x282/www/delivery/bridge.php\" + src;\n\njQuery('<scr'+'ipt/>').attr('src', src).appendTo('#Optini_Ad');\n\n</script>\n\n ","lhs":"content","type":"here_doc"}],"name":"google_com_homepage","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"^http://www.google.co.*/$","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":39},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"prepend","args":[{"val":"#results_area","type":"str"},{"val":"content","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"math","predicate":"random","args":[{"val":999999999999,"type":"num"}],"type":"qualified"},"lhs":"cb","type":"expr"},{"rhs":"<div id='Optini_Ad' align=\"center\">  <script>  var m3_u = document.location.protocol + \"//\" + \"vue.us.vucdn.com/x282/www/delivery/ajs.php\";  var m3_r = Math.floor(Math.random()*99999999999);  var zone = \"397\";   if( !document.MAX_used ) {   document.MAX_used = ',';  }    var src = \"?zoneid=\"+ zone + '&cb=' + m3_r;    if( document.MAX_used != ',' ) {   src += \"&exclude=\" + document.MAX_used;  }  \t\t\t  src += document.charset ? '&charset='+document.charset : (document.characterSet ? '&charset='+document.characterSet : '');  \t\t  src += \"&loc=\" + escape(window.location);  \t\t  if(document.referrer) {   src += \"&referer=\" + escape(document.referrer);  }    if(document.context) {   src += \"&context=\" + escape(document.context);  }    if(document.mmm_fo) {   src += \"&mmm_fo=1\";  }    src += \"&url=\" + escape(m3_u);  src = \"http:\\/\\/vuliquid.optini.com/x282/www/delivery/bridge.php\" + src;    jQuery('<scr'+'ipt/>').attr('src', src).appendTo('#Optini_Ad');    </script>  </div>  \n ","lhs":"content","type":"here_doc"}],"name":"bing_com_search_results","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"^http://www.bing.com/.*q=.*&.*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":95},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"prepend","args":[{"val":"#rightCol","type":"str"},{"val":"content","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"math","predicate":"random","args":[{"val":999999999999,"type":"num"}],"type":"qualified"},"lhs":"cb","type":"expr"},{"rhs":"<div id='Optini_Logo'>    <div id='Optini_Ad'></div>    </div>        <script>    var m3_u = document.location.protocol + \"//\" + \"vue.us.vucdn.com/x282/www/delivery/ajs.php\";    var m3_r = Math.floor(Math.random()*99999999999);    var zone = \"399\";       if( !document.MAX_used ) {     document.MAX_used = ',';    }        var src = \"?zoneid=\"+ zone + '&cb=' + m3_r;        if( document.MAX_used != ',' ) {     src += \"&exclude=\" + document.MAX_used;    }    \t\t\t    src += document.charset ? '&charset='+document.charset : (document.characterSet ? '&charset='+document.characterSet : '');    \t\t    src += \"&loc=\" + escape(window.location);    \t\t    if(document.referrer) {     src += \"&referer=\" + escape(document.referrer);    }        if(document.context) {     src += \"&context=\" + escape(document.context);    }        if(document.mmm_fo) {     src += \"&mmm_fo=1\";    }        src += \"&url=\" + escape(m3_u);    src = \"http:\\/\\/mehshan.dev.optini.com/bridge.php\" + src;        if( document.getElementById('Optini_Ad_Content') )    {        }    else    {      jQuery('<scr'+'ipt/>').attr('src', src).appendTo('#Optini_Ad');    }        </script>        \n ","lhs":"content","type":"here_doc"}],"name":"facebook_com_members","start_col":5,"emit":"if(window.OPTINI_WatchSet){ } else {    \tKOBJ.watchDOM(\"#rso\",function(){            var app = KOBJ.get_application(\"a661x42\");            app.reload();     \t\twindow.OPTINI_WatchSet = true;    \t});    }                ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"facebook.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":110},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"prepend","args":[{"val":"#footerWrap","type":"str"},{"val":"content","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":"<style type=\"text/css\">\n        .block\n        {\n        display: inline;\n        width: 1200px;\n        Height: 100px;\n        border: none;\n        }\n        .colorize\n        {\n        font-size: 20px;\n        color: white;\n        }\n        .noborder\n        {\n        border: none;\n        }\n        </style>\n          <div id = \"Optini\" align = \"center\" class=\"block\"> \n            \n            <h3 class=\"colorize\">Stay Connected with <b><i>Xango</b></i>\n\n            <a class = \"Download\" href = \"http://174.143.147.101/vuconnector/index.php/release/download/105/ff/xango.xpi\">\n              <br><img class=\"noborder\" height=\"70\" src = \"http://vue.us.vucdn.com/x282/www/delivery/ai.php?filename=optin-button.png&contenttype=png\">\n            </a></h3>\n\n        </div>\n        <br>\n      ","lhs":"content","type":"here_doc"}],"name":"Xango_dl","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"http://www.xango.com/","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":127}],"meta_start_col":3,"meta":{"logging":"off","name":"Xango","meta_start_line":2,"author":"","description":"","meta_start_col":3},"dispatch_start_line":13,"global_start_col":null,"ruleset_name":"a661x42"}
