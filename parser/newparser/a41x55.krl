{
   "dispatch": [
      {"domain": "google.com"},
      {"domain": "bing.com"}
   ],
   "global": [{"emit": "\nKOBJ.annotate_local_search_results = function(annotate, config, cb) {    \tvar defaults = {    \t\t\"name\": \"KOBJL\",    \t\t\"results_lister\" : \"#results td:last-child:has(h4),.g .ts table.ts:has(cite) tr,.g>table tbody tr td:has(h3),.sc_ol1li, #srs_orderedList>.llsResultItem,.res.sc-ng.sc-lc-bz-m div.content>ol>li,#yls-rs-res tbody tr .yls-rs-bizinfo,.vcard\"    \t};        \tif (typeof config === 'object') {    \t\tjQuery.extend(defaults, config);    \t}    \tfunction runAnnotate(){    \t\tvar count = 0;    \t\t$K(defaults['results_lister']).each(function() {        \t\t\tvar toAnnotate = this;    \t\t\t    \t\t\tvar phoneTemp = $K(toAnnotate).find(\"nobr,.sc_hl1 li>:not(a),.tel,[id *= lblPhone]\").text().replace(/[\\u00B7() -]/g, \"\");    \t\t\tvar domainTemp = $K(toAnnotate).find(\".url\").text().replace(/www\\./,\"\");    \t\t\tif(domainTemp===\"\"){    \t\t\t\tdomainTemp = $K(toAnnotate).find(\"cite\").text().replace(/www\\./,\"\").replace(/[\\s-]/g,\"\");    \t\t\t}    \t\t\tif(phoneTemp===\"\"){    \t\t\t\tphoneTemp = $K(toAnnotate);    \t\t\t\tphoneTemp = phoneTemp.text().match(/\\(\\d{3}\\)\\s\\d{3}-\\d{4}/,\"$1\");    \t\t\t\tphoneTemp = phoneTemp[0];    \t\t\t\tphoneTemp = phoneTemp.replace(/[() -]/g, \"\");    \t\t\t}        \t\t\tvar heightTemp = $K(toAnnotate).height();    \t\t\t$K(toAnnotate).data(\"phone\",phoneTemp);    \t\t\t$K(toAnnotate).data(\"domain\",domainTemp);    \t\t\t$K(toAnnotate).data(\"height\",heightTemp);            \t\t\tif(heightTemp > 60){    \t\t\t\t$K(toAnnotate).data(\"compact\",false);    \t\t\t} else {    \t\t\t\t$K(toAnnotate).data(\"compact\",true);    \t\t\t}        \t\t\tvar contents = annotate(toAnnotate);    \t\t\tif (contents) {    \t\t\t\tcount++;    \t\t\t\t$K(\":last\",this).after(contents);    \t\t\t}    \t\t});    \t    \t\tKOBJ.logger('annotated_search_results', config['txn_id'], count, '', 'success', config['rule_name'] );    \t\tcb();    \t}        \trunAnnotate();        \t  \tif(typeof je === \"object\" && je.zz){    \t\tvar gResultDone = je.zz;    \t\tje.zz = function(a, b){    \t\t\tgResultDone(a, b);    \t\t\trunAnnotate();    \t\t};    \t}    };                              "}],
   "meta": {
      "logging": "off",
      "name": "runtime-addition-local-search"
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
      "emit": "\nbusinessData = {    \t'8014929012': 'www.bobstowing.com',  \t'8017565883': 'www.geneharvey.com',  \t'8013415088': 'www.bobstowing.com',  \t'4162912868': 'www.bobstowing.com',  \t'8012255404': 'www.geneharvey.com'  };    domainData = {  \t'www.geneharvey.com': {'url':'www.geneharvey.com'},  \t'www.bobstowing.com': {'url':'www.bobstowing.com'}  };        my_selector = function(obj){    \tdomain = $K(obj).data(\"domain\");  \tphone = $K(obj).data(\"phone\");  \tcompact = $K(obj).data(\"compact\");  \theight = $K(obj).data(\"height\");    \tconsole.log(\"Domain:\",domain,\"\\nPhone:\",phone);\t    \tvar p = businessData[phone];  \tif(!p){  \t\tp = domainData[domain];  \t\tif(p){  \t\t\tp = businessData[p];  \t\t}  \t}  \tif((p && compact)|| Math.floor(Math.random()*3+1) == 1) {  \t\treturn \"<a href='http://www.bbb.org'><img src='http://k-misc.s3.amazonaws.com/resources/a8x17/bbbaccredited.png' border='0'/><\/a>\";  \t} else if(p && !compact) {  \t\treturn \"<img src='http://k-misc.s3.amazonaws.com/resources/a8x17/bbb-full.jpg' />\";  \t} else {  \t\treturn false;  \t}  };      KOBJ.annotate_local_search_results(my_selector, {}, function(){});            ",
      "foreach": [],
      "name": "localannotate",
      "pagetype": {"event_expr": {
         "legacy": 1,
         "op": "pageview",
         "pattern": "www.google.(ca|com)|www.bing.com|search.yahoo.com|ca.local.yahoo.com|local.yahoo.com",
         "type": "prim_event",
         "vars": []
      }},
      "state": "active"
   }],
   "ruleset_name": "a41x55"
}
