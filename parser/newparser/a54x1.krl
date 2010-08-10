{"global":[],"dispatch":[{"domain":"ipac.slco.lib.ut.us"}],"ruleset_name":"a54x1","rules":[{"blocktype":"every","emit":"\nvar DVD = 2;    var BOOK = 1;    var AUDIOBOOK = 3;      var availability = \"no availability determined\";    var holds = 0;    var available = 0;    var format = null;      var spignet = {      get_libitem_availability: function() {        $K(\"td\").each(function() {          if ($K(this).text().match(/^Holds/)) {            holds = $K(this).parent().text().match(/\\d+/);          }          if ($K(this).text().match(/^Available/)) {            available = $K(this).parent().text().match(/\\d+/);          }          if (format == null && $K(this).parent().text().match(/^Format/)) {            if ($K(this).parent().html().match(/ipac_dvd\\.jpg/)) {              format = DVD;            }            else if ($K(this).parent().html().match(/ipac_book_icon\\.gif/)) {              format = BOOK;            }          }        });          if (available > 0) {                  if (holds < available) {            availability = \"Available Now\";          }                  else if (available >= holds/2) {            availability = \"Short Wait\";          }                  else if (available < holds/2) {            availability = \"Long Wait\";          }        }        console.log(availability);        return availability;      }    };          ","name":"slc_book_dvd_availability","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":"http://ipac\\.slco\\.lib\\.ut\\.us\\/.*link=","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Current Availability","type":"str"},{"val":"#{spignet.get_libitem_availability()}","type":"str"}],"name":"notify","modifiers":[{"name":"sticky","value":{"val":"true","type":"bool"}}]}}]}],"meta":{"author":"Steve Spigarelli","description":"\nShow availability for items at the Salt Lake County Library    \n","name":"Salt Lake County Item Availability","logging":"off"}}
