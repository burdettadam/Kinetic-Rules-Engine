{"global":[{"source":"http://pipes.yahoo.com/pipes/pipe.run?_id=ac275506c188c0ae69a33899b6941a88&_render=json","name":"consoleFeed","type":"dataset","datatype":"JSON","cachable":{"period":"seconds","value":"1"}},{"source":"http://kynetxtweets:fizzbazz@twitter.com/statuses/user_timeline/bharward.json","name":"tweets","type":"datasource","datatype":"JSON","cachable":{"period":"seconds","value":"1"}}],"global_start_line":12,"dispatch":[{"domain":"facebook.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"prepend","args":[{"val":"#home_sidebar","type":"str"},{"val":"message","type":"var"}],"modifiers":null,"vars":null},"label":null}],"post":null,"pre":[{"rhs":{"source":"datasource","predicate":"tweets","args":[{"val":"?a","type":"str"}],"type":"qualified"},"lhs":"tweets","type":"expr"},{"rhs":{"obj":{"val":"tweets","type":"var"},"args":[{"val":"$.[0]..text","type":"str"}],"name":"pick","type":"operator"},"lhs":"res","type":"expr"},{"rhs":{"obj":{"val":"tweets","type":"var"},"args":[{"val":"$.[0]..profile_image_url","type":"str"}],"name":"pick","type":"operator"},"lhs":"img","type":"expr"},{"rhs":{"obj":{"val":"tweets","type":"var"},"args":[{"val":"$.[0]..screen_name","type":"str"}],"name":"pick","type":"operator"},"lhs":"user","type":"expr"},{"rhs":{"obj":{"val":"consoleFeed","type":"var"},"args":[{"val":"$..items[0]","type":"str"}],"name":"pick","type":"operator"},"lhs":"rssFeed","type":"expr"},{"rhs":"<div id=\"KOBJ_FaceBook\" style=\"margin-bottom: 15px;\">    \t\t<div class=\"UIHomeBox UITitledBox\" id=\"FB_consoleVideo\" style=\"text-align: center;\">  \t\t\t<div class=\"UITitledBox_Top\">  \t\t\t\t<div class=\"UITitledBox_TitleBar\">  \t\t\t\t\t<span class=\"UITitle UITitle_h5\">  \t\t\t\t\t\tInspire  \t\t\t\t\t</span>  \t\t\t\t</div>  <div style=\"float:right; font-size:9px; font-family:lucida grande,tahoma,verdana,arial,sans-serif;\"><a href=\"http://www.youtube.com\" target=\"_blank\">See All</a></div>  \t\t\t</div>  \t\t\t<div class=\"UITitledBox_Content KOBJ_fb_console\">  \t\t\t\t<object width=\"230\" height=\"160\"><param name=\"movie\" value=\"http://www.youtube.com/v/arD374MFk4w&hl=en&fs=1&\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/arD374MFk4w&hl=en&fs=1&\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"230\" height=\"160\"></embed></object>  \t\t\t</div>  \t\t</div>  \t  \t  \t</div>     \n ","lhs":"message","type":"here_doc"}],"name":"video","start_col":5,"emit":null,"state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"www.facebook.com/home.php","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":16}],"meta_start_col":5,"meta":{"logging":"off","name":"FacePlant (Inspire)","meta_start_line":2,"description":"YouTube Video    \n","meta_start_col":5},"dispatch_start_line":9,"global_start_col":5,"ruleset_name":"a23x13"}
