require 'thor'

class FileOp < Thor
  class_option :verbose, :type => :boolean
  desc 'output FILE_NAME', 'print out the contents of FILE_NAME'
  option :stderr, :type => :boolean
  def output(file_name)
    log("Starting to read file...")
    #options[:stderr] is either true or false depending
    #on whether or not --stderr was passed
    contents = File.read(file_name)
    log("File contents:")
    if options[:stderr]
      log("(in stderr)")
      $stderr.puts contents
    else
      log("(in stdout)")
      $stdout.puts contents 
    end
  end

  no_commands do 
    def log(str)
      puts str if options[:verbose]
    end
  end

  desc 'touch FILE_NAME', 'creates an empty file named FILE_NAME'
  option :chmod, :type => :numeric
  def touch(file_name)
    log("Touching file...")
    f = File.new(file_name, "w")
    f.chmod(options[:chmod]) if options[:chmod]
  end
end

FileOp.start(ARGV)
