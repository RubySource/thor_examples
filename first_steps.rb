require 'thor'

class SayHi < Thor
  desc "hi NAME", "say hello to NAME"

  def hi(name)
    puts "Hi #{name}!"
  end
end

SayHi.start(ARGV)
