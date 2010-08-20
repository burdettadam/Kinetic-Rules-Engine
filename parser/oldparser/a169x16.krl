{"global":[{"source":"http://search.twitter.com/search.json","name":"twitterSearch","type":"datasource","datatype":"JSON","cachable":{"period":"minutes","value":"5"}},{"content":"#FreshBuzz_Logo {\n        background-image: url(\"http://demo.freshbuzz.net/FreshBuzz_logo.png\");\n        height:           64px;\n        margin-bottom:    10px;\n        display:          block;\n      }\n      #FreshBuzz_Loading {\n        text-align:       center;\n      }\n      #FreshBuzz_Loading img {\n        margin:           0 auto;\n      }\n      #FreshBuzz_TweetContainer a:link {\n        color:            #497BB6;\n      }\n      #FreshBuzz_TweetContainer a:visited {\n        color:            #497BB6;\n      }\n      #FreshBuzz_TweetContainer a:hover, #FreshBuzz_TweetContainer a:hover b {\n        color:            #233570;\n      }\n      #FreshBuzz_TweetContainer {\n        font-family:      'Lucida Grande',Arial,Helvetica,sans-serif;\n        font-size:        12px;\n        background-color: #333333;\n        color:            #FFFFFF;\n        height:           400px;\n        overflow-x:       auto;\n        overflow-y:       auto;\n        border-style:     none;\n        margin:           0;\n      }\n      ul#FreshBuzz_TweetList {\n        border-top:       1px solid #EEEEEE;\n        list-style-type:  none;\n        margin:           -10px 0 0;\n        padding:          0;\n      }\n      #FreshBuzz_TweetList li {\n        border-bottom:    1px solid #EEEEEE;\n        line-height:      16px;\n        margin:           0;\n        overflow:         hidden;\n        padding:          15px 5px;\n      }\n      div.FreshBuzz_Avatar {\n        float:            left;\n        height:           48px;\n        overflow:         hidden;\n        width:            48px;\n      }\n      div.FreshBuzz_Avatar a {\n        text-decoration:  none;\n      }\n      div.FreshBuzz_Avatar img {\n        border:           0 none;\n        height:           48px;\n        width:            48px;\n      }\n      div.FreshBuzz_Msg {\n        margin-bottom:    2px;\n        margin-left:      58px;\n\n      }\n      .clearleft {\n        clear:            left;\n      }\n    ","type":"css"}],"global_start_line":21,"dispatch":[{"domain":"google.com","ruleset_id":null},{"domain":"bing.com","ruleset_id":null},{"domain":"yahoo.com","ruleset_id":null},{"domain":"travelocity.com","ruleset_id":null},{"domain":"expedia.com","ruleset_id":null},{"domain":"orbitz.com","ruleset_id":null},{"domain":"priceline.com","ruleset_id":null}],"dispatch_start_col":3,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"notify","args":[{"val":"FreshBuzzHeader","type":"var"},{"val":"TweetList_Container","type":"var"}],"modifiers":[{"value":{"val":323,"type":"num"},"name":"width"},{"value":{"val":"true","type":"bool"},"name":"sticky"},{"value":{"val":1,"type":"num"},"name":"opacity"}],"vars":null},"label":null}],"post":null,"pre":[{"rhs":"<a href=\"http://www.aculis.com\"><span id=\"FreshBuzz_Logo\"/></a>\n      ","lhs":"FreshBuzzHeader","type":"here_doc"},{"rhs":"<div id=\"FreshBuzz_Loading\">\n          <img src=\"http://demo.freshbuzz.net/spinner32.gif\" alt=\"Loading ...\"/>\n        </div>\n        <div id=\"FreshBuzz_TweetContainer\" style=\"display:none\">\n          <ul id=\"FreshBuzz_TweetList\">\n          </ul>\n        </div>\n      ","lhs":"TweetList_Container","type":"here_doc"}],"name":"init_freshbuzz","start_col":3,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":102},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"append","args":[{"val":"#FreshBuzz_TweetList","type":"str"},{"val":"tweet_Container","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"obj":{"val":"tweet","type":"var"},"args":[{"val":"$..text","type":"str"}],"name":"pick","type":"operator"},"lhs":"rawtext","type":"expr"},{"rhs":{"obj":{"val":"rawtext","type":"var"},"args":[{"val":"/http:\\/\\/([A-Za-z0-9.-]+)\\/.*/","type":"regexp"},{"val":"$1","type":"str"}],"name":"replace","type":"operator"},"lhs":"text","type":"expr"},{"rhs":{"obj":{"val":"tweet","type":"var"},"args":[{"val":"$..from_user","type":"str"}],"name":"pick","type":"operator"},"lhs":"user","type":"expr"},{"rhs":{"obj":{"val":"tweet","type":"var"},"args":[{"val":"$..profile_image_url","type":"str"}],"name":"pick","type":"operator"},"lhs":"avatar","type":"expr"},{"rhs":{"args":[{"val":"<li class='FreshBuzz_TweetContainer'>","type":"str"},{"args":[{"val":"<div class='FreshBuzz_Avatar'>","type":"str"},{"args":[{"val":"<a href='http://twitter.com/","type":"str"},{"args":[{"val":"user","type":"var"},{"args":[{"val":"'><img src='","type":"str"},{"args":[{"val":"avatar","type":"var"},{"args":[{"val":"'></a>","type":"str"},{"args":[{"val":"</div>","type":"str"},{"args":[{"val":"<div class='FreshBuzz_Msg'>","type":"str"},{"args":[{"val":"<a href='http://twitter.com/","type":"str"},{"args":[{"val":"user","type":"var"},{"args":[{"val":"'>","type":"str"},{"args":[{"val":"user","type":"var"},{"args":[{"val":"</a>: ","type":"str"},{"args":[{"val":"<span class='FreshBuzz_MsgText'>","type":"str"},{"args":[{"val":"text","type":"var"},{"args":[{"val":"</span>","type":"str"},{"args":[{"val":"</div>","type":"str"},{"val":"</li>","type":"str"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"type":"prim","op":"+"},"lhs":"tweet_Container","type":"expr"}],"name":"populate_freshbuzz","start_col":3,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[{"expr":{"obj":{"source":"datasource","predicate":"twitterSearch","args":[{"val":"?q=SouthwestAir","type":"str"}],"type":"qualified"},"args":[{"val":"$..results","type":"str"}],"name":"pick","type":"operator"},"var":["tweet"]}]},"start_line":125},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"noop","args":[],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":null,"name":"show_freshbuzz","start_col":3,"emit":"$K(\"#FreshBuzz_Loading\").slideUp(\"slow\");\n      $K(\"#FreshBuzz_TweetContainer\").slideDown(\"slow\");\n    ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":149}],"meta_start_col":3,"meta":{"logging":"off","name":"SouthWest FreshBuzz","meta_start_line":2,"author":"Ed Orcutt <edo@aculis.com>","description":"Display Twitter search results when visiting Travel sites and search engines.\n    ","meta_start_col":3},"dispatch_start_line":11,"global_start_col":3,"ruleset_name":"a169x16"}