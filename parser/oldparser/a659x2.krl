{"global":[{"source":"http://pipes.yahoo.com/pipes/pipe.run?_id=b772ba4527b1a4cc836d0310122a57dd&_render=json","name":"consoleFeed","type":"dataset","datatype":"JSON","cachable":{"period":"seconds","value":"1"}}],"global_start_line":11,"dispatch":[{"domain":"www.facebook.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"label":null,"emit":"if(KOBJ.watching) { } else {\n                 KOBJ.watchDOM(\"#pagelet_eventbox\",function(){\n                   KOBJ.get_application(\"a146x8\").reload();\n                   KOBJ.watching = true;\n                 });\n               }\n               \n               if($K('#FFT_Main').length) { } else {\n                 $K(\"#rightCol\").prepend(message);\n               }\n            "}],"post":null,"pre":[{"rhs":"<div id=\"FFT_Main\" style=\"background:#f0f3f9; padding: 1px; margin: 0 0 15px 0;\">\n                <div id=\"FFT_Banner_Small\" style=\"padding: 0px; margin: 10px 10px 15px 10px;\">\n                  <img width=\"229\" height=\"46\" src=\"http://www.invisusdirect.com/brent/banner_small.png\" border=\"0\" />\n                </div>\n        \t\t      <div id=\"FFT_RecentVideos\" style=\"padding: 0px; margin: 10px 10px 15px 10px;\">\n        \t\t        <div style=\"border-bottom: 1px solid #CCC; width: 100%; font-weight: bold; padding-bottom: 3px;\">Money Tips & Tricks</div>\n        \t\t        <div id=\"recentvideos_list\" style=\"border-top: 1px solid #CCC;></div>\n        \t\t      </div> \n        \t\t      <div id=\"FFT_RecentBlogs\" style=\"padding: 0px; margin: 10px 10px 15px 10px;\"><b>Garretts Tweets</b>\n        \t\t        <div id=\"recentblogs_list\">  </div>\n        \t\t      </div> \n        \t\t      <div id=\"FFT_Recentpromotions\" style=\"padding: 0px; margin: 10px 10px 15px 10px;\"><b>FastTrack Deals</b>\n        \t\t        <div id=\"recentpromotions_list\">  </div>\n        \t\t      </div> \n        \t\t    </div>\n            ","lhs":"message","type":"here_doc"}],"name":"facebook","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":16},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"replace_inner","args":[{"val":"#recentvideos_list","type":"str"},{"val":"","type":"str"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"clear_populate_videos","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":57},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"append","args":[{"val":"#recentvideos_list","type":"str"},{"val":"div","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":"<div style='margin:2px;' align='center'>\n                      <object width=\"210\" height=\"140\">\n\t\t\t\t<param name=\"movie\" value=\"http://www.youtube.com/v/uVye35oTvHc&hl=en_US&fs=1&\"></param>\n\t\t\t\t<param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param>\n\t\t\t\t<embed src=\"http://www.youtube.com/v/uVye35oTvHc&hl=en_US&fs=1&\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"210\" height=\"140\"></embed>\n\t\t\t</object>\n                  </div>\n                ","lhs":"div","type":"here_doc"}],"name":"populate_videos","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":62},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"replace_inner","args":[{"val":"#recenttweets_list","type":"str"},{"val":"","type":"str"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"clear_populate_blogs","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":79},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"append","args":[{"val":"#recenttweets_list","type":"str"},{"val":"div","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"datasource","predicate":"tweets","args":[{"val":"?a","type":"str"}],"type":"qualified"},"lhs":"tweets","type":"expr"},{"rhs":{"obj":{"val":"tweets","type":"var"},"args":[{"val":"$.[0]..text","type":"str"}],"name":"pick","type":"operator"},"lhs":"res","type":"expr"},{"rhs":{"obj":{"val":"tweets","type":"var"},"args":[{"val":"$.[0]..profile_image_url","type":"str"}],"name":"pick","type":"operator"},"lhs":"img","type":"expr"},{"rhs":{"obj":{"val":"tweets","type":"var"},"args":[{"val":"$.[0]..screen_name","type":"str"}],"name":"pick","type":"operator"},"lhs":"user","type":"expr"},{"rhs":{"obj":{"val":"consoleFeed","type":"var"},"args":[{"val":"$..items[0]","type":"str"}],"name":"pick","type":"operator"},"lhs":"rssFeed","type":"expr"},{"rhs":"<div style='margin:2px' align='center'>\n                        <a href=\"#{rssFeed.link}\" class=\"KOBJ_fb_console\" target=\"_blank\">#{rssFeed[\"y:title\"]}</a>\n                     </div>\n                ","lhs":"div","type":"here_doc"}],"name":"populate_blogs","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":84},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"replace_inner","args":[{"val":"#recentpromotions_list","type":"str"},{"val":"","type":"str"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"clear_populate_photos","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":101},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"append","args":[{"val":"#recentpromotions_list","type":"str"},{"val":"div","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":"<div style='margin:2px;' aligh='left'>\n                        <div style=\"margin: 7px 0px 0px 0px;\" align=\"left\">Like Breaking Rules? Then<a href=\"http:\\/\\/www.nightingale.com/accountpages/shoppingcart.aspx?add=25820cdd&promo=INTAF387A1/\" id=\"promo\" target=\"_blank\">âThe New Rules to Get Richâ</a> are for you! $1 gets you the entire video series. Spend $1 Now & break some rules!</div>\n                        <div style=\"margin: 10px 0px 0px 0px; font-weight: bold; font-size: 1.1em;\" align=\"center\">Call now to purchase!<br> 1 (800) 345-6789<br>or <a href=\"http:\\/\\/www.nightingale.com/accountpages/shoppingcart.aspx?add=25820cdd&promo=INTAF387A1/\" id=\"promo\" target=\"_blank\">Buy Online!</a></div>\n\t\t\t                     <div align=\"center\" style=\"margin: 15px 0 0 0;\"><a href=\"http:\\/\\/www.freedomfasttrack.com/\" target=\"blank\"><img src=\"http://www.mashworx.com/clients/freedom/FFT_BRAND-blue.png\" style=\"padding: 0px 0px; margin: 0px;\"><a href=\"http:\\/\\/www.mashworx.com/\" target=\"_blank\"><img src=\"http://www.mashworx.com/images/logo-mashworx-white-icon.png\" style=\"padding: 0 0 0 10px; margin: 0px;\"></a>\n\t\t\t</div>                        \n                     </div>\n                ","lhs":"div","type":"here_doc"}],"name":"populate_photos","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":106}],"meta_start_col":5,"meta":{"logging":"on","name":"Facebook Test","meta_start_line":2,"author":"Mark Mugleston","description":"FT ","meta_start_col":5},"dispatch_start_line":8,"global_start_col":5,"ruleset_name":"a659x2"}
