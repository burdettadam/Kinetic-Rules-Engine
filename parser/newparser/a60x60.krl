{"global":[],"dispatch":[{"domain":"facebook.com"}],"ruleset_name":"a60x60","rules":[{"blocktype":"every","emit":"\nfunction zap() {      try {        $K(\"#pagelet_ads\").replaceWith(\"<div id='sidebar_ads'><\/div>\");      } catch(e) {}      try {        $K(\"#pagelet_adbox\").replaceWith(\"<div id='sidebar_ads'><\/div>\");      } catch(e) {}      try {        $K(\"#sidebar_ads\").replaceWith(\"<div id='sidebar_ads'><\/div>\");      } catch(e) {}        KOBJ.log(\"....... zap!\");    }         function sweeper() {      setTimeout(\"zap()\",4000);      KOBJ.log(\"..... sweeper\");    }         function pageChange() {      zap();      sweeper();      KOBJ.log(\"...... pageChange\");    }          KOBJ.watchDOM(\"#content\",pageChange);    KOBJ.watchDOM(\"#menubar_container\",pageChange);    KOBJ.watchDOM(\"#pagefooter\",pageChange);    KOBJ.watchDOM(\"#pagelet_presence\",pageChange);          zap();    sweeper();                  ","name":"ad_stripper","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[],"name":"noop","modifiers":null}}]}],"meta":{"author":"Mike Grace","description":"\nGetting rid of those annoying ads     \n","name":"Cleaner Facebook","logging":"on"}}