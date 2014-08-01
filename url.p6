#!/usr/bin/env perl6

use v6;

grammar URL {
  rule TOP { <scheme> '://' <authority> <path> <query> <fragment> }

  rule authority { [<userinfo> '@']? <host> [':'<port>]? }
  rule path { [ '' | '/' | '/' <path-component>+ % '/' ['/']?]}
  rule userinfo { <username> [':' <password> ]? }
  rule host { <host-component>+ % '.' }
  rule query { ['?' <query-pair>* % \&]?}
  rule fragment { ['#' <fragment-data>]? }


  rule query-pair { <param-name> '=' <param-value> }

  token fragment-data { \w+ }
  token param-name { \w+ }
  token param-value { \w+ }
  token host-component { \w+ }
  token path-component { \w+ }
  token username { \w+ }
  token password { \w+ }
  token scheme { \w+ }
  token port { \d+ }
  token ws { '' }
}

say URL.parse("ftp://user:password@www.google.com/foo/bar/baz?foo=bar&baz=qux#hello")

