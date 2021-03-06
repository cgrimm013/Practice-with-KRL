
ruleset HelloWorld1 {
  meta {
    name "Hello World"
    description <<
      Hello World
    >>
    author ""
    logging on
  }
  dispatch {
  }
  global {
    getname = function (){
      ent:name 
    };
  }
rule HelloWorld {
    select when test1 update_name
    pre {
      name = event:attr("name").klog("our pass in name ");
    }
    {
      noop();
    }
    always{
      set ent:name name;
    }
  }
    rule eventConCat {
    select when test eventOne
            and test eventTwo
    pre {
      attrs = event:attrs().klog("current attrs:");
      last = ent:lastAttrs.klog("last attrs:");
      cheat = attrs.pset(ent:lastAttrs);
    }
    {
      noop();
    }
    always{
      log(ent:lastAttrs);
    }
  }
}