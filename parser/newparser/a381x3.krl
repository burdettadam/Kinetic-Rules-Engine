{"global":[],"dispatch":[{"domain":"google.com"}],"ruleset_name":"a381x3","rules":[{"blocktype":"every","emit":null,"pre":[{"rhs":{"val":"goog","type":"str"},"type":"expr","lhs":"ticker"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"last","type":"qualified"},"type":"expr","lhs":"last"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"open","type":"qualified"},"type":"expr","lhs":"open"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"high","type":"qualified"},"type":"expr","lhs":"high"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"low","type":"qualified"},"type":"expr","lhs":"low"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"volume","type":"qualified"},"type":"expr","lhs":"volume"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"previous_close","type":"qualified"},"type":"expr","lhs":"previous_close"},{"rhs":{"source":"stocks","args":[{"val":"ticker","type":"var"}],"predicate":"name","type":"qualified"},"type":"expr","lhs":"name"},{"rhs":{"source":"stocks","args":[{"val":"^DJI","type":"str"}],"predicate":"last","type":"qualified"},"type":"expr","lhs":"current_price"},{"rhs":{"source":"stocks","args":[{"val":"^DJI","type":"str"}],"predicate":"change","type":"qualified"},"type":"expr","lhs":"change"},{"rhs":{"source":"stocks","args":[{"val":"^DJI","type":"str"}],"predicate":"name","type":"qualified"},"type":"expr","lhs":"name"},{"rhs":" \nName: #{name}<br/>          Change: #{change}<br/>  \tCurrent_price: #{current_price}<br/>          <style>            .KOBJ_message { font-size: 16px; }            .KOBJ_header { font-size: 20px !important; }          <\/style>            \n ","type":"here_doc","lhs":"msg"},{"rhs":" \n<br/>  \t<br/>          Ticker: #{ticker}<br/>          Last: #{last}<br/>          Open: #{open}<br/>          High: #{high}<br/>          Low: #{low}<br/>          Volume: #{volume}<br/>          Previous Close: #{previous_close}<br/>          Name: #{name}<br/>          <style>            .KOBJ_message { font-size: 18px; }            .KOBJ_header { font-size: 24px !important; }          <\/style>            \n ","type":"here_doc","lhs":"msg2"}],"name":"newrule","callbacks":null,"state":"active","pagetype":{"foreach":[],"event_expr":{"vars":[],"pattern":".*","op":"pageview","type":"prim_event","legacy":1}},"cond":{"val":"true","type":"bool"},"actions":[{"action":{"source":null,"args":[{"val":"Stock Information","type":"str"},{"op":"+","args":[{"val":"msg","type":"var"},{"val":"msg2","type":"var"}],"type":"prim"}],"name":"notify","modifiers":null}}]}],"meta":{"author":"Nathan Whiting","description":"\nTracks The Stocks Based on the Web Site     \n","name":"StockTracker","logging":"on"}}