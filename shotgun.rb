ROOT_DIR = File.expand_path(File.dirname(__FILE__))

$:.unshift(*Dir[File.join(ROOT_DIR, "*", "lib")])

require "cuba"
require "cuba/contrib"
require "ohm"
require "ohm/contrib"
require "mote"
require "shotgun"
require "thin"
require "ffaker"
require "pry"
require "spawn"
require "shield"
