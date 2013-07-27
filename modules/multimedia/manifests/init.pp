class multimedia {
  include multimedia::codecs
  include multimedia::players
}

class multimedia::codecs {
  include rpmfusionrepos

  package {["gstreamer-plugins-ugly",
            "gstreamer-plugins-good",
            "gstreamer-plugins-bad-nonfree",
            "gstreamer-plugins-bad-free-extras",
            "gstreamer-plugins-bad-free",
            "gstreamer-plugins-bad",
            "gstreamer-ffmpeg",
            "ffmpeg"]:

    ensure    => installed,
    subscribe => Class["rpmfusionrepos"]
  }
}

class multimedia::players {
  include rpmfusionrepos

  package { ["vlc", "smplayer"]:
    ensure    => installed,
    subscribe => Class["rpmfusionrepos"]
  }
}
