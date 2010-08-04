{
   "dispatch": [],
   "global": [{"emit": "\nvar links_with_pictures = jQuery('span:contains(\" pic\")').siblings('a');        function load_an_image(value) {        jQuery.ajax({            url: value,            async: true,            success: function (data) {                 var html_dom = jQuery(data);    \t   var image_url = html_dom.find(\"table[summary='craigslist hosted images'] img:first\").attr(\"src\");    \t   if(image_url != null)    {      \t        \t\t                jQuery(\"a[href='\" + value + \"']\").before(\"<span style='padding:4px;'><img src='\" + image_url + \"' width=75 height=75/>\");                jQuery(\"a[href='\" + value + \"']\").after(\"<\/span\");                jQuery(\"a[href='\" + value + \"']\").parent().attr(\"style\", \"border: 2px solid;padding-top:3px;\");        \t\t}                 }        });            setTimeout(\"JQuery.noop()\", 1000);    }            links_with_pictures.each( function (index) {        $(this).hover(      function () {        load_an_image($(this).attr(\"href\"));      },       function () {    \t$(this).unbind('mouseenter mouseleave');    \t});            });                  "}],
   "meta": {
      "author": "Cid Dennis",
      "description": "\nCraigs List Picture Search View.  Once loaded just hover over link and the picture associated with link will show inline with the search result.    One thing to note is it seems Craigs list does not really like this kind of a feature and will sometime return a 1x1 pixel for the image or no image at all.      So if the image does not show up sorry blame CL for hating its customers.    \n",
      "logging": "on",
      "name": "CraigsList Picture Search view"
   },
   "rules": [{
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
      "emit": null,
      "foreach": [],
      "name": "craigs_list_pic_show",
      "pagetype": {"event_expr": {
         "legacy": 1,
         "op": "pageview",
         "pattern": ".*craigslist.*",
         "type": "prim_event",
         "vars": []
      }},
      "pre": [],
      "state": "active"
   }],
   "ruleset_name": "a93x3"
}
