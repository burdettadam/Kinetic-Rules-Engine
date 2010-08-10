{"global":[],"dispatch":[{"domain":"www.google.com"}],"ruleset_name":"a41x66","rules":[{"blocktype":"every","emit":"\nvar isbn = $K(\"body\").search(/([-0-9xX ]{13}$)(?:[0-9]+[- ]){3}[0-9]*[xX0-9]$/);        function isValidISBN (isbn) {      isbn = isbn.replace(/[^\\dX]/gi, '');      if(isbn.length != 10){        return false;      }      var chars = isbn.split('');      if(chars[9].toUpperCase() == 'X'){        chars[9] = 10;      }      var sum = 0;      for (var i = 0; i < chars.length; i++) {        sum += ((10-i) * parseInt(chars[i]));      };      return ((sum % 11) == 0);    }                   ","name":"isbn","callbacks":null,"state":"inactive","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[],"name":"noop","modifiers":null}}]},{"blocktype":"every","emit":null,"pre":[{"rhs":" \n<iframe scrolling=\"no\" frameborder=\"0\" style=\"width: 990px; height: 256px;\" src=\"http://www.cedarfort.com/kahuga/carousel.jsp\" />  \t\n ","type":"here_doc","lhs":"carousel"}],"name":"carousel","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"^http://www.google.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"#body","type":"str"},{"val":"carousel","type":"var"}],"name":"after","modifiers":null}}]},{"blocktype":"every","emit":"\nvar count = 0;  function cedarFortAnnotate(obj){  \t  \tif($K(obj).data(\"domain\") == \"www.shatteredsilencebook.com\"){  \t\tcount++;  \t\treturn '<div id=\"cedarFort'+count+'\"><a href=\"http://cedarfort.com/#{selector%3A%22.ldsba-body%22%2Cmodule%3A%22/ldsba/productDetail.module%22%2Cparameters%3A{product%3A%2220067762%22}}\"><img src=\"http://cedarfort.com/67_214_247_219/ldsba/store/LogoCedarFort.png\" /><\/a><\/div>';    \t}    }              ","name":"annotation","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"www.google.com|www.bing.com|search.yahoo.com","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"cedarFortAnnotate","type":"var"}],"name":"annotate_search_results","modifiers":null}}]}],"meta":{"name":"Cedar Fort","logging":"off"}}
