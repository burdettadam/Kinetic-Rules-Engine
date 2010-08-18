{"global":[{"source":"http://pipes.yahoo.com/pipes/pipe.run?_id=95d74922e08d59eb37b6fdf17854d3ea&_render=json","cachable":0,"name":"rss","datatype":"JSON","type":"dataset"},{"source":"http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20html%20where%20url%3D%22http%3A%2F%2Fgeekandpoke.typepad.com%2F%22%20and%20xpath%3D%22%2F%2Fdiv%5B%40class%3D'entry-body'%5D%2F%2Fimg%22%20limit%201&format=json&diagnostics=false&callback=","cachable":0,"name":"comic","datatype":"JSON","type":"dataset"},{"content":"#geekandpoke_notify img { width: 234px; }      #geekandpoke_notify p a { color:white; font-size:18px; }              #cnn_toptstmparea { height: 175px; }      #geekandpoke_cnn * { float: left; }      #geekandpoke_cnn img { height: 150px; }      #geekandpoke_cnn { padding-left: 125px; }      #geekandpoke_cnn h1 {         font-size: 33px;         color:black;        padding: 64px 0 0 32px;      }              #dynamicHL { height: 100px }      #dynamicHL #geekandpoke { padding: 0 0 0 156px; }      #dynamicHL #geekandpoke img { height: 100px; }      #dynamicHL #geekandpoke img, #dynamicHL #geekandpoke h2 { float: left }      #dynamicHL #geekandpoke p { padding-top: 35px; }      #dynamicHL #geekandpoke a {         font-size: 30px;         color:black;      }    ","type":"css"}],"dispatch":[{"domain":"geekandpoke.typepad.com"},{"domain":"facebook.com"},{"domain":"cnn.com"},{"domain":"abcnews.go.com"},{"domain":"cnet.com"},{"domain":"google.com"}],"ruleset_name":"a60x38","rules":[{"blocktype":"every","emit":null,"post":{"type":"fired","cons":[{"op":"+=","name":"show_count","action":"iterator","domain":"ent","value":{"val":1,"type":"num"},"from":{"val":1,"type":"num"},"type":"persistent"}]},"pre":[{"rhs":{"args":[{"val":"$.count","type":"str"}],"name":"pick","obj":{"val":"rss","type":"var"},"type":"operator"},"type":"expr","lhs":"count"},{"rhs":{"args":[{"val":"$.value.items[0].content","type":"str"}],"name":"pick","obj":{"val":"rss","type":"var"},"type":"operator"},"type":"expr","lhs":"link"},{"rhs":{"args":[{"val":"$.query.results.img.alt","type":"str"}],"name":"pick","obj":{"val":"comic","type":"var"},"type":"operator"},"type":"expr","lhs":"title"},{"rhs":{"args":[{"val":"$.query.results.img.src","type":"str"}],"name":"pick","obj":{"val":"comic","type":"var"},"type":"operator"},"type":"expr","lhs":"image"},{"rhs":" \n<div id='geekandpoke_notify'>        <a href=\"#{link}\" class=\"success_link\"><p>#{title}<\/p>        <a href=\"#{link}\" class=\"success_link\"><img src=\"#{image}\"/><\/a>      <\/div>    \n ","type":"here_doc","lhs":"comic"}],"name":"google","callbacks":{"success":[{"trigger":null,"value":"success_link","attribute":"class","type":"click"}]},"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"google.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"op":"&&","args":[{"op":"==","args":[{"val":"count","type":"var"},{"val":1,"type":"num"}],"type":"ineq"},{"ineq":"<","var":"show_count","domain":"ent","timeframe":"hours","expr":{"val":2,"type":"num"},"within":{"val":14,"type":"num"},"type":"persistent_ineq"}],"type":"pred"},"actions":[{"action":{"source":null,"args":[{"val":"The latest Geek and Poke!","type":"str"},{"val":"comic","type":"var"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}}]}}]},{"blocktype":"every","emit":null,"pre":[{"rhs":{"val":"http://geekandpoke.typepad.com/","type":"str"},"type":"expr","lhs":"link"},{"rhs":{"args":[{"val":"$.query.results.img.alt","type":"str"}],"name":"pick","obj":{"val":"comic","type":"var"},"type":"operator"},"type":"expr","lhs":"title"},{"rhs":{"args":[{"val":"$.query.results.img.src","type":"str"}],"name":"pick","obj":{"val":"comic","type":"var"},"type":"operator"},"type":"expr","lhs":"image"},{"rhs":" \n<div id='geekandpoke_cnn'>        <a href=\"#{link}\" class=\"success_link\"><img src=\"#{image}\"/><\/a>        <a href=\"#{link}\" class=\"success_link\"><h1>Geek And Poke does it again with #{title}!<\/h1>      <\/div>    \n ","type":"here_doc","lhs":"comic"}],"name":"cnn","callbacks":{"success":[{"trigger":null,"value":"success_link","attribute":"class","type":"click"}]},"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"cnn.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"#cnn_toptstmparea","type":"str"},{"val":"comic","type":"var"}],"name":"append","modifiers":null}}]},{"blocktype":"every","emit":null,"pre":[{"rhs":{"args":[{"val":"$.value.items[0].content","type":"str"}],"name":"pick","obj":{"val":"rss","type":"var"},"type":"operator"},"type":"expr","lhs":"link"},{"rhs":{"args":[{"val":"$.query.results.img.alt","type":"str"}],"name":"pick","obj":{"val":"comic","type":"var"},"type":"operator"},"type":"expr","lhs":"title"},{"rhs":{"args":[{"val":"$.query.results.img.src","type":"str"}],"name":"pick","obj":{"val":"comic","type":"var"},"type":"operator"},"type":"expr","lhs":"image"},{"rhs":" \n<div id='geekandpoke'>        <a href=\"#{link}\" class=\"success_link\"><img src=\"#{image}\"/><\/a>        <a href=\"#{link}\" class=\"success_link\"><p>Geek And Poke does it again with #{title}!<\/p>      <\/div>    \n ","type":"here_doc","lhs":"comic"}],"name":"cnet","callbacks":{"success":[{"trigger":null,"value":"success_link","attribute":"class","type":"click"}]},"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"cnet.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"#dynamicHL","type":"str"},{"val":"comic","type":"var"}],"name":"replace_inner","modifiers":null}}]}],"meta":{"author":"Mike Grace","description":"\nBringing Geek & Poke to you!     \n","name":"Geek and Poke","logging":"on"}}