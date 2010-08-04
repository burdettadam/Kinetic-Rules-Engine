{"global":[{"source":"http://api.flickr.com/services/feeds/groups_pool.gne?id=1404010@N21&format=xml","name":"flickr_data","type":"dataset","datatype":"JSON","cachable":{"period":"minutes","value":"1"}},{"source":"http://pipes.yahoo.com/pipes/pipe.run?_id=3dea49be35557fa8043a40170d20439c&_render=json","name":"imgInfo","type":"dataset","datatype":"JSON","cachable":{"period":"minutes","value":"60"}}],"global_start_line":16,"dispatch":[{"domain":"google.com","ruleset_id":null},{"domain":"yahoo.com","ruleset_id":null},{"domain":"bing.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"sidetab","args":[],"modifiers":[{"value":{"val":"msg","type":"var"},"name":"message"},{"value":{"val":"","type":"str"},"name":"tabColor"},{"value":{"val":"0px","type":"str"},"name":"topPos"},{"value":{"val":"http://www.7bound.com/impact2010/images/dishImages/tabImpact2010.png","type":"str"},"name":"pathToTabImage"},{"value":{"val":"225px","type":"str"},"name":"imageHeight"},{"value":{"val":"48px","type":"str"},"name":"imageWidth"},{"value":{"val":"chrisArea","type":"str"},"name":"contentClass"},{"value":{"val":"300px","type":"str"},"name":"width"},{"value":{"val":"white","type":"str"},"name":"backgroundColor"},{"value":{"val":"setDivs","type":"var"},"name":"callback"},{"value":{"val":"650px","type":"str"},"name":"height"}]},"label":null}],"post":null,"pre":[{"rhs":"<script type=\"text/javascript\">\nfunction setDivs()\n{\n$K(\"#chrisArea\").css(\"height\",\"620px\");\n$K(\"#chrisArea\").parent(\"div\").css(\"height\",\"625px\");\n$K(\"#chrisArea\").parent(\"div\").css(\"z-index\",\"99999\");\n}\n</script>\n\t","lhs":"setDivs","type":"here_doc"},{"rhs":"<div id = \"chrisArea\"  style= \"height:700px; border:7px black solid; -moz-border-radius-bottomleft:6px; -moz-border-radius-bottomright:6px;\">        \n\n  <iframe id=\"ifaccordian\" src=\"http://www.7bound.com/impact2010/slideDish/PHPTest1.php\" scrolling=\"no\" frameborder = \"0\" style=\"height:520px; width:288px;\"></iframe>\n\n<div align=\"center\">\n\n<a href=\"http://www.acxiom.com\" target=\"_blank\"><img src=\"http://www.7bound.com/impact2010/slideDish/images/acxiom.png\" border=\"0\"></a>\n\n  <a href=\"http://www.baconsalt.com\" target=\"_blank\"><img src=\"http://www.7bound.com/impact2010/slideDish/images/baconsalt.png\" border=\"0\"></a>\n\n  <a href=\"http://www.7bound.com\" target=\"_blank\"><img src=\"http://www.7bound.com/impact2010/slideDish/images/7bound.png\" border=\"0\"><br/>\n\n<a href=\"http://www.venafi.com\" target=\"_blank\"><img src=\"http://www.7bound.com/impact2010/slideDish/images/venafi.png\" border=\"0\"></a>\n\n<a href=\"http://www.spectrumdna.com\" target=\"_blank\"><img src=\"http://www.7bound.com/impact2010/slideDish/images/spectrum.png\" border=\"0\"></a>\n</div>\n\n<div style=\"float:right; clear:both; color:#999999; padding-right:5px; padding-top:5px; font-size:10px; font-family:Trebuchet MS,sans-serif;\">\nSlideDish&trade; Copyright &copy; 2010 <a href=\"http://www.7bound.com\">7bound, LLC</a></div>\n\n</div>        \n \n ","lhs":"msg","type":"here_doc"}],"name":"rule1","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"domain":null,"pattern":"7bound.com/slidedish","type":"prim_event","vars":null,"op":"pageview"},"foreach":[]},"start_line":20},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"append","args":[{"val":".HoldPhotos>p","type":"str"},{"val":"btn","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":"<br /><img class=\"like\" align=\"left\" style=\"cursor:pointer; padding-left:12px;\" src = \"http://www.7bound.com/impact2010/slideDish/images/thumbsUp2.png\"/>  \n ","lhs":"btn","type":"here_doc"}],"name":"flickr_vote","start_col":5,"emit":"$K('.like').live('click', function() {\n\tvar imgSrc = $K(this).parent().find('.pc_img').attr('src'); // place holder func, obvioiusly you'd do different stuff here\n\t$K.getJSON(\"http://www.7bound.com/impact2010/slideDish/vote.php?item=\"+imgSrc,function(){alert(\"Vote submitted!\");});\n\t}\n);\n        ","state":"inactive","callbacks":null,"pagetype":{"event_expr":{"pattern":"^http://www.flickr.com/groups/1404010@N21/pool/","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":74},{"cond":{"source":"time","predicate":"time_between","args":[{"val":"startH","type":"var"},{"val":"startM","type":"var"},{"val":"endH","type":"var"},{"val":"endM","type":"var"}],"type":"qualified"},"blocktype":"every","actions":[{"action":{"source":null,"name":"replace_image_src","args":[{"val":"#logo","type":"str"},{"val":"imgUrl","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":[{"rhs":{"obj":{"val":"imgInfo","type":"var"},"args":[{"val":"$..startH","type":"str"}],"name":"pick","type":"operator"},"lhs":"startH","type":"expr"},{"rhs":{"obj":{"val":"imgInfo","type":"var"},"args":[{"val":"$..startM","type":"str"}],"name":"pick","type":"operator"},"lhs":"startM","type":"expr"},{"rhs":{"obj":{"val":"imgInfo","type":"var"},"args":[{"val":"$..endH","type":"str"}],"name":"pick","type":"operator"},"lhs":"endH","type":"expr"},{"rhs":{"obj":{"val":"imgInfo","type":"var"},"args":[{"val":"$..endM","type":"str"}],"name":"pick","type":"operator"},"lhs":"endM","type":"expr"},{"rhs":{"obj":{"val":"imgInfo","type":"var"},"args":[{"val":"$..imgUrl","type":"str"}],"name":"pick","type":"operator"},"lhs":"imgUrl","type":"expr"}],"name":"imgswap","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"google.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[{"expr":{"obj":{"val":"imgInfo","type":"var"},"args":[{"val":"$.value.items","type":"str"}],"name":"pick","type":"operator"},"var":["imgInfo"]}]},"start_line":91},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"annotate_search_results","args":[{"val":"my_select","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"kfan_annotate","start_col":5,"emit":"function my_select(obj) {        var ftext = $K(obj).text();        if (ftext.match(/kynetx.com/gi)) {          return \"<span><a target='_blank' href='http:\\/\\/www.kynetx.com' border='0'><img border='0' class='welovekynetx' src='http:\\/\\/7bound.com/impact2010/images/kyntexfan.jpg' /></a></span>\";        } else {          false;        }      }            ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"google.com|bing.com|search.yahoo.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":107},{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"percolate","args":[{"val":"findDevex","type":"var"}],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"kfan_percolate","start_col":5,"emit":"function findDevex(obj){           return $K(obj).data(\"domain\").match(/devex.kynetx.com/gi);        }              ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"google.com|search.yahoo.com|bing.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":114}],"meta_start_col":5,"meta":{"logging":"off","name":"SlideDish - Impact","meta_start_line":2,"author":"Chris","description":"Copyright (c) 2010 7bound, LLC All Rights Reserved   \n\n","meta_start_col":5},"dispatch_start_line":11,"global_start_col":5,"ruleset_name":"a55x19"}
