// adding name and author to meta
ruleset 10 {

    meta {
      name "Ruleset for Orphans"
      author "Phil Windley <pjw@kynetx.com>"
      description <<
      Ruleset for testing something or other.
      >>
    }

    rule test0 is active {
        select using "/test/" setting()


        pre {
	}     

        float("absolute", "top: 10px", "right: 10px",
              "/cgi-bin/weather.cgi?city=" + city + "&tc=" + tc);

    }
}
