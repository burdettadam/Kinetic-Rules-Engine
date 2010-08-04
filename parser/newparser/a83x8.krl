{
   "dispatch": [{"domain": "cu1.org"}],
   "global": [{"emit": "\nvar debug = false;        myalert = function(msg){if(debug){alert(msg);}};         loadScript = function(url, callback)    {            var head = document.getElementsByTagName(\"head\")[0];            var script = document.createElement(\"script\");            script.src = url;                          var done = false;            script.onload = script.onreadystatechange = function()            {                    if( !done && ( !this.readyState                                             || this.readyState == \"loaded\"                                             || this.readyState == \"complete\") )                    {                            done = true;                                                          callback();                                                          script.onload = script.onreadystatechange = null;                            head.removeChild( script );                    }            };                head.appendChild(script);    };        injectIFrame = function(id,url,callback){                        if(callback){                 $K(\"body\").append('<div id=\"'+id+'\" style=\"display:none;\"><iframe width=\"100%\" height=\"500%\"  src=\"'+url+'\" onload=\"'+callback+'()\"><\/div>');            }else{                 var divtag = '<div id=\"'+id+'\" style=\"display:none;\"><iframe src=\"'+url+'\" width=\"100%\" height=\"500%\"><\/div>';                                $K(\"body\").append(divtag);                             }    };                "}],
   "meta": {
      "logging": "off",
      "name": "DemoOnCU1"
   },
   "rules": [
      {
         "actions": [{"action": {
            "args": [],
            "modifiers": null,
            "name": "noop",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": "\nstart_kulamula= function(){                    $K(self.main.document, \"form:eq(2) #BoldText:first\").html();     if($K('title').html().indexOf('Bill Pay Center')!=-1){          var docHeight=Micronotes.Util.documentHeight();      \tvar docWidth=Micronotes.Util.documentWidth();           if($K(\"#questionbox\").val() != \"keywords\"){          $K(\"#questionbox\").val(\"keywords\");               \tvar src = 'https:\\/\\/www.micronotes.info/AlphaPages/welcome.aspx#'+encodeURIComponent(document.location.href);     \tMicronotes.Util.injectIFrame(\"KulamulaDialog\",src);       \t$('#KulamulaDialog').dialog({  \t\t\t\twidth:docWidth,  \t\theight:2*docHeight,                  position:['top','left']                 });          $(\".ui-icon-closethick\").remove();           }      \t$.receiveMessage(function(e) {                                                   if(e.data=='close'){                                            $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      $('#KulamulaDialog').dialog( 'destroy' );                     $('#KulamulaDialog').remove();                      $('#brand_picker').dialog( 'destroy' );                      $('#brand_picker').remove();                  }else if(e.data=='invite'){                     $('#KulamulaDialog').dialog( 'destroy' );                     $('#KulamulaDialog').remove();  \t\t   var accountPageUrl=$K(\".primaryNavCnt a:first\").attr(\"href\");                                        accountPageUrl= accountPageUrl +\"#\"+ encodeURIComponent(document.location.href);                      document.body.style.cursor = 'wait';         \t           Micronotes.Util.injectIFrame('AccountsPage',accountPageUrl);                  }else{                                                              $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      var brandPickerUrl = \"https://www.micronotes.info/AlphaPages/brandpicker.aspx?\"                                           +e.data+\"#\"+encodeURIComponent(document.location.href);                                                                Micronotes.Util.injectIFrame('brand_picker',brandPickerUrl);                      $('#brand_picker').dialog({  \t\t\tmodal:true,  \t\t\twidth:docWidth,  \t\t\theight:2*docHeight,  \t                position:['top','left']  \t               });                      document.body.style.cursor = 'default';                      $(\".ui-icon-closethick\").remove();                  }              });          };        };     if((window.location == window.parent.location)) {      Micronotes.Util.loadScript(\"http://code.jquery.com/jquery-latest.js\", function()    {          Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\", function()    {            Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\", function()    {         Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\", function()    {               start_kulamula();    });      });        });      });  }                    ",
         "foreach": [],
         "name": "newrule",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "https://connect2.cu1.org/scripts/ibank.dll",
            "type": "prim_event",
            "vars": []
         }},
         "state": "inactive"
      },
      {
         "actions": [{"action": {
            "args": [],
            "modifiers": null,
            "name": "noop",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": "\nvar AccId;  setVisitFlag = function(flag){      $.cookie(\"IsBackFromConfirm\",flag, { path: '/', expires: 1 });  };  recognizePayConfirm = function(){     var el = $K(\"form:first input:eq(2)\", $K(document, parent.main.document));     if(el != undefined && el != null){     var idtxt = el.val();     myalert(\"idtxt: \"+idtxt);     if(idtxt.indexOf('Confirm Payee')!=-1){        return true;     }else {return false;}     }else {       return false;     }  };  bindActionOnOK = function(){    $K(\"form:first .Button:first\", top.main.document).click(function(){            setVisitFlag('yes');            return true;       });  };  IsBackFromConfirm = function(){      var flag = $.cookie(\"IsBackFromConfirm\");      return (flag == 'yes');  };    recognizeBillPay = function(specificAccount){    var el = $K(\"form:eq(1) .BoldText:first\", parent.main.document);    if(el == undefined || el == null) { return false; }    var idtxt = el.html();    AccId = $K(\"form:eq(1) .Text:first\", top.main.document).html().substring(0,6);    myalert(\"idtxt: \" + idtxt + \"| AccId\" + AccId);     if(idtxt.indexOf('Bill Payment')!=-1){      if(specificAccount == null) {return true;}      else{       if(AccId.indexOf(specificAccount)!=-1) {return true;}       else {return false;}      }    }else{      return false;    }  };    dialog_start = function(){  var src = 'https:\\/\\/www.micronotes.info/AlphaPages/welcome.aspx?name='+AccId+'#'+encodeURIComponent(document.location.href);          injectIFrame(\"KulamulaDialog\",src);       \t$('#KulamulaDialog').dialog({  \t\tmodal:true,  \t\twidth:$K(window).width(),  \t\theight:2*$K(document).height(),                  position:['top','left']                 });           $(\".ui-icon-closethick\").remove();                \t$.receiveMessage(function(e) {                               if(e.data=='close'){                      $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      var tempobj = $('#KulamulaDialog');                      if(tempobj){tempobj.dialog('destroy');$('#KulamulaDialog').remove();}                      tempobj=$('#brand_picker');                      if(tempobj){tempobj.dialog('destroy'); $('#brand_picker').remove();}                  }else if(e.data=='invite'){                     $('#KulamulaDialog').dialog( 'destroy' );                     $('#KulamulaDialog').remove();  \t\t   var brandPickerUrl = \"https://www.micronotes.info/AlphaPages/brandpicker.aspx?cu1id=\"+AccId+\"#\"+encodeURIComponent(document.location.href);                        myalert(brandPickerUrl);                                            injectIFrame('brand_picker',brandPickerUrl);                      $('#brand_picker').dialog({  \t\t\tmodal:true,  \t\t\twidth:$K(window).width(),   \t\t\theight:2*$K(document).height(),  \t                position:['top','left']  \t               });                      $(\".ui-icon-closethick\").remove();                  };              });     };               loadScript(\"http://code.jquery.com/jquery-latest.js\", function()    {          loadScript(\"https://www.micronotes.info/AlphaPages/script/JqueryCookies.js\", function()    {          if(recognizePayConfirm()){            bindActionOnOK();          }          else {           if(recognizeBillPay(\"33333\") && IsBackFromConfirm() ){          loadScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\",                                                      function()    {          loadScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\", function()    {          loadScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\", function()    {         myalert(\"kynetx invoked in bill pay\");         dialog_start();         setVisitFlag('no');    });    });    });      };};    });      });                          ",
         "foreach": [],
         "name": "paybillment",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "/scripts/ibank.dll",
            "type": "prim_event",
            "vars": []
         }},
         "state": "active"
      }
   ],
   "ruleset_name": "a83x8"
}
