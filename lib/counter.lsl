integer counter = 0; // Initially set counter to 0
string last_touched_by = ""; // Initially set last_touched_by to blank

default {

  state_entry() {
    llSetText("Never been touched",<1,1,1>, 1);
    llOwnerSay("Counter initialized. Setting initial count to " + (string)counter);
  }

  touch_start( integer total_number ) {
    counter++;

    llSetText("Touched " + (string)counter + " times", <1,1,1>, 1);

    if (counter == 1) {
      llOwnerSay( "I am being touched by " + llDetectedName(0) +
        ". I've been touched " + (string)counter + " time.");
    } else {
      llOwnerSay( "I am being touched by " + llDetectedName(0) +
        ". I've been touched " + (string)counter + " times.");
    }

    llOwnerSay("I was last touched by " + last_touched_by);

    last_touched_by = llDetectedName(0);
    llLoadURL(llDetectedKey(0), "Cylence Web Design", "http://cylenceweb.com");
  }

}
