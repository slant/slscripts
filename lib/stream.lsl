list station_names;
list station_urls;
string station_url;
integer req_channel = 69871;

initialize() {
  llListen(req_channel, "", NULL_KEY, "");
  llSetTouchText("Music");
  llSetText("Touch me to play music", <1,1,1>, 1);

  station_names = [
    "DI Vocal Trance",
    "DI Trance",
    "Radio Nigel"
    ];

  station_urls = [
    "http://scfire-ntc-aa03.stream.aol.com:80/stream/1065",
    "http://scfire-ntc-aa02.stream.aol.com:80/stream/1003",
    "http://stream.radionigel.com:8020/"
    ];
}

default {
  state_entry() {
    initialize();
  }

  on_rez(integer start_param) {
    initialize();
  }

  touch(integer total_number) {
    llDialog(llDetectedKey(0), "Select a channel to listen", station_names, req_channel);
  }

  listen(integer channel, string name, key id, string chosen_station) {
    if (channel == req_channel) {
      integer place;
      place = llListFindList(station_names, [chosen_station]);
      station_url = llList2String(station_urls, place);
      llSetParcelMusicURL(station_url);
      llSetText("Now playing " + chosen_station, <1,1,1>, 1);
    }
  }
}