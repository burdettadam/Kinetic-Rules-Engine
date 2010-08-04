{
   "dispatch": [
      {"domain": "google.com"},
      {"domain": "yahoo.com"},
      {"domain": "bing.com"},
      {"domain": "smccvb.com"},
      {"domain": "beach-house.com"},
      {"domain": "halfmoonbayinn.com"},
      {"domain": "cetrella.com"},
      {"domain": "mezzalunabythesea.com"},
      {"domain": "foxdream.com"},
      {"domain": "gatewaylimousine.com"},
      {"domain": "playcrystalsprings.com"},
      {"domain": "cardinalhotel.com"},
      {"domain": "acqua-pazza.com"},
      {"domain": "costanoa.com"},
      {"domain": "calkayak.com"},
      {"domain": "malibugrandprix.com"},
      {"domain": "broadwaybythebay.org"},
      {"domain": "halfmoonbaygolf.com"},
      {"domain": "marriott.com"},
      {"domain": "hotelparkcity.com"},
      {"domain": "treasuremountaininn.com"},
      {"domain": "parkcityinfo.com"}
   ],
   "global": [{
      "content": "a.tour:link,a.tour:visited    {    display:block;    font-weight:bold;    color:#FFFFFF;    background-color:#787878;    width:120px;    text-align:left;    padding:4px;    text-decoration:none;    }    a.tour:hover,a.tour:active    {    background-color:#909090;    }    a.directions:link,a.directions:visited,a.directions:hover,a.directions:active    {    font-size:11px;    color:#FFFFFF;    }    a.near_me:link,a.near_me:visited,a.near_me:hover,a.near_me:active    {    font-size:12px;    color:#FFFFFF;    text-decoration: underline;    }    hr.tour    {    border:2;    }    p.notes    {    font-size:12px;    color:#FFFFFF;    line-height:16px;    }    ",
      "type": "css"
   }],
   "meta": {
      "author": "7bound, LLC",
      "description": "\nSites tour of San Mateo County businesses affiliated with the San Mateo County Convention and Visitors Bureau    Copyright (c) 2010 7bound, LLC All Rights Reserved    \n",
      "logging": "off",
      "name": "Virtual Tour Guide"
   },
   "rules": [
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Welcome to the Park City Chamber of Commerce and Visitors Bureau!"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "launch",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "parkcityinfo.com/",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_1\">                 <p class=\"notes\">                 What are you looking for? Please select an option below and hang on while we take you on a tour of some of the premier locations in Park City.<\/p>                 <a class=\"tour\" href=\"http://www.marriott.com/hotels/travel/slcms-marriotts-mountainside/\">Accommodations &raquo;<\/a>                 <a class=\"tour\" href=\"http://www.cetrella.com/\">Dining &raquo;<\/a>                 <a class=\"tour\" href=\"http://www.foxdream.com/\">Entertainment &raquo;<\/a>                 <a class=\"tour\" href=\"http://www.playcrystalsprings.com/\">Sports &raquo;<\/a>             <\/div>          \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Cetrella"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "cetrella",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "cetrella.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">              Experience award winning cuisine inspired by the coastal villages of Italy, Spain and North Africa. Enjoy the casual elegance of this Half Moon Bay restaurant\u201a��s dining room or lighter fare and live jazz in The Café.<\/p>                       <\/div>  \t<br />           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?hl=en&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f5be13e96046d210&amp;ll=37.457844,-122.43001&amp;spn=0.001874,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?hl=en&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f5be13e96046d210&amp;ll=37.457844,-122.43001&amp;spn=0.001874,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small><br /><br />           <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<span><hr class=\"tour\" /><\/span>  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/maps/place?cid=7702656955480657984&q=hotel&hl=en\">Old Thyme Inn Bed and Breakfast<\/a><br />779 Main Street<br />Half Moon Bay, CA 94019<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/california/half-moon-bay/miramontes-point-rd/2/-half-moon-bay-golf-links?hl=en\">Half Moon Bay Golf Links<\/a><br />2 Miramontes Point Road<br />Half Moon Bay, CA 94019<\/p>  \t<\/div>           <div id=\"cont_tour\">               <br /><a class=\"tour\" href=\"http://www.mezzalunabythesea.com/\">Continue the Tour<\/a>           <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Beach House Hotel"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "beach_house",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "www.beach-house.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">                <p class=\"notes\">                Beach House Hotel - Half Moon Bay is just 30 minutes south of San Francisco in Historic Half Moon Bay. Each ocean loft has identical amenities - the only thing that changes is the view. Beach House is your perfect choice for a mini vacation or corporate retreat. <\/p>              <\/div>             <div id=\"map\" align=\"center\">                 <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?hl=en&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f5b080892bbd7e5b&amp;ll=37.501921,-122.474148&amp;spn=0.001873,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?hl=en&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f5b080892bbd7e5b&amp;ll=37.501921,-122.474148&amp;spn=0.001873,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small>             <\/div>    \t<div id=\"note_2\">    \t\t<p class=\"notes\">    \t\t<hr />    \t\t<b>What's near me?<\/b><br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/california/half-moon-bay/cabrillo-hwy-n/4210/-sam%27s-chowder-house?hl=en\">Sam's Chowder House<\/a><br />4210 Cabrillo Highway North<br />Half Moon Bay, CA 94019<br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/maps/place?cid=9811608294020796430&q=mezza&hl=en\">Mezza Luna<\/a><br />459 Prospect Way<br />Half Moon Bay, CA 94019<\/p>    \t<\/div>             <div id=\"cont_tour\">                 <br /><a class=\"tour\" href=\"http://halfmoonbayinn.com/\">Continue the Tour<\/a>             <\/div>          \n ",
            "type": "here_doc"
         }],
         "state": "inactive"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Fox Theatre"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "little_fox",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.foxdream.com/",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">                Enjoy dance concerts or listening performances by premier electric and acoustic artists from all over the world. Roots, jazz, blues, folk, funk, jam band, bluegrass and world music are presented in this comfortable and elegant world-class venue.<\/p>           <\/div>           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?hl=en&amp;esrch=FT1&amp;ie=UTF8&amp;hq=&amp;hnear=2209+Broadway,+Redwood+City,+CA+94063&amp;gl=us&amp;ei=uZR3S5vgH4jasQOZ4cnLCA&amp;ved=0CAgQ8gEwAA&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f899176297deec3e&amp;ll=37.486497,-122.229638&amp;spn=0.001873,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?hl=en&amp;esrch=FT1&amp;ie=UTF8&amp;hq=&amp;hnear=2209+Broadway,+Redwood+City,+CA+94063&amp;gl=us&amp;ei=uZR3S5vgH4jasQOZ4cnLCA&amp;ved=0CAgQ8gEwAA&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f899176297deec3e&amp;ll=37.486497,-122.229638&amp;spn=0.001873,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small>            <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<hr />  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/california/san-carlos/circle-star-way/3/-homestead-san-francisco-san-carlos?hl=en&gl=us\">Homestead Studio Suite<\/a><br />3 Circle Star Way<br/>San Carlos, CA 94070<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/california/redwood-city/winslow-st/808/-red-lantern?hl=en&gl=us\">Red Lantern<\/a><br />808 Winslow Street<br />Redwood City, CA 94063<\/p>  \t<\/div>            <div id=\"cont_tour\">                <br /><a class=\"tour\" href=\"http://www.broadwaybythebay.org/\">Continue the Tour<\/a>            <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Crystal Springs Golf Course"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "crystal_springs",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "playcrystalsprings.com/",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">              Crystal Springs Golf Course is conveniently located off Highway 280 at Black Mountain Rd. in Burlingame. This public course is set in a beautiful undisturbed wildlife sanctuary in harmony with nature. The course has been recently renovated with new tee boxes, bunkers, and other terrain features.<\/p>                       <\/div>           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?source=embed&amp;hl=en&amp;geocode=&amp;ie=UTF8&amp;hq=&amp;hnear=6650+Golf+Course+Dr,+Hillsborough,+San+Mateo,+California+94010&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f5bfdea75bb3108f&amp;ll=37.562932,-122.386461&amp;spn=0.001871,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?source=embed&amp;hl=en&amp;geocode=&amp;ie=UTF8&amp;hq=&amp;hnear=6650+Golf+Course+Dr,+Hillsborough,+San+Mateo,+California+94010&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00047f5bfdea75bb3108f&amp;ll=37.562932,-122.386461&amp;spn=0.001871,0.00235&amp;z=17\">Get Directions<\/a><\/small>           <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<hr />  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/california/burlingame/bayshore-hwy/1550/-bay-landing-hotel?hl=en\">Bay Landing Hotel<\/a><br />1550 Bayshore Highway<br />Burlingame, CA 94010<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/california/burlingame/broadway/1400/-broadway-grill-restaurant-steak-seafood-pasta-&-live-entertainment?hl=en\">Broadway Grill Restaurant<\/a><br />1400 Broadway<br />Burlingame, CA 94010<\/p>  \t<\/div>           <\/div id=\"cont_tour\">               <br /><a class=\"tour\" href=\"http://www.calkayak.com/\">Continue the Tour<\/a>           <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [{
               "type": "var",
               "val": "sanmateo_select"
            }],
            "modifiers": [
               {
                  "name": "name",
                  "value": {
                     "type": "str",
                     "val": "foo"
                  }
               },
               {
                  "name": "head_image",
                  "value": {
                     "type": "str",
                     "val": ""
                  }
               },
               {
                  "name": "tail_image",
                  "value": {
                     "type": "str",
                     "val": ""
                  }
               }
            ],
            "name": "annotate_search_results",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": "\nfunction sanmateo_select(obj) {          var ftext = $K(obj).data('url');      var urllist = [  \t\"http://www.beach-house.com/\",  \t\"http://www.cetrella.com/\",  \t\"http://www.playcrystalsprings.com/\",  \t\"http://www.foxdream.com/\"      ];  \tfoundmatch = false;  \tfor(i in urllist){  \t\turl = urllist[i];  \t\tif(ftext === url){  \t\t\tfoundmatch = true;  \t\t\tbreak;  \t\t}  \t}  \tif(foundmatch){  \t\treturn \"<span><a target='_blank' href='http://smccvb.com'><img style='border-width:0px 0px 0px 0px;' class='san_mateo' src='http://i259.photobucket.com/albums/hh303/drbabcock/Kynetx/sanmateo_annotate2.png' /><\/a><\/span>\";    \t}  \telse {          false;        }      }               ",
         "foreach": [],
         "name": "search_annotate",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "www.google.com|search.yahoo.com|bing.com",
            "type": "prim_event",
            "vars": []
         }},
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [{
               "type": "var",
               "val": "smccvb_selector"
            }],
            "modifiers": null,
            "name": "percolate",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": "\nsmccvb_data = {  \t\t\"beach-house.com\" : {},  \t\t\"www.beach-house.com\" : {},  \t\t\"halfmoonbayinn.com\" : {},  \t\t\"www.cetrella.com\" : {},  \t\t\"www.mezzalunabythesea.com\" : {},  \t\t\"blazingsaddles.com\" : {},  \t\t\"www.blazingsaddles.com\" : {},  \t\t\"www.gatewaylimousine.com\" : {},  \t\t\"www.foxdream.com\" : {}\t  \t};    function smccvb_selector(obj){  \t\tvar host = $K(obj).data(\"domain\");  \t\t  \t\tvar o = smccvb_data[host];  \t\tif(o){  \t\t\treturn true;  \t\t} else {  \t\t\treturn false;  \t\t}  \t}\t\t              ",
         "foreach": [],
         "name": "search_percolate",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "google.com|search.yahoo.com|bing.com",
            "type": "prim_event",
            "vars": []
         }},
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Half Moon Bay Inn"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "half_moon_bay_inn",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://halfmoonbayinn.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">                <p class=\"notes\">                Our inn is conveniently located on Main St., walking distance to some of Half Moon Bay\u201a��s best restaurants and shops, as well as to Half Moon Bay State Beach. We have 14 luxury guest rooms, all fitted with Italian sheets, down comforters, marble bathrooms, in-room coffee supplies, and free wireless internet service.<\/p>                         <\/div>             <div id=\"maps\" align=\"center\">                 <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?source=s_q&amp;hl=en&amp;geocode=&amp;num=10&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004803d9560ecb2e9be2&amp;ll=37.464427,-122.428819&amp;spn=0.001873,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?source=embed&amp;hl=en&amp;geocode=&amp;num=10&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004803d9560ecb2e9be2&amp;ll=37.464427,-122.428819&amp;spn=0.001873,0.00235&amp;z=17\">Get Directions<\/a><\/small><br />             <\/div>    \t<div id=\"note_2\">    \t\t<p class=\"notes\">    \t\t<span><hr class=\"tour\" /><\/span>    \t\t<b>What's near me?<\/b><br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/maps/place?cid=7062264578927841648&q=restaurant&hl=en\">Pasta Moon<\/a><br />315 Main Street<br />Half Moon Bay, CA 94019<br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/maps/place?cid=6963771303105660129&q=entertainment&hl=en\">Coastal Repertory Theatre<\/a><br />1167 Main Street<br />Half Moon Bay, CA 94019<\/p>    \t<\/div>             <div id=\"cont_tour\">                 <br /><a class=\"tour\" href=\"http://www.cardinalhotel.com/\">Continue the Tour<\/a>             <\/div>          \n ",
            "type": "here_doc"
         }],
         "state": "inactive"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "The Cardinal Hotel"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "cardinal_hotel",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.cardinalhotel.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">                <p class=\"notes\">                Experience Old World charm in vibrant downtown Palo Alto. Built in 1924, the Cardinal was Palo Alto's premiere Hotel. Today the ambience remains; the gracious lobby still provides a delightful glimpse of Old Palo Alto.<\/p>                         <\/div>    \t<br />             <div id=\"map\" align=\"center\">                 <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?source=s_q&amp;hl=en&amp;geocode=&amp;num=10&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004803e389925a97b817&amp;ll=37.444335,-122.161134&amp;spn=0.001874,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?source=embed&amp;hl=en&amp;geocode=&amp;num=10&amp;ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004803e389925a97b817&amp;ll=37.444335,-122.161134&amp;spn=0.001874,0.00235&amp;z=17\">Get Directions<\/a><\/small><br />             <\/div>    \t<div id=\"note_2\">    \t\t<p class=\"notes\">    \t\t<span><hr class=\"tour\" /><\/span>    \t\t<b>What's near me?<\/b>    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/maps/place?cid=12156860197759317333&q=entertainment&hl=en\">Create It Ceramics & Glass Studio<\/a><br />855 El Camino Real<br />Palo Alto, CA 94301<br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ca/palo-alto/ramona-st/642/-coconuts-caribbean-restaurant-bar?hl=en\">Coconuts Caribbean Restaurant &amp; Bar<\/a><br />642 Ramona Street<br />Palo Alto, CA 94301<\/p>    \t<\/div>             <div id=\"cont_tour\">                 <br /><a class=\"tour\" href=\"http://www.sanbenitohouse.com/\">Continue the Tour<\/a>             <\/div>          \n ",
            "type": "here_doc"
         }],
         "state": "inactive"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Mezza Luna"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "mezzaluna",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.mezzalunabythesea.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">              Mezzaluna was opened in the Summer of 1993 by three friends, Roberto, Giovanni and Jose. All three had many years of experience working in restaurants in all parts of the world. They decided to join forces to create an eating environment which would provide the highest quality of meat, fish, produce and pasta, prepared with a Contemporary Southern Italian flair.<\/p>                       <\/div>  \t<br />           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004805041e1082c2f620&amp;ll=37.505121,-122.487012&amp;spn=0.001872,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004805041e1082c2f620&amp;ll=37.505121,-122.487012&amp;spn=0.001872,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small><br />           <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<span><hr class=\"tour\" /><\/span>  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/maps/place?cid=13358049275472947776&q=hotels\">Oceano Hotel and Spa<\/a><br />280 Capistrano Road<br />Half Moon Bay, CA 94019<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/maps/place?cid=5157049421029839444&q=entertainment\">La Nebbia Winery<\/a><br />12341 San Mateo Rd HWY 92<br />Half Moon Bay, CA 94019<\/p>  \t<\/div>           <div id=\"cont_tour\">               <br /><a class=\"tour\" href=\"http://www.acqua-pazza.com/\">Continue the Tour<\/a>           <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "AcquaPazza"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "acqua_pazza",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.acqua-pazza.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">              AcquaPazza brings the warmth and charm of Southern Italy to the Bay Area. Napolitan cuisine is served in an environment where hospitality is the focus. At AcquaPazza, the staff will make you feel instantly welcome as if you were arriving at an old friend's home for dinner; an age-old Italian tradition.<\/p>                       <\/div>  \t<br />           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.000480508f2bc9acb9d21&amp;ll=37.565008,-122.323172&amp;spn=0.001871,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.000480508f2bc9acb9d21&amp;ll=37.565008,-122.323172&amp;spn=0.001871,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small><br /><br />           <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<span><hr class=\"tour\" /><\/span><br />  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/places/us/ca/burlingame/anza-blvd/250/-burlingame-golf-center?hl=en\">Burlingame Golf Center<\/a><br />250 Anza Boulevard<br />Burlingame, CA 94010<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/maps/place?cid=16639936142851372726&q=hotels\">San Mateo Marriott San Francisco Airport<\/a><br />1770 South Amphlett Blvd<br />San Mateo, CA 94402<\/p>  \t<\/div>           <div id=\"cont_tour\">               <br /><a class=\"tour\" href=\"http://www.rotibistro.com/\">Continue the Tour<\/a>           <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Broadway By the Bay"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "broadway_by_the_bay",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.broadwaybythebay.org/(index.html|$)",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">                Broadway By the Bay is a not-for-profit corporation for the public benefit which provides full scale musical theatre productions of professional quality at family prices. The company continues to grow in professionalism, attendance and stature.<\/p>           <\/div>           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00048051090358a621f57&amp;ll=37.595149,-122.366066&amp;spn=0.00187,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\"  href=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00048051090358a621f57&amp;ll=37.595149,-122.366066&amp;spn=0.00187,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small>            <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<hr />  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/places/us/ca/burlingame/bayshore-hwy/1550/-bay-landing-hotel\">Bay Landing Hotel<\/a><br />1550 Bayshore Highway<br />Burlingame, CA 94010<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/places/us/ca/burlingame/bayshore-hwy/1600/-elephant-bar-restaurant\">Elephant Bar Restaurant<\/a><br />1600 Bayshore Highway<br />Burlingame, CA 94010<\/p>  \t<\/div>            <div id=\"cont_tour\">                <br /><a class=\"tour\" href=\"http://www.malibugrandprix.com/\">Continue the Tour<\/a>            <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Malibu Grand Prix"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "malibu_grand_prix",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.malibugrandprix.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">                Acres of fun! Show your friends who's boss as you race wheel-to-wheel into a hairpin turn. Spend some time relaxing on one of the three miniature golf courses. Rediscover your playful side in a state-of-the-art arcade. Malibu is perfect for birthday celebrations and company outings, or just hangin' out.<\/p><br />           <\/div>           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004805132ef0dfb799df&amp;ll=37.492864,-122.217429&amp;spn=0.001873,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://www.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.0004805132ef0dfb799df&amp;ll=37.492864,-122.217429&amp;spn=0.001873,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small>            <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<hr />  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/places/us/ca/redwood-city/main-st/831/-martins-west?hl=en\">Martins West<\/a><br />831 Main Street<br />Redwood City, CA 94063<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://www.google.com/places/us/redwood-city/ca/middlefield-rd/1041/-donato-enoteca?hl=en\">Donato Enoteca<\/a><br />1041 Middlefield Road<br />Redwood City, CA 94063<\/p>  \t<\/div>            <div id=\"cont_tour\">                <br /><a class=\"tour\" href=\"http://www.vinyl-room.com/\">Continue the Tour<\/a>            <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "California Canoe & Kayak"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "cal_kayak",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.calkayak.com",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">              Enjoy a day on the water learning how to paddle a sea kayak with expert instructors. Graduates of this class are qualified to rent closed-deck sea kayaks and participate in more advanced classes and trips. Includes boat, wet suit and paddling gear, and a free coupon for a future rental.<\/p>                       <\/div>           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?ie=UTF8&amp;hl=en&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00048051756ea5080c8f6&amp;ll=37.503453,-122.491089&amp;spn=0.001873,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?ie=UTF8&amp;hl=en&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.00048051756ea5080c8f6&amp;ll=37.503453,-122.491089&amp;spn=0.001873,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small>           <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<hr />  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/maps/place?cid=14094480424331900136&q=restaurants\">Crab Landing<\/a><br />260 Capistrano Road<Br />Half Moon Bay, CA 94019<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ca/half-moon-bay/princeton-ave/346/-inn-at-mavericks?hl=en\">Inn at Mavericks<\/a><br />346 Princeton Avenue<br />Half Moon Bay, CA 94019<\/p>  \t<\/div>           <\/div id=\"cont_tour\">               <br /><a class=\"tour\" href=\"http://www.halfmoonbaygolf.com\">Continue the Tour<\/a>           <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Half Moon Bay Golf Links"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "half_moon_bay_golf",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.halfmoonbaygolf.com/",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">              <p class=\"notes\">              Set against dramatic cliffs overlooking the Pacific Ocean, Half Moon Bay Golf Links features 36 holes of championship golf. For over 30 years, avid golfers have been returning to this incomparable setting, enjoying the variety of play offered by our two award winning courses, The Ocean and The Old.<\/p><br />                    <\/div>           <div id=\"map\" align=\"center\">               <iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.000480522ca207931a2f9&amp;ll=37.435527,-122.437488&amp;spn=0.001874,0.00235&amp;z=17&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps/ms?ie=UTF8&amp;t=h&amp;msa=0&amp;msid=111120295747352835764.000480522ca207931a2f9&amp;ll=37.435527,-122.437488&amp;spn=0.001874,0.00235&amp;z=17&amp;source=embed\">Get Directions<\/a><\/small>           <\/div>  \t<div id=\"note_2\">  \t\t<p class=\"notes\">  \t\t<hr />  \t\t<b>What's near me?<\/b><br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ca/half-moon-bay/miramontes-point-rd/1/-the-ritz-carlton-half-moon-bay\">The Ritz-Carlton, Half Moon Bay<\/a><br />1 Miramontes Point Road<br />Half Moon Bay, CA 94019<br />  \t\t<br />  \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/maps/place?cid=7062264578927841648&q=restaurants%2Bloc:%2B2%2BMiramontes%2BPoint%2BRd,%2BHalf%2BMoon%2BBay,%2BCA%2B94019&hl=en\">Pasta Moon<\/a><br />315 Main Street<br />Half Moon Bay, CA 94019<\/p>  \t<\/div>           <\/div id=\"cont_tour\">               <br /><a class=\"tour\" href=\"http://www.huckfinnsportfishing.com/\">Continue the Tour<\/a>           <\/div>        \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Marriott's MoutainSide"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "mountainside",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.marriott.com/hotels/travel/slcms-marriotts-mountainside/",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">                <p class=\"notes\">                Ski-in/ski-out resort located at the world-class Park City Mountain Resort, a former Olympic venue. Our Park City Mountain ski resort lodging offers heated spas & pool, fitness center and nearby golf. Free shuttle to Main Street with outlet stores, groceries, shopping & the famous Sundance Festival<\/p>              <\/div>             <div id=\"map\" align=\"center\">    \t\t<iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps?hl=en&amp;q=1305+Lowell+Avenue,+Park+City,+Utah+84060&amp;ie=UTF8&amp;ei=v0riS4TRA4yQNu_ZmI4D&amp;ved=0CA4Q_AU&amp;hq=&amp;hnear=1305+Lowell+Ave,+Park+City,+Summit,+Utah+84060&amp;t=h&amp;ll=40.650625,-111.507111&amp;spn=0.014326,0.018797&amp;z=14&amp;iwloc=A&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps?hl=en&amp;q=1305+Lowell+Avenue,+Park+City,+Utah+84060&amp;ie=UTF8&amp;ei=v0riS4TRA4yQNu_ZmI4D&amp;ved=0CA4Q_AU&amp;hq=&amp;hnear=1305+Lowell+Ave,+Park+City,+Summit,+Utah+84060&amp;t=h&amp;ll=40.650625,-111.507111&amp;spn=0.014326,0.018797&amp;z=14&amp;iwloc=A&amp;source=embed\">Get Directions<\/a><\/small>             <\/div>    \t<div id=\"note_2\">    \t\t<p class=\"notes\">    \t\t<hr />    \t\t<b>What's near me?<\/b><br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ut/park-city/empire-ave/1284/-baja-cantina?hl=en\">Baja Cantina<\/a><br />1284 Empire Avenue<br />Park City, UT 84060<br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ut/park-city/main-st/328/-egyptian-theatre?hl=en\">Egyptian Theatre<\/a><br />328 Main Street<br />Park City, UT 84060<\/p>    \t<\/div>             <div id=\"cont_tour\">                 <br /><a class=\"tour\" href=\"http://www.hotelparkcity.com/\">Continue the Tour<\/a>             <\/div>          \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Hotel Park City"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "hotel_park_city",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.hotelparkcity.com/",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">                <p class=\"notes\">                Hotel Park City is located 35 minutes from Salt Lake City International Airport. The award-winning resort layout is edged in native pines and aspens on the spectacular Park City Golf Club.<\/p>              <\/div>             <div id=\"map\" align=\"center\">    \t\t<iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps?q=2001+Park+Ave,+Park+City,+UT+84060&amp;ie=UTF8&amp;hq=&amp;hnear=2001+Park+Ave,+Park+City,+Summit,+Utah+84060&amp;gl=us&amp;ei=vlLiS8vKNYHetAOOxZT8Dg&amp;ved=0CAoQ8gEwAA&amp;t=h&amp;z=14&amp;ll=40.662333,-111.513242&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps?q=2001+Park+Ave,+Park+City,+UT+84060&amp;ie=UTF8&amp;hq=&amp;hnear=2001+Park+Ave,+Park+City,+Summit,+Utah+84060&amp;gl=us&amp;ei=vlLiS8vKNYHetAOOxZT8Dg&amp;ved=0CAoQ8gEwAA&amp;t=h&amp;z=14&amp;ll=40.662333,-111.513242&amp;source=embed\">Get Directions<\/a><\/small>             <\/div>    \t<div id=\"note_2\">    \t\t<p class=\"notes\">    \t\t<hr />    \t\t<b>What's near me?<\/b><br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ut/park-city/park-ave/1900/-squatters-roadhouse-grill?gl=us\">Squatters Roadhouse Grill<\/a><br />900 Park Avenue<br />Park City, UT 84098<br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ut/park-city/sidewinder-dr/1912/-utah-symphony-&-opera?gl=us\">Utah Symphony & Opera<\/a><br />1912 Sidewinder Drive<br />Park City, UT 84060<\/p>    \t<\/div>             <div id=\"cont_tour\">                 <br /><a class=\"tour\" href=\"http://www.treasuremountaininn.com/\">Continue the Tour<\/a>             <\/div>          \n ",
            "type": "here_doc"
         }],
         "state": "active"
      },
      {
         "actions": [{"action": {
            "args": [
               {
                  "type": "str",
                  "val": "Treasure Mountain Inn"
               },
               {
                  "type": "var",
                  "val": "msg"
               }
            ],
            "modifiers": [{
               "name": "sticky",
               "value": {
                  "type": "bool",
                  "val": "true"
               }
            }],
            "name": "notify",
            "source": null
         }}],
         "blocktype": "every",
         "callbacks": null,
         "cond": {
            "type": "bool",
            "val": "true"
         },
         "emit": null,
         "foreach": [],
         "name": "treasure_mountain",
         "pagetype": {"event_expr": {
            "legacy": 1,
            "op": "pageview",
            "pattern": "http://www.treasuremountaininn.com/",
            "type": "prim_event",
            "vars": []
         }},
         "pre": [{
            "lhs": "msg",
            "rhs": " \n<div id=\"note_2\">                <p class=\"notes\">                Completed in 1963, the Treasure Mountain Inn was Utah's first condominium hotel. Park City was still a silver town and the Treasure Mountain Ski Area (now the Park City Mountain Resort) had just opened. The Treasure Mountain Inn stands proud along Main Street as a symbol of Park City's modern era.<\/p>              <\/div>             <div id=\"map\" align=\"center\">    \t\t<iframe width=\"220\" height=\"220\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps?q=Treasure+Mountain+Inn&amp;gl=us&amp;cd=1&amp;ei=eeviS--qGZWysAPKpryHDQ&amp;sig2=yo6sKmXKYCcNdDSRrjhTGQ&amp;sll=40.640972,-111.494303&amp;sspn=0.006295,0.006295&amp;ie=UTF8&amp;hl=en&amp;view=map&amp;cid=8322742607157601688&amp;ved=0CFIQpQY&amp;hq=Treasure+Mountain+Inn&amp;hnear=&amp;t=h&amp;ll=40.64097,-111.494279&amp;spn=0.003582,0.004699&amp;z=16&amp;iwloc=A&amp;output=embed\"><\/iframe><br /><small><a target=\"_blank\" class=\"directions\" href=\"http://maps.google.com/maps?q=Treasure+Mountain+Inn&amp;gl=us&amp;cd=1&amp;ei=eeviS--qGZWysAPKpryHDQ&amp;sig2=yo6sKmXKYCcNdDSRrjhTGQ&amp;sll=40.640972,-111.494303&amp;sspn=0.006295,0.006295&amp;ie=UTF8&amp;hl=en&amp;view=map&amp;cid=8322742607157601688&amp;ved=0CFIQpQY&amp;hq=Treasure+Mountain+Inn&amp;hnear=&amp;t=h&amp;ll=40.64097,-111.494279&amp;spn=0.003582,0.004699&amp;z=16&amp;iwloc=A&amp;source=embed\"\">Get Directions<\/a><\/small>             <\/div>    \t<div id=\"note_2\">    \t\t<p class=\"notes\">    \t\t<hr />    \t\t<b>What's near me?<\/b><br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http:  \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ut/park-city/main-st/250/-wasatch-brew-pub?gl=us\">Wasatch Brew Pub<\/a><br />250 Main Street<br />Park City, UT 84060<br />    \t\t<br />    \t\t<a target=\"_blank\" class=\"near_me\" href=\"http://maps.google.com/places/us/ut/park-city/main-st/508/-phoenix-gallery?hl=en&gl=us\">Phoenix Gallery<\/a><br />508 Main Street<br />Park City, UT 84060<\/p>    \t<\/div>             <div id=\"cont_tour\">                 <br /><a class=\"tour\" href=\"http://halfmoonbayinn.com/\">Continue the Tour<\/a>             <\/div>          \n ",
            "type": "here_doc"
         }],
         "state": "active"
      }
   ],
   "ruleset_name": "a40x1"
}
