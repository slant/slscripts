string owner_email = "user@domain.com";

default {
  touch_start(integer total_number) {
    // Email the object's owner
    llEmail(owner_email, "[Second Life] An object was touched", "Touched by: " + llDetectedName(0));
  }
}
