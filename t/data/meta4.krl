// adding name to meta
ruleset 10 {

    meta {
      name "Ruleset for Orphans"
      description <<
Ruleset for testing something or other.
      >>
    }

    rule test0 is active {
        select using "/test/" setting()

	alert("hello");
    }
}
