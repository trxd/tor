#!/bin/sh

get_latest_release() {
  #curl --silent "https://api.github.com/repos/$1/tags" | # Get latest release from GitHub api
  #  grep '"name":' | grep 'tor-' |                       # Get tag line
  #  sed -E 's/.*"tor-([^"]+)".*/\1/' |                   # Pluck JSON value
  #  sort -rV | head -n 1
  curl -sL https://gitweb.torproject.org/tor.git/plain/ReleaseNotes |
      grep -E -m10 '^Changes in version\s[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\s' |
      sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*$/\1/' |
      sort -rV |
      head -n 1
}

get_latest_release "$@"
