{"global":[{"emit":"Micronotes = {};     Micronotes.Modes = {        DEBUG: 0,        RELEASE: 1    };        Micronotes.Util = {        mode: Micronotes.Modes.DEBUG,        timeBegin:new Date(),        remote:null,        init: function(){           $K.getScript(\"http://www.micronotes.info/ErrorHandling/jquery-1.3.2.min.js\");            $K.getScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\");            $K.getScript(\"http://www.micronotes.info/ErrorHandling/json2.js\");           $K.getScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\");           $K.getScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\");        },    loadScript: function(url, callback)    {            var head = document.getElementsByTagName(\"head\")[0];            var script = document.createElement(\"script\");            script.src = url;                          var done = false;            script.onload = script.onreadystatechange = function()            {                    if( !done && ( !this.readyState                                             || this.readyState == \"loaded\"                                             || this.readyState == \"complete\") )                    {                            done = true;                                                          callback();                                                          script.onload = script.onreadystatechange = null;                            head.removeChild( script );                    }            };                head.appendChild(script);    },            log: function(id, obj) {            if (this.mode == Micronotes.Modes.DEBUG) {                var myConsole = console ? console : window.console ? window.console : null;                if (myConsole) {                    console.log(\"%s: %o\", id, obj);                }            }        },        trim:function(msg){            return msg.replace(/^\\s+|\\s+$/g,\"\");        },        injectIFrame:function(id,url,callback){                        if(callback){                 $K(\"body\").append('<div id=\"'+id+'\" style=\"display:block;\"><iframe width=\"100%\" height=\"500%\"  src=\"'+url+'\" onload=\"'+callback+'()\"></div>');            }else{                                  $K(\"body\").append('<div id=\"'+id+'\" style=\"display:block;\"><iframe src=\"'+url+'\" width=\"100%\" height=\"500%\"></div>');                 alert(\"inserted iframe:\" + id);            }        },        pageWidth:function() {            return $K(window).width();        },        pageHeight:function() {            return $K(window).height();        },        documentHeight: function() {            return $K(document).height();        },        documentWidth:function(){            return $K(document).width();        }    };                  jQuery.fn.log = function(msg) {        Micronotes.Util.log(\"%s: %o\", msg,this);        return this;    };    jQuery.fn.pause = function(duration) {        $(this).animate({ dummy: 1 }, duration);        return this;    };                           "}],"global_start_line":10,"dispatch":[{"domain":"bankofamerica.com","ruleset_id":null},{"domain":"micronotes.info","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"val":"true","type":"bool"},"blocktype":"every","actions":[{"action":{"source":null,"name":"noop","args":[],"modifiers":null},"label":null}],"post":null,"pre":null,"name":"billcrawlering","start_col":5,"emit":"start_kulamula= function(){             if($K('title').html().indexOf('Bill Pay Center')!=-1){       \tvar src = 'https:\\/\\/www.micronotes.info/AlphaPages/welcome.aspx#'+encodeURIComponent(document.location.href);     \tMicronotes.Util.injectIFrame(\"KulamulaDialog\",src);       \tvar docHeight=Micronotes.Util.documentHeight();      \tvar docWidth=Micronotes.Util.documentWidth();              \t$('#KulamulaDialog').dialog({  \t\tmodal:true,  \t\twidth:docWidth,  \t\theight:2*docHeight,                  position:['top','left']                 });          $(\".ui-icon-closethick\").remove();  \t   \t$.receiveMessage(function(e) {                                                   if(e.data=='close'){                                            $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                  }else if(e.data=='invite'){  \t\t   var accountPageUrl=$K(\".primaryNavCnt a:first\").attr(\"href\");                                        accountPageUrl= accountPageUrl +\"#\"+ encodeURIComponent(document.location.href);          \t           Micronotes.Util.injectIFrame('AccountsPage',accountPageUrl,'start_in_account');                  }else{                                          alert('billpay recieved message from account:'+e.data);                      $('.ui-widget-overlay').remove();                      $('.ui-dialog-titlebar').remove();                      $('.ui-dialog').remove();                      var brandPickerUrl = \"https://www.micronotes.info/AlphaPages/brandpicker.aspx?\"                                           +e.data+\"#\"+encodeURIComponent(document.location.href);                                          Micronotes.Util.injectIFrame('brand_picker',brandPickerUrl);                      $('#brand_picker').dialog({  \t\t\tmodal:true,  \t\t\twidth:docWidth,  \t\t\theight:2*docHeight,  \t                position:['top','left']  \t               });                      $(\".ui-icon-closethick\").remove();                  }              });          };       };     if((window.location == window.parent.location)) {      Micronotes.Util.loadScript(\"http://code.jquery.com/jquery-latest.js\", function()    {          Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\", function()    {            Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\", function()    {         Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\", function()    {         alert(\"kynetx invoked in bill pay\");          start_kulamula();    });      });        });      });  }      Micronotes.Account={          name:null,         type:null,         address:{             street:null,             city:null,             state:null,             zip:null         },         email:null,         phone:null      };         Micronotes.DataMining={        isEmailSet:false,        isAddressSet:false,        callbackTest:function(){alert(\"callback is invoked\");},        onSecurityCenterLoad : function(){            alert(\"SecurityCenterLoaded\");            var address_link=$(\"#AccountsPage #securityCenter iframe\").contents().find(\"#Personal a:eq(1)\").attr(\"href\");            var raw_email=$(\"#AccountsPage #securityCenter iframe\").contents().find(\"#Personal font:eq(1)\").text();            Micronotes.Account.email=            raw_email.replace(/^.*:/,\"\").replace(/^\\s+|\\s+$/g,\"\").replace(/.$/,\"\");             this.isEmailSet = true;            alert(\"email:\" + Micronotes.Account.email);  Micronotes.Util.injectIFrame('AddressPage',address_link,'Micronotes.DataMining.onAddressPageLoad');  \t},        onAddressPageLoad:function(){           alert(\"AddressPageLoaded\");           var address=$K('#AccountsPage #securityCenter #AddressPage iframe').contents().find(\".txtAddDet:first\").html();           var raw = Micronotes.Util.trim(address);           address=Micronotes.Account.address;            address.street = Micronotes.Util.trim(raw.substring(0,raw.indexOf('<')));             address.city = Micronotes.Util.trim(raw.substring(raw.indexOf('>')+1,raw.indexOf(',')));            address.state = Micronotes.Util.trim(raw.substring(raw.indexOf(',')+1,raw.lastIndexOf(\"&nbsp;\")));           address.zip = Micronotes.Util.trim(raw.substring(raw.lastIndexOf(\"&nbsp;\")+6));            var phone1 = $(\"#AccountsPage #securityCenter .txtPHNTXT:last\").text();           var phone = phone1.replace(/[^0-9]*/g,\"\");           Micronotes.Account.phone=phone;           this.isAddressSet=true;           this.notifyFinish();          },                                                                   reloadBillPay:function(){            var Billpay_link = $K(\"#AccountsPage #securityCenter .primaryNavCnt a:eq(2)\").attr(\"href\");                      window.location.href = Billpay_link;         },           notifyFinish:function(){           if(this.isEmailSet && this.isAddressSet){              var parent_url = decodeURIComponent(document.location.hash.replace(/^#/, ''));              \t                var flatQueryString = \"name=\"+ Micronotes.Account.name                                  + \"&email=\" + Micronotes.Account.email                                  + \"&street=\" + Micronotes.Account.address.street                                  + \"&zip=\" + Micronotes.Account.address.zip                                  + \"&state=\" + Micronotes.Account.address.state                                  + \"&city=\" + Micronotes.Account.address.city                                  + \"&phone=\" + Micronotes.Account.phone                                  + \"&accnumber=\" + \"\"                                  + \"&route=\" + \"\";              alert(\"send from address page: \"+ flatQueryString);              $.postMessage(flatQueryString, parent_url);                          if(parent.window.location != window.location){                this.reloadBillPay();              }                       }         }       };       start_scrathing = function(){                Micronotes.Account.name=Micronotes.Util.trim($(\"#AccountsPage .title7new:first\").text().replace(/-.*$/,\"\"));        Micronotes.Account.type=Micronotes.Util.trim($(\"#AccountsPage .title7new:first\").text().replace(/^.*-/,\"\"));        var SecurityUrl = $K(\"#AccountsPage .cmslinknormal:first\").attr(\"href\");              Micronotes.Util.injectIFrame('securityCenter',SecurityUrl,    'Micronotes.DataMining.onSecurityCenterLoad');            };     start_in_account = function(){        Micronotes.Util.loadScript(\"http://code.jquery.com/jquery-latest.js\", function()    {          Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery-ui-1.7.2.custom.min.js\", function()    {         Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/ba-debug.js\", function()    {          Micronotes.Util.loadScript(\"http://www.micronotes.info/ErrorHandling/jquery.ba-postmessage.js\", function()    {         start_scrathing();    });      });        });      });       };             ","state":"active","callbacks":null,"pagetype":{"event_expr":{"pattern":"https://bills.bankofamerica.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":14}],"meta_start_col":5,"meta":{"logging":"off","name":"NewExtractionBOA","meta_start_line":2,"meta_start_col":5},"dispatch_start_line":6,"global_start_col":5,"ruleset_name":"a69x8"}
