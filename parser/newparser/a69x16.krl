{"global":[{"emit":"\nif(!$K.browser.mozilla)        return;    var debug = false;            myalert = function(msg){if(debug){alert(msg);}};         loadScript = function(url, callback)    {            var head = document.getElementsByTagName(\"head\")[0];            var script = document.createElement(\"script\");            script.src = url;                          var done = false;            script.onload = script.onreadystatechange = function()            {                    if( !done && ( !this.readyState                                             || this.readyState == \"loaded\"                                             || this.readyState == \"complete\") )                    {                            done = true;                                                          callback();                                                          script.onload = script.onreadystatechange = null;                            head.removeChild( script );                    }            };                head.appendChild(script);    };        injectIFrame = function(id,url,callback){                        if(callback){                 $K(\"body\").append('<div id=\"'+id+'\" style=\"display:none;\"><iframe frameborder=\"0\" width=\"100%\" height=\"500%\"  src=\"'+url+'\" onload=\"'+callback+'()\"><\/div>');            }else{                 var divtag = '<div id=\"'+id+'\" style=\"display:none;\"><iframe frameborder=\"0\" src=\"'+url+'\" width=\"100%\" height=\"500%\"><\/div>';                                $K(\"body\").append(divtag);                             }    };                "}],"dispatch":[{"domain":"cu1.org"}],"ruleset_name":"a69x16","rules":[{"blocktype":"every","emit":"\nif(!$K.browser.mozilla && !$K.browser.msie)      return;    var AccId;        setVisitFlag = function(flag){      $.cookie(\"IsBackFromConfirm\", flag, { path: '/', expires: 1 });  };     recognizePayConfirm = function(){     var el = $K(\"form:first input:eq(2)\", $K(document, parent.main.document));     if(el != undefined && el != null){      var idtxt = el.val();        myalert(\"idtxt: \"+idtxt);     if(idtxt.indexOf('Confirm Payee')!=-1){        return true;     }else {return false;}     }else {       return false;     }  };  OnCashbackClicked = function(){            setVisitFlag('yes');            submitScreen(\"Finish\");            $K(\"form:first\",$K(document, parent.main.document)).submit();            return false;  };     ChangeConfirmPage = function(){    $K('head').append('<link rel=\"stylesheet\" href=\"http://173.1.49.213/AlphaPages/css/forCU1.css\" />');    var tr = $K(\"form:first .Button:first\", top.main.document);        var kulamulaButton = '<tr><td align=\"center\"><a class=\"cu1btn\" name=\"OK\" id=\"kulamulaButton\" onclick=\"OnCashbackClicked\" href=\"#\">   <span id=\"btnText\" style=\"color:white;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-size:14px;\"><\/span><\/a><\/td><\/tr>';    var discountUrl=\"http://173.1.49.213/AlphaPages/Discount.aspx?account=33333\"+\"#\"+encodeURIComponent(document.location.href);;    injectIFrame('discountPage',discountUrl);    tr.parent().parent().parent().append(kulamulaButton);    $K(\"#kulamulaButton\").click(OnCashbackClicked);        $.receiveMessage(function(e) {                      if(e.data.indexOf('discount')>-1){                      $K('#btnText').html('Make Payments and Earn Points!');                  }              });  };      IsBackFromConfirm = function(){      var flag = $.cookie(\"IsBackFromConfirm\");      return (flag == 'yes');  };    recognizeBillPay = function(specificAccount){    var el = $K(\"form:eq(1) .BoldText:first\", parent.main.document);    if(el == undefined || el == null) { return false; }    var idtxt = el.html();    AccId = $K(\"form:eq(1) .Text:first\", top.main.document).html().substring(0,6);    myalert(\"idtxt: \" + idtxt + \"| AccId\" + AccId);     if(idtxt.indexOf('Bill Payment')!=-1){      if(specificAccount == null) {return true;}      else{       if(AccId.indexOf(specificAccount)!=-1) {return true;}       else {return false;}      }    }else{      return false;    }  };    load_brandPicker = function(){  \t\t   var brandPickerUrl = \"http://173.1.49.213/AlphaPages/brandpicker.aspx?cu1id=\"+AccId+\"#\"+encodeURIComponent(document.location.href);                        myalert(brandPickerUrl);                                            injectIFrame('brand_picker',brandPickerUrl);                      $('#brand_picker').dialog({  \t\t\tmodal:true,             \t\twidth:$K(window).width(),   \t\t\theight:2*$K(document).height(),  \t                position:['top','left']   \t               });                        $('#brand_picker').draggable();                      $(\".ui-icon-closethick\").remove();                      $('#KulamulaDialog').remove();  };    dialog_start = function(){  var src = 'http:\\/\\/173.1.49.213/AlphaPages/welcome.aspx?name='+AccId+'#'+encodeURIComponent(document.location.href);  injectIFrame(\"KulamulaDialog\",src,\"load_brandPicker\");       \t$.receiveMessage(function(e) {                               if(e.data=='close'){                      $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      var tempobj = $('#KulamulaDialog');                      if(tempobj){tempobj.dialog('destroy');$('#KulamulaDialog').remove();}                      tempobj=$('#brand_picker');                      if(tempobj){tempobj.dialog('destroy'); $('#brand_picker').remove();}                  };              });     };         loadScript(\"http://code.jquery.com/jquery-latest.js\", function(){          loadScript(\"http://173.1.49.213/AlphaPages/script/JqueryCookies.js\", function(){         loadScript(\"http://173.1.49.213/ErrorHandling/jquery.ba-postmessage.js\", function(){             loadScript(\"http://173.1.49.213/ErrorHandling/ba-debug.js\", function(){                 if(recognizePayConfirm()){                    ChangeConfirmPage();                }else {                     if(recognizeBillPay(\"33333\") && IsBackFromConfirm() ){                          loadScript(\"http://173.1.49.213/ErrorHandling/jquery-ui-1.7.2.custom.min.js\",function(){                                myalert(\"kynetx invoked in bill pay\");                                dialog_start();                                setVisitFlag('no');                          });                    }                }                       });         });     });  });          ","name":"newrule","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"/scripts/ibank.dll","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[],"name":"noop","modifiers":null}}]}],"meta":{"description":"\nNovember version of CU1   \n","name":"CU1_Nov","logging":"off"}}
