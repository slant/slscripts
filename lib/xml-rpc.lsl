string last_touched_by;

default {
  state_entry() {
    llSetText("API Test", <1,1,1>, 1);
    llOpenRemoteDataChannel();
  }

  touch_start(integer num_count) {
    last_touched_by = llDetectedName(0);
    llOwnerSay("Last touched by " + (string)last_touched_by);
  }

  remote_data(integer type, key channel, key message_id, string sender, integer ival, string sval) {
    if (type == REMOTE_DATA_CHANNEL) {
      llOwnerSay("Communication channel: " + (string)channel);
    }
    if (type == REMOTE_DATA_REQUEST) {
      llOwnerSay(sval);
      llRemoteDataReply(channel, message_id, "Last touched by " + last_touched_by, 0);
    }
  }
}
