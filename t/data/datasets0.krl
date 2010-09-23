// dataset with some rules
ruleset 10 {
   global {
      dataset aaa <- "aaa.json";
      dataset aarp <- "aarp.json";
      dataset fizz_data <- "http://www.foo.com/data.json" cachable;
      dataset foo_data <- "http://www.foo.com/data.json" cachable for 20 minutes;
   }

    rule testa is active {
        select using "/test/" setting()
        replace("test","test");
    }

    rule testb is active {
        select using "/test/" setting()
        replace("test","test");
    }


}
