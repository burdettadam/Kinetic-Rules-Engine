{"global":[],"dispatch":[{"domain":"google.com"},{"domain":"yahoo.com"},{"domain":"bing.com"},{"domain":"kynetximpactspring2010.eventbrite.com"}],"ruleset_name":"a60x44","rules":[{"blocktype":"every","emit":"\nfunction my_select(obj) {      var ftext = $K(obj).text();      if (ftext.match(/kynetx.com/)) {        return \"<img class='devexrocks' src='http://kynetx.michaelgrace.org/kynetx_app/devex.png' />\";      } else {        false;      }    }          ","name":"search_annotate","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"my_select","type":"var"}],"name":"annotate_search_results","modifiers":null}}]},{"blocktype":"every","emit":"\nif($K(\"input[name='cost_8837003']\").val() == \"150.00\") {      $K(\"#discountDiv input[type='text']\").val(\"Earlybirdspring2010\");      applyDiscount('None');    }          ","name":"spring_impact_discount_autofill","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"http://kynetximpactspring2010.eventbrite.com/","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"<h1>Congratulations!<\/h1>","type":"str"},{"val":"<h3>Thanks for being a fan of Kynetx!<\/h3><p>Your discount code for $51 off has been entered. You may continue your order.<\/p>","type":"str"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}}]}}]}],"meta":{"author":"MikeGrace","description":"\nKeeping you updated and connected to Kynetx with news alerts, games, contests, and more.      Currently annotates search results for questions asked on our developers exchange site.     \n","name":"Kynetx Fan","logging":"on"}}
