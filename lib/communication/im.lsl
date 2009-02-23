default {
  touch_start(integer total_number) {
    // Instant message the object's owner
    llInstantMessage(llGetOwner(), "I was just touched by " + llDetectedName(0));
  }
}
