# vim: set filetype=ruby:
require 'pp'
require 'rubygems'
require 'wirble'
require 'irb/completion'
require 'irb/ext/save-history'

Wirble.init
Wirble.colorize

colors = Wirble::Colorize.colors.merge({
  :object_class => :purple,
  :symbol => :purple,
  :symbol_prefix => :purple
})
Wirble::Colorize.colors = colors

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:SAVE_HISTORY] = 100

# from http://quotedprintable.com/2007/9/13/my-irbrc

# Just for Rails...
if rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN   => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS

  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  #IRB.conf[:IRB_RC] = Proc.new do
  #  ActiveRecord::Base.logger = Logger.new(STDOUT)
  #  ActiveRecord::Base.instance_eval { alias :[] :find }
  #end
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end
