{
   "dispatch": [],
   "global": [
      {
         "cachable": {
            "period": "minutes",
            "value": "5"
         },
         "datatype": "JSON",
         "name": "searchBackTweets",
         "source": "http://backtweets.com/search.json?key=23783944b830fb6986bc&q=",
         "type": "datasource"
      },
      {
         "content": ".kGrowl-notification a { color: #0099CC; }    \t    \t.kGrowl-notification { color: #737373; }    \t    \t.KOBJ_tweetItems { margin: 10px; border-bottom: 1px dashed #D2DADA; padding-bottom: 10px; }        \t#KOBJ_tweetList { list-style-position:outside; margin: 0; padding: 0; list-style-type: none; list-style-image: none; }        \t.KOBJ_tweetDiv { height: 300px; overflow-x: auto; overflow-y: auto; background-color: #222; opacity: 0.8; }    \t    \t.KOBJ_tweetDiv p { background: none; color: #FFFFFF; font-family:arial,sans-serif; font-size: 9pt; }    \t    \t.KOBJ_tweetDiv a { color: #0099CC; }        \t.KOBJ_tweetDiv li { list-style-position; list-style-type: none; padding-left: none }        \t#KOBJ_tweetLogo { background-image: url(\"http:\\/\\/k-misc.s3.amazonaws.com/resources/a41x57/header_sweetter.jpg\"); height: 115px; display: block; margin-bottom: 10px; }    \t    \t.KOBJ_tweetedImage { float: left; margin-right: 10px; margin-top: 5px; }        \t.KOBJ_tweetedUser {  }    \t    \t.KOBJ_tweetedTweet {  }        ",
         "type": "css"
      }
   ],
   "meta": {
      "logging": "off",
      "name": "Acxiom Sweetter"
   },
   "rules": [{
      "actions": null,
      "blocktype": "every",
      "callbacks": null,
      "cond": {
         "type": "bool",
         "val": "true"
      },
      "emit": null,
      "foreach": [],
      "name": "backtweets",
      "pagetype": {"event_expr": {
         "legacy": 1,
         "op": "pageview",
         "pattern": ".*",
         "type": "prim_event",
         "vars": []
      }},
      "post": {
         "cons": [null],
         "type": null
      },
      "pre": [
         {
            "lhs": "url",
            "rhs": {
               "args": [{
                  "type": "str",
                  "val": "caller"
               }],
               "predicate": "env",
               "source": "page",
               "type": "qualified"
            },
            "type": "expr"
         },
         {
            "lhs": "domain",
            "rhs": null,
            "type": "expr"
         }
      ],
      "state": "active"
   }],
   "ruleset_name": "a41x57"
}
