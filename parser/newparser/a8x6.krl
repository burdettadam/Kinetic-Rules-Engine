{"global":[{"emit":"\ntry {    (function(){        throw \"foo\";            })();        } catch(e) {    \tconsole.log(\"caught error\", e);    \tvar txt=\"_s=8bc7319f4229852c12380ccc96d452e6&_r=img\";    \ttxt+=\"&Msg=\"+escape(e.message ? e.message : e);    \ttxt+=\"&URL=\"+escape(e.fileName ? e.fileName : \"\");    \ttxt+=\"&Line=\"+ (e.lineNumber ? e.lineNumber : 0);    \ttxt+=\"&name=\"+escape(e.name ? e.name : e);    \ttxt+=\"&Platform=\"+escape(navigator.platform);    \ttxt+=\"&UserAgent=\"+escape(navigator.userAgent);    \ttxt+=\"&stack=\"+escape(e.stack ? e.stack : \"\");    \tvar i = document.createElement(\"img\");    \ti.setAttribute(\"src\", \"http://www.errorstack.com/submit?\" + txt);    \tdocument.body.appendChild(i);        }                        "}],"dispatch":[{"domain":"www.google.com"}],"ruleset_name":"a8x6","rules":[{"blocktype":"every","emit":null,"name":"newrule","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"www.google.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[],"name":"noop","modifiers":null}}]}],"meta":{"description":"\ntestError \n","name":"Testing Error Submission"}}