{"global":[{"content":"#spotlight-reminders-wrapper{\r\n\theight:24px;\r\n\tbackground:#e4effd;\r\n\tpadding:0 0 0 9px;\r\n\tmargin:15px 0;\r\n\tfont-size:small;\r\n}\r\n\r\n.remindme-reminders-wrapper{\r\n\theight:24px;\r\n\tbackground:white;\r\n\tpadding:0;\r\n\tmargin:0;\r\n\tfont-size:small;\r\n\twidth:450px;\r\n}\r\n\r\np.descriptive-text{\r\n\tfloat:right;\r\n\tmargin:4px 9px 0 0;\r\n\tpadding:0;\r\n\tcolor:#7a7a7a;\r\n\tfont-size:small;\r\n}\r\n\r\nul.spotlightReminders{\r\n\tfloat:left;\r\n\tmargin:0;\r\n\tpadding:0;\r\n\tlist-style:none;\r\n\theight:24px;\r\n}\r\n\r\nul.spotlightReminders li{\r\n\tdisplay:block;\r\n\tfloat:left !important;\r\n\tmargin:3px 3px 0 0;\r\n}\r\n\r\nul.spotlightReminders li.azigo-logo{\r\n\tmargin:4px 0 0 0;\r\n}\r\n\r\nul.spotlightReminders li.txt-reminder{\r\n\tpadding:0 0 0 4px;\r\n\tmargin:4px 3px 0 0;\r\n\tcolor:#2b30d1;\r\n}\r\n\r\n.clear{\r\n\tclear:both;\r\n}       \r\n\r\n.remindme-flyout-wrapper{\r\n\tborder: 3px solid #e471ac;\r\n\twidth:450px;\r\n\tmargin:0 0 0 20px;\r\n\tposition: absolute;\r\n        background-color: white;\r\n\tdisplay: none;\r\n\tz-index: 1;\r\n\ttext-align:left;\r\n}\r\n\r\n.flyout-pointer{\r\n\tbackground:url(\"http://www.azigo.com/images/rm/FlyoutPoint.png\") no-repeat;\r\n\theight:11px;\r\n\twidth:15px;\r\n\tposition:relative;\r\n\tmargin:-11px 0 0 20px;\r\n}\r\n\r\n.flyout-reminder-details{\r\n\tpadding:8px 10px;\r\n\tborder-bottom:1px solid #c2c2c2;\r\n        color: black;\r\n\tfloat: left;\r\n}\r\n\r\np.flyout-reminder-url{\r\n\tmargin:0 0 5px 0;\r\n\tpadding:0;\r\n}\r\n\r\n.flyout-reminder-details ul{\r\n\tmargin:0;\r\n\tpadding:0;\r\n\tlist-style:none;\r\n\tline-height:14px;\r\n}\r\n\r\n.flyout-reminder-details ul li{\r\n\tdisplay:block;\r\n\tfloat:left !important;\r\n\tmargin:0 4px 0 0;\r\n\tpadding:0;\r\n}\r\n\r\n.flyout-reminder-details ul li.flyout-reminder-url{\r\n\tmargin:0 0 5px 0;\r\n\tpadding:0;\r\n\twidth:250px;\r\n}\r\n\r\n.flyout-reminder-details ul li.flyout-reminder-text{\r\n\twidth:230px;\r\n}\r\n\r\n.flyout-reminder-details ul li.flyout-reminder-button{\r\n\tmargin:0;\r\n        color:#fff !important;\r\n}\r\n\r\na.flyout-reminder-button{\r\n\tdisplay:block;\r\n\tfont-size:10px;\r\n\tfont-weight:bold;\r\n\tfont-family:Verdana, sans-serif, Arial, Helvetica;\r\n\tbackground:#57b6e3;\r\n\ttext-align:center;\r\n\ttext-decoration:none;\r\n\theight:16px;\r\n\twidth:96px;\r\n\tcolor:#fff;\r\n\tpadding:2px 0 0 0;\r\n\tmargin:0;\r\n}\r\n\r\n\r\n.clearfix:after {\r\n    content: \".\";\r\n    display: block;\r\n    clear: both;\r\n    visibility: hidden;\r\n    line-height: 0;\r\n    height: 0;\r\n}\r\n\r\n.clearfix {\r\n    display: inline-block;\r\n}\r\n\r\nhtml[xmlns] .clearfix {\r\n    display: block;\r\n}\r\n\r\n* html .clearfix {\r\n    height: 1%;\r\n}   \r\n\r\n.flyout-wrapper{\r\n\tborder: 3px solid #e471ac;\r\n\twidth:450px;\r\n\tmargin:-15px 0 0 29px;\r\n\tposition: absolute;\r\n        background-color: white;\r\n\tdisplay: none;\r\n\tz-index: 1;\r\n}\r\n\r\n\r\n\r\n.flyout-reminder-details{\r\n\tpadding:8px 10px;\r\n\tborder-bottom:1px solid #c2c2c2;\r\n\tfont-size: small;\r\n        width:430px;\r\n}\r\n","type":"css"},{"emit":"var link_text = {\r\n    \"WABE\": \"<img style='padding-top: 3px' src='http://www.azigo.com/sales-demo/wabe-34.png' border='0'>\",\r\n    \"PBA30\": \"<img style='padding-top: 3px' src='http://www.azigo.com/sales-demo/pba-34.png' border='0'>\"\r\n  };\r\n\r\n\r\nfunction createCookie(name,value,days) {\r\n        if (days) {\r\n\t\tvar date = new Date();\r\n\t\tdate.setTime(date.getTime()+(days*24*60*60*1000));\r\n\t\tvar expires = \"; expires=\"+date.toGMTString();\r\n\t}\r\n\telse var expires = \"\";\r\n\tdocument.cookie = name+\"=\"+value+expires+\"; path=/\";\r\n}\r\n\r\nfunction readCookie(name) {\r\n\tvar nameEQ = name + \"=\";\r\n\tvar ca = document.cookie.split(';');\r\n\tfor(var i=0;i < ca.length;i++) {\r\n\t\tvar c = ca[i];\r\n\t\twhile (c.charAt(0)==' ') c = c.substring(1,c.length);\r\n\t\tif (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);\r\n\t}\r\n\treturn null;\r\n}\r\n\r\nfunction eraseCookie(name) {\r\n\tcreateCookie(name,\"\",-1);\r\n}\r\n \t        var globalData = {\r\n                                \"Source\" : \"pba\",\r\n\t\t\t\t\"RemindMeIconUrl\" : \"http://www.azigo.com/images/rm/crd/pba_18x24.png\",\r\n                                \"FlyoutIconUrl\" : \"http://www.azigo.com/images/rm/crd/pba_60x90.png\"\r\n\t\t\t };\r\n\r\n\tfunction remindMeSelector(obj) {\r\n                var annotationContent;\r\n\t\tvar remindMeDomain = obj.name.replace(/http:\\/\\/([A-Za-z0-9.-]+)\\/.*/,\"$1\");\r\n        \tremindMeDomain = remindMeDomain.replace(\"http://\",\"\");\r\n\t\tremindMeDomain = remindMeDomain.replace(\"www.\",\"\");\r\n\t\tremindMeDomain = remindMeDomain.replace(\"www1.\",\"\");\r\n\t\tremindMeDomain = remindMeDomain.replace(/\\.[^.]+$/,\"\");\r\n                remindMeDomain = remindMeDomain.replace(/[&]/g,\"and\");\r\n                remindMeDomain = remindMeDomain.replace(/\\s+/g,\"\");\r\n\t\tremindMeDomain = remindMeDomain.replace(/[']/g,\"\");\r\n\t\tremindMeDomain = remindMeDomain.replace(/[-]/g,\"\");\r\n                remindMeDomain = remindMeDomain.toLowerCase();\r\n\r\n                var remindMeDivId = \"remindMe_\"+remindMeDomain;\r\n                var remindMeFlyoutDivId = \"remindMeFlyout_\"+remindMeDomain;\r\n\t\tvar remindMeWrapper = \"remindMeWrapper_\"+remindMeDomain;\r\n\r\n\t\tif($K(\"#\"+remindMeDivId).length == 0) {\r\n\t\t   var remindMeMainDiv = createRemindMeDiv(remindMeDivId);\r\n                   var remindMeFlyoutDiv = createRemindMeFlyoutDiv(remindMeFlyoutDivId);\r\n\r\n\t\t   remindMeFlyoutDiv.append(\r\n\t\t\tgetFlyoutDetails(\r\n                                                 obj.name,\r\n                                                 obj.link, \r\n                                                 globalData.FlyoutIconUrl, \r\n                                                 obj.text, \r\n                                                 obj.icon\r\n                                          )\r\n\t\t   );\r\n\r\n \t           var remindMeDiv = $K(\"<div></div>\");\r\n\r\n                   var wrapperDiv = $K(\"<div id='\"+remindMeWrapper+\"' class='remindme-reminders-wrapper'></div>\");\r\n\t\t   wrapperDiv.append(remindMeMainDiv);\r\n\r\n\t\t   remindMeDiv.append(wrapperDiv);\r\n\r\n\t           remindMeDiv.append(remindMeFlyoutDiv);\r\n\r\n                   annotationContent = remindMeDiv;\r\n                   registerEvents(remindMeDivId, remindMeFlyoutDivId, false);\r\n                }\r\n                else { \r\n                   if($K(\"#\"+remindMeDivId).find(\"#img_\"+globalData.Source+\"_remindMe\").length) {\r\n                        return false;\r\n                   }\r\n\r\n\t\t   if($K(\"#\"+remindMeDivId).children(\".txt-reminder\").length) {\r\n                      $K(\"#\"+remindMeDivId).children(\".txt-reminder\").after(\r\n                                              makeListItem(\r\n\t\t                                    null, \r\n\t\t                                    null, \r\n\t\t                                    $K(\"<img id='img_\"+globalData.Source+\"_remindMe' src='\"+globalData.RemindMeIconUrl+\"' />\")\r\n\t\t                              )\r\n                      );\r\n                   }\r\n\r\n\t\t   if($K(\"#\"+remindMeFlyoutDivId).length) {\r\n\t\t\t$K(\"#\"+remindMeFlyoutDivId).append(\r\n\t\t\t                   getFlyoutDetails(\r\n                                                                obj.name,\r\n                                                                obj.link, \r\n                                                                globalData.FlyoutIconUrl, \r\n                                                                obj.text, \r\n                                                                obj.icon\r\n                                           )\r\n\t\t        );\r\n  \t\t   }\r\n\r\n\t\t   //Increment the counter.\r\n\t\t   var spanReminders = $K(\"#\"+remindMeDivId).children(\".txt-reminder\").children(\".spanRemindMeNReminders\");\r\n                   if (spanReminders.length > 0)\r\n                   {\r\n                       var totalReminders = parseInt(spanReminders.text());\r\n                       if (!isNaN(totalReminders))\r\n                       {\r\n\t                    totalReminders = totalReminders + 1;\r\n                            spanReminders.text(String(totalReminders));\r\n\t                    if(totalReminders == 1) {\r\n\t\t               $K(\"#\"+remindMeDivId).children(\".txt-reminder\").children(\".spanRemindMeTextReminders\").text(\"Reminder\");\r\n\t                    }\r\n\t                    else {\r\n\t\t               $K(\"#\"+remindMeDivId).children(\".txt-reminder\").children(\".spanRemindMeTextReminders\").text(\"Reminders\");\r\n\t                    }\r\n                       }                \r\n\t\t   }\r\n                   annotationContent = false;\r\n                }\r\n\t     return annotationContent;\r\n        }\r\n\r\n        function registerEvents(remindMeDivId, remindMeFlyoutDivId, isSpotlightEvent) {\t\t\r\n\t     $K(\"#\"+remindMeDivId).live('mouseover', function () {\r\n\t\t   $K('#'+remindMeDivId).css({'cursor':'hand','cursor':'pointer'});\r\n                   $K('#'+remindMeFlyoutDivId).show();\r\n\t     });\r\n\r\n\t     $K(\"#\"+remindMeDivId).live('mouseout', function () {\r\n                   \r\n                   if(isSpotlightEvent) {\r\n                      $K(\"#spotlight-reminders-wrapper\").live('mouseover', function() {\r\n                           $K('#'+remindMeFlyoutDivId).show();                           \r\n                      });\r\n                      $K(\"#spotlight-reminders-wrapper\").live('mouseout', function() {\r\n                           $K('#'+remindMeFlyoutDivId).hide();   \r\n\t\t\t   $K(\"#spotlight-reminders-wrapper\").die('mouseover');\r\n\t\t\t   $K(\"#spotlight-reminders-wrapper\").die('mouseout');\r\n                      });\r\n                   }\r\n\t\t   else {\r\n\t\t\t$K(\"#\"+remindMeDivId).parent().mouseover(function() {\r\n                           $K('#'+remindMeFlyoutDivId).show();    \r\n\t\t\t});\r\n                      $K(\"#\"+remindMeDivId).parent().mouseout(function() {\r\n                           $K('#'+remindMeFlyoutDivId).hide();   \r\n\t\t\t   $K(\"#\"+remindMeDivId).parent().unbind('mouseover');\r\n\t\t\t   $K(\"#\"+remindMeDivId).parent().unbind('mouseout');\r\n                      });\r\n\t\t   }\r\n\r\n\t\t   $K('#'+remindMeFlyoutDivId).hide();\r\n\t     });\r\n\r\n\t     $K(\"#\"+remindMeFlyoutDivId).live('mouseover', function () {\r\n        \t   $K('#'+remindMeFlyoutDivId).show();\r\n\t     });\r\n\r\n\t     $K(\"#\"+remindMeFlyoutDivId).live('mouseout', function () {\r\n\t\t   $K('#'+remindMeFlyoutDivId).hide();\r\n\t\t   if(isSpotlightEvent) {\r\n\t\t\t   $K(\"#spotlight-reminders-wrapper\").die('mouseover');\r\n\t\t\t   $K(\"#spotlight-reminders-wrapper\").die('mouseout');\r\n\t\t   }\r\n\t\t   else {\r\n\t\t\t   $K(\"#\"+remindMeDivId).parent().unbind('mouseover');\r\n\t\t\t   $K(\"#\"+remindMeDivId).parent().unbind('mouseout');\r\n\t\t   }\r\n             });\r\n        }\r\n\r\n\tfunction createRemindMeDiv(remindMeDivId) {\r\n             var remindMeMainUl = $K(\"<ul></ul>\");\r\n             remindMeMainUl.attr({\"id\":remindMeDivId, \"class\":\"spotlightReminders\"});\r\n\r\n             remindMeMainUl.append(\r\n                  makeListItem(null, \"azigo-logo\", $K(\"<img src='http://www.azigo.com/images/rm/azigo_16x16.png' />\"))\r\n             );\r\n\r\n             remindMeMainUl.append(\r\n                  makeListItem(\r\n\t\t     \"remindme-txt-reminder\", \r\n\t\t     \"txt-reminder\", \r\n\t\t     \"<span class='spanRemindMeNReminders'>1</span> <span class='spanRemindMeTextReminders'>Reminder</span>\"\r\n\t\t  )\r\n             );\r\n\r\n             remindMeMainUl.append(\r\n                  makeListItem(\r\n\t\t     null, \r\n\t\t     null, \r\n\t\t     $K(\"<img id='img_\"+globalData.Source+\"_remindMe' src='\"+globalData.RemindMeIconUrl+\"' />\")\r\n\t\t  )\r\n             );\r\n\r\n             remindMeMainUl.append(\r\n                  makeListItem(null, null, $K(\"<img src='http://www.azigo.com/images/rm/FlyoutIndicator.png' />\"))\r\n             );\r\n\r\n             return remindMeMainUl;\r\n        }\r\n\r\n\tfunction createRemindMeFlyoutDiv(remindMeFlyoutDivId)\r\n        {\r\n\t    var remindMeFlyoutDiv = $K(\"<div></div>\");\r\n\t    remindMeFlyoutDiv.attr({\"id\":remindMeFlyoutDivId, \"class\":\"remindme-flyout-wrapper\"});\r\n\t    remindMeFlyoutDiv.append($K(\"<div></div>\").attr(\"class\", \"flyout-pointer\"));\r\n            return remindMeFlyoutDiv;\r\n        }\r\n\r\n\tfunction makeListItem(listItemId, listItemClass, listItemContent) {\r\n             var listItem = $K(\"<li></li>\");\r\n             if(listItemClass != null) {\r\n                 listItem.attr(\"class\", listItemClass);\r\n             }\r\n\t     if(listItemId != null) {\r\n\t         listItem.attr(\"id\", listItemId);\r\n\t     }\r\n             listItem.append(listItemContent);\r\n             return listItem;        \r\n        }\r\n\r\n\tfunction makeAnchorTag(aUrl, aClass, aText)\r\n        {\r\n             var anchorTag = $K(\"<a></a>\");\r\n             anchorTag.attr(\"href\", aUrl);\r\n             if(aClass != null) {\r\n                 anchorTag.attr(\"class\", aClass);\r\n             }\r\n             anchorTag.append(aText);\r\n             return anchorTag;\r\n        }\r\n\r\n    /*\r\n\tFunction that takes the details to be displayed in the flyout and creates a flyout component with those details.\r\n    */\r\n    function getFlyoutDetails(clientName, clientUrl, clientLogo, displayText, buttonType)\r\n    { \t         \r\n\tvar flyoutDetailsDiv = $K(\"<div></div>\");\r\n\tflyoutDetailsDiv.attr(\"class\",\"flyout-reminder-details clearfix\");\r\n\r\n        var flyoutDetailsUl = $K(\"<ul></ul>\");\r\n\r\n        flyoutDetailsUl.append(\r\n\t\tmakeListItem(null, null, $K(\"<img src='\"+clientLogo+\"' />\"))\r\n\t);\r\n        flyoutDetailsUl.append(\r\n                makeListItem(null, \"flyout-reminder-url\", makeAnchorTag(clientUrl, null, clientName))\r\n        );\r\n        flyoutDetailsUl.append(\r\n\t\tmakeListItem(null, \"flyout-reminder-text\", displayText)\r\n\t);\r\n\tvar discountButton = \"\";\r\n\t//if(buttonType === \"discount\") {\r\n\t\tdiscountButton = makeAnchorTag(clientUrl, \"flyout-reminder-button\", \"Get Discount...\");\r\n\t//}\r\n        flyoutDetailsUl.append(\r\n\t\tmakeListItem(null, null, discountButton)\r\n\t);        \r\n\r\n        flyoutDetailsDiv.append(flyoutDetailsUl);\r\n            \r\n\treturn flyoutDetailsDiv;\r\n    }\r\n\r\n/*\r\n    Main function for the Spotlight that will be called from each rule.\r\n*/\r\nKOBJ.spotlight = function (source) {\r\n    /*\r\n\tCallback function to handle JSON data returned from the nutchfilter url.\r\n    */\r\n    function datasetcallback(d){\r\n        if(d) {\r\n           var response = d.response;\r\n           if(response) {\r\n               if(response.docs.length > 0) {\r\n               \t    displaySpotlight(response);\r\n               }\r\n           }\r\n        }      \t\r\n    }\r\n\r\n    /* \r\n\tTake out the search string from the url and construct a remoteUrl for the current source. \r\n    */\r\n    var q = String(top.location).replace(/^.*[\\?&][qp]=([^&]+).*$/, \"$1\");\r\n    var remoteUrl = \"http://service.azigo.com/solr/nutchfilter.jsp?q=\"+q+\"&fq=source:\"+source+\"&callback=?\";\r\n\r\n    $K.getJSON(remoteUrl,datasetcallback);\r\n\r\n    /*\r\n\tFunction to create the main div for Spotlight. It just creates the spotlight template that will be displayed \r\n\tabove the search results.\r\n    */\r\n    function createSpotlightMainDiv()\r\n    {\r\n\t var spotlightMainDiv = $K(\"<div></div>\");\r\n\t spotlightMainDiv.attr(\"id\", \"spotlight-reminders-wrapper\");\r\n\r\n         var spotlightMainUl = $K(\"<ul></ul>\");\r\n         spotlightMainUl.attr({\"id\":\"spotlightReminders\", \"class\":\"spotlightReminders\"});\r\n\r\n         spotlightMainUl.append(\r\n                    makeListItem(null, 'azigo-logo', $K(\"<img src='http://www.azigo.com/images/rm/azigo_16x16.png' />\"))\r\n         );\r\n\r\n         var spotlightReminderNSpan = $K(\"<span></span>\");\r\n         spotlightReminderNSpan.attr(\"id\", \"spanNReminders\");\r\n         spotlightReminderNSpan.text(\"0\");\r\n\r\n         var spotlightReminderTextSpan = $K(\"<span></span>\");\r\n         spotlightReminderTextSpan.attr(\"id\", \"spanTextReminders\");\r\n         spotlightReminderTextSpan.text(\"Reminders\");\r\n\r\n         spotlightMainUl.append(\r\n                           makeListItem(\r\n\t\t\t\t\"spotlight-txt-reminder\", \r\n\t\t\t\t\"txt-reminder\", \r\n\t\t\t\t\"<span id='spanNReminders'>0</span> <span id='spanTextReminders'>Reminders</span>\"\r\n\t\t\t   )\r\n         );\r\n\r\n         spotlightMainUl.append(\r\n                    makeListItem(null, null, $K(\"<img src='http://www.azigo.com/images/rm/FlyoutIndicator.png' />\"))\r\n         );\r\n\r\n         var spotlightMainP = $K(\"<p></p>\");\r\n         spotlightMainP.attr(\"class\", \"descriptive-text\");\r\n         spotlightMainP.text(\"My Sponsored Links\");\r\n\r\n         spotlightMainDiv.append(spotlightMainUl);\r\n         spotlightMainDiv.append(spotlightMainP);\r\n\r\n         return spotlightMainDiv;\r\n    }\r\n\r\n    /*\r\n\tFunction to create the Flyout Div for Spotlight. It just creates the flyout template that will be displayed\r\n\tonce user hovers over the Spotlight components.\r\n    */\r\n    function createSpotlightFlyoutDiv()\r\n    {\r\n\tvar spotlightFlyoutDiv = $K(\"<div></div>\");\r\n\tspotlightFlyoutDiv.attr({\"id\":\"spotlightFlyoutDiv\", \"class\":\"flyout-wrapper\"});\r\n\tspotlightFlyoutDiv.append($K(\"<div></div>\").attr(\"class\", \"flyout-pointer\"));\r\n        return spotlightFlyoutDiv;\r\n    }\r\n\r\n    /*\r\n\tCallback function to handle JSON data returned from fetch url - which gives details requierd for the flyout.\r\n    */\r\n    function flyoutContentCallback(data)\r\n    {\r\n        if($K('#spotlightFlyoutDiv').length) {\r\n           $K.each(data, function(){\r\n                        $K('#spotlightFlyoutDiv').append(\r\n\t\t\t                  getFlyoutDetails(\r\n                                                 this.name,\r\n                                                 this.link, \r\n                                                 globalData.FlyoutIconUrl, \r\n                                                 this.text, \r\n                                                 this.icon\r\n                                          )\r\n                        );\r\n                    }\r\n           );\r\n        }\r\n    }    \r\n\r\n    /*\r\n\tMain function that creates all the components required for Spotlight and injects them in the search page.\r\n    */\r\n    function displaySpotlight(response)\r\n    {\r\n        var logoUrl = globalData.RemindMeIconUrl;\r\n\r\n        if($K(\"#spotlight-reminders-wrapper\").length == 0) {\r\n\t    var spotlightMainDiv = createSpotlightMainDiv();\r\n            var spotlightFlyoutDiv = createSpotlightFlyoutDiv();\r\n \t    var spotlightDiv = $K(\"<div id='spotlight-main-flyout'></div>\");\r\n\t    spotlightDiv.append(spotlightMainDiv);\r\n\t    spotlightDiv.append(spotlightFlyoutDiv);\r\n            if($K(\"#res\").length) {\r\n                $K(\"#res\").prepend(spotlightDiv);\r\n            }\r\n            else if($K(\"#web\").length) {\r\n                $K(\"#web\").prepend(spotlightDiv);\r\n            }\r\n            else if($K(\"#results\").length) {\r\n                $K(\"#results\").prepend(spotlightDiv);\r\n            }\r\n        }\r\n\r\n        //Register the mousover and mouseout events to show/hide the flyout.\r\n\tregisterEvents(\"spotlightReminders\", \"spotlightFlyoutDiv\", true);\r\n\r\n\t/*\r\n\t    If the details for this source has already been injected in the page, we don't need to go further.\r\n\t*/\r\n    \tif($K(\"#img_\"+source+\"_spotlight\").length) {\r\n            return;\r\n        }\r\n\r\n        if($K(\"#spotlight-txt-reminder\").length) {\r\n             $K(\"#spotlight-txt-reminder\").after(\"<li><img id='img_\"+source+\"_spotlight' src='\"+logoUrl+\"' /></li>\");\r\n        }\r\n        var spanReminders = $K(\"#spanNReminders\");\r\n        if (spanReminders.length > 0)\r\n        {\r\n            var totalReminders = parseInt(spanReminders.text());\r\n           if (!isNaN(totalReminders))\r\n           {\r\n\t       if(response.docs.length > 3) {\r\n\t\t   totalReminders = totalReminders + 3;\r\n\t       }\r\n\t       else {\r\n               \t   totalReminders = totalReminders + response.docs.length;\r\n\t       }\r\n               spanReminders.text(String(totalReminders));\r\n\t       if(totalReminders == 1) {\r\n\t\t   $K(\"#spanTextReminders\").text(\"Reminder\");\r\n\t       }\r\n\t       else {\r\n\t\t   $K(\"#spanTextReminders\").text(\"Reminders\");\r\n\t       }\r\n           }\r\n        }\r\n\r\n        /*\r\n            Make a call to the URL which will get us the detailed content as below.\r\n        */\r\n\tvar jsonData = \"\";\r\n\tvar index = 1;\r\n\t$K.each(response.docs, function(){\r\n\t\t\t\tif(index > 1)\r\n\t\t\t\t    jsonData += \",\";\r\n\t\t\t\tjsonData += \"'KOBJL\"+index+\"':{'url':'\"+this.url+\"'}\";\r\n\t\t\t\tindex++;\r\n\t\t\t\tif(index > 3)\r\n\t\t\t\t   return false;\r\n\t\t\t});\r\n\r\n        var jsonUrl = \"http://service.azigo.com/remindmeac/fetch?callback=?&jsonData=true&source=wabe\";\r\n        $K.getJSON(jsonUrl, \"annotatedata={\"+jsonData+\"}\", flyoutContentCallback);\r\n  }\r\n};\r\n            "}],"global_start_line":64,"dispatch":[{"domain":"www.google.com","ruleset_id":null},{"domain":"search.yahoo.com","ruleset_id":null},{"domain":"www.bing.com","ruleset_id":null},{"domain":"search.live.com","ruleset_id":null},{"domain":"14thstreetchiropractic.com","ruleset_id":null},{"domain":"7stages.org","ruleset_id":null},{"domain":"actors-express.com","ruleset_id":null},{"domain":"ipst.gatech.edu/amp","ruleset_id":null},{"domain":"apexmuseum.org","ruleset_id":null},{"domain":"theartoftouchmassage.com","ruleset_id":null},{"domain":"artstation.org","ruleset_id":null},{"domain":"arts.emory.edu","ruleset_id":null},{"domain":"atlantaballet.com","ruleset_id":null},{"domain":"atlantabotanicalgarden.org","ruleset_id":null},{"domain":"thecontemporary.org","ruleset_id":null},{"domain":"www.atlantacycling.com","ruleset_id":null},{"domain":"www.atlantacyclorama.org","ruleset_id":null},{"domain":"agmchorus.org","ruleset_id":null},{"domain":"atlantahistorycenter.com","ruleset_id":null},{"domain":"atlantalyrictheatre.com","ruleset_id":null},{"domain":"atlantaopera.org","ruleset_id":null},{"domain":"atlantasymphony.org","ruleset_id":null},{"domain":"auroratheatre.com","ruleset_id":null},{"domain":"callanwolde.org","ruleset_id":null},{"domain":"puppet.org","ruleset_id":null},{"domain":"chopinatlanta.org","ruleset_id":null},{"domain":"citysegwaytours.com/atlanta","ruleset_id":null},{"domain":"kennesaw.edu/arts","ruleset_id":null},{"domain":"dekalbymphony.com","ruleset_id":null},{"domain":"fernbankmuseum.org","ruleset_id":null},{"domain":"gashakespeare.org","ruleset_id":null},{"domain":"habershamgardens.com","ruleset_id":null},{"domain":"high.org","ruleset_id":null},{"domain":"hodgearmynavy.com","ruleset_id":null},{"domain":"horizontheatre.com","ruleset_id":null},{"domain":"carlos.emory.edu","ruleset_id":null},{"domain":"museumofdesign.org","ruleset_id":null},{"domain":"newbalanceatlanta.com","ruleset_id":null},{"domain":"www.oglethorpe.edu","ruleset_id":null},{"domain":"orchestraatlanta.org","ruleset_id":null},{"domain":"oursongatlanta.com","ruleset_id":null},{"domain":"pizzeriaventi-atlanta.com","ruleset_id":null},{"domain":"rialtocenter.org","ruleset_id":null},{"domain":"risesushilounge.com","ruleset_id":null},{"domain":"shakespearetavern.com","ruleset_id":null},{"domain":"silkrestaurant.com","ruleset_id":null},{"domain":"skateescape.com","ruleset_id":null},{"domain":"spiveyhall.org","ruleset_id":null},{"domain":"pentable.com","ruleset_id":null},{"domain":"tindrumcafe.net","ruleset_id":null},{"domain":"urbangroundscoffee.com","ruleset_id":null},{"domain":"villagecafesmyrna.com","ruleset_id":null}],"dispatch_start_col":5,"meta_start_line":2,"rules":[{"cond":{"args":[],"function_expr":{"val":"truth","type":"var"},"type":"app"},"blocktype":"every","actions":[{"action":{"source":null,"name":"annotate_search_results","args":[{"val":"remindMeSelector","type":"var"}],"modifiers":[{"value":{"val":"http://service.azigo.com/remindmeac/fetch?callback=?&jsonData=true&source=pba","type":"str"},"name":"remote"},{"value":{"val":[{"rhs":{"val":"none","type":"str"},"lhs":"float"},{"rhs":{"val":"0px","type":"str"},"lhs":"margin-left"},{"rhs":{"val":"0px","type":"str"},"lhs":"padding-right"}],"type":"hashraw"},"name":"outer_div_css"},{"value":{"val":[{"rhs":{"val":"0px","type":"str"},"lhs":"margin-left"},{"rhs":{"val":"0px","type":"str"},"lhs":"padding-right"},{"rhs":{"val":"5px","type":"str"},"lhs":"padding-top"}],"type":"hashraw"},"name":"inner_div_css"},{"value":{"val":[{"rhs":{"val":"0px","type":"str"},"lhs":"padding-left"},{"rhs":{"val":"normal","type":"str"},"lhs":"white-space"}],"type":"hashraw"},"name":"li_css"},{"value":{"val":"after","type":"str"},"name":"placement"},{"value":{"val":[{"rhs":{"val":[{"rhs":{"val":".sa_cc","type":"str"},"lhs":"modify"}],"type":"hashraw"},"lhs":"www.bing.com"}],"type":"hashraw"},"name":"domains"}]},"label":null}],"post":null,"pre":[],"name":"pba_remindme","start_col":5,"emit":"","state":"active","callbacks":{"success":[{"attribute":"class","trigger":null,"value":"flyout-reminder-button","type":"click"}],"failure":null},"pagetype":{"event_expr":{"pattern":"^http://www.google.com|^http://www.bing.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":690},{"cond":{"args":[{"val":"pick","type":"var"},{"val":"","type":"str"}],"type":"ineq","op":"neq"},"blocktype":"every","actions":[{"label":null,"emit":"if (pick.length == 0)          return;      if(readCookie(\"KOBJ_wabethanks\") != null) {    \treturn;      }      else {  \tcreateCookie(\"KOBJ_wabethanks\",\"thanks\",1);      }                        "},{"action":{"source":null,"name":"notify","args":[{"val":"msgtitle","type":"var"},{"val":"msg","type":"var"}],"modifiers":[{"value":{"val":1,"type":"num"},"name":"opacity"},{"value":{"val":"#000","type":"str"},"name":"background_color"}]},"label":null}],"post":{"alt":null,"type":"fired","cons":[{"test":null,"what":{"val":"thanks","type":"str"},"type":"log"}]},"pre":[{"rhs":{"source":"datasource","predicate":"wabeds","args":[{"val":"?x=1","type":"str"}],"type":"qualified"},"lhs":"wabeds","type":"expr"},{"rhs":{"obj":{"source":"page","predicate":"env","args":[{"val":"caller","type":"str"}],"type":"qualified"},"args":[{"val":"/http:\\/\\/([A-Za-z0-9.-]+)\\/.*/","type":"regexp"},{"val":"$1","type":"str"}],"name":"replace","type":"operator"},"lhs":"domain","type":"expr"},{"rhs":{"obj":{"val":"domain","type":"var"},"args":[{"val":"/^www./","type":"regexp"},{"val":"","type":"str"}],"name":"replace","type":"operator"},"lhs":"domain","type":"expr"},{"rhs":{"obj":{"val":"domain","type":"var"},"args":[{"val":"/\\./","type":"regexp"},{"val":"\\.","type":"str"}],"name":"replace","type":"operator"},"lhs":"domain","type":"expr"},{"rhs":{"obj":{"val":"wabeds","type":"var"},"args":[{"args":[{"val":"$.","type":"str"},{"args":[{"val":"domain","type":"var"},{"val":"[0].text","type":"str"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"name":"pick","type":"operator"},"lhs":"pick","type":"expr"},{"rhs":{"obj":{"val":"wabeds","type":"var"},"args":[{"args":[{"val":"$.","type":"str"},{"args":[{"val":"domain","type":"var"},{"val":"[0].logo","type":"str"}],"type":"prim","op":"+"}],"type":"prim","op":"+"}],"name":"pick","type":"operator"},"lhs":"logo","type":"expr"},{"rhs":"<div style=\"margin-top: 5px; opacity: 1.0; padding: 10px; -moz-border-radius: 5px; background-color: #FFF; color:#000; text-align: center;\">  #{link_text[logo]}  <div style=\"text-align: left; width: 100%\">  <br/><center>#{pick}</center>  </div>  </div>  \n ","lhs":"msg","type":"here_doc"},{"rhs":{"val":"<img src='http://www.azigo.com/sales-demo/azigo_black_50.png' style='valign:center;'/>&nbsp;&nbsp;Thank You","type":"str"},"lhs":"msgtitle","type":"expr"}],"name":"thanks","start_col":5,"emit":null,"state":"active","callbacks":{"success":[{"attribute":"class","trigger":null,"value":"KOBJ_wabethanks","type":"click"}],"failure":null},"pagetype":{"event_expr":{"pattern":".*","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":714},{"cond":{"args":[],"function_expr":{"val":"truth","type":"var"},"type":"app"},"blocktype":"every","actions":[{"label":null,"emit":"KOBJ.spotlight('pba');                      "}],"post":null,"pre":[],"name":"pba_spotlight","start_col":5,"emit":null,"state":"active","callbacks":{"success":[{"attribute":"class","trigger":null,"value":"flyout-reminder-button","type":"click"}],"failure":null},"pagetype":{"event_expr":{"pattern":"^http://search.yahoo.com|^http://www.bing.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":750},{"cond":{"args":[],"function_expr":{"val":"truth","type":"var"},"type":"app"},"blocktype":"every","actions":[{"action":{"source":null,"name":"annotate_search_results","args":[{"val":"remindMeSelector","type":"var"}],"modifiers":[{"value":{"val":"https://service.azigo.com/remindmeac/fetch?callback=?&jsonData=true&source=pba&type=regular","type":"str"},"name":"remote"},{"value":{"val":[{"rhs":{"val":"none","type":"str"},"lhs":"float"},{"rhs":{"val":"40px","type":"str"},"lhs":"height"},{"rhs":{"val":"0px","type":"str"},"lhs":"margin-left"},{"rhs":{"val":"-10px","type":"str"},"lhs":"margin-top"},{"rhs":{"val":"0px","type":"str"},"lhs":"padding-right"}],"type":"hashraw"},"name":"outer_div_css"},{"value":{"val":[{"rhs":{"val":"0px","type":"str"},"lhs":"margin-left"},{"rhs":{"val":"0px","type":"str"},"lhs":"padding-right"}],"type":"hashraw"},"name":"inner_div_css"},{"value":{"val":[{"rhs":{"val":"0px","type":"str"},"lhs":"padding-left"},{"rhs":{"val":"normal","type":"str"},"lhs":"white-space"}],"type":"hashraw"},"name":"li_css"},{"value":{"val":"after","type":"str"},"name":"placement"},{"value":{"val":[{"rhs":{"val":[{"rhs":{"val":"#web > ol > li","type":"str"},"lhs":"selector"},{"rhs":{"val":"div.res","type":"str"},"lhs":"modify"}],"type":"hashraw"},"lhs":"search.yahoo.com"}],"type":"hashraw"},"name":"domains"}]},"label":null}],"post":null,"pre":[],"name":"pba_remindme_yahoo","start_col":5,"emit":"","state":"active","callbacks":{"success":[{"attribute":"class","trigger":null,"value":"flyout-reminder-button","type":"click"}],"failure":null},"pagetype":{"event_expr":{"pattern":"^http://search.yahoo.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":767},{"cond":{"args":[],"function_expr":{"val":"truth","type":"var"},"type":"app"},"blocktype":"every","actions":[{"label":null,"emit":"KOBJ.spotlight('pba');        KOBJ.watchDOM(\"#rso\",function() {    \t\t\t$K('#spotlight-main-flyout').remove();    \t\t\tKOBJ.spotlight('pba');    \t\t }    \t);                      "}],"post":null,"pre":[],"name":"pba_spotlight_google","start_col":5,"emit":null,"state":"active","callbacks":{"success":[{"attribute":"class","trigger":null,"value":"flyout-reminder-button","type":"click"}],"failure":null},"pagetype":{"event_expr":{"pattern":"^http://www.google.com","legacy":1,"type":"prim_event","vars":[],"op":"pageview"},"foreach":[]},"start_line":791}],"meta_start_col":5,"meta":{"logging":"off","name":"PBA Production","meta_start_line":2,"description":"PBA (aka WABE) Production Reminder \r\n\n","meta_start_col":5},"dispatch_start_line":10,"global_start_col":5,"ruleset_name":"a58x11"}