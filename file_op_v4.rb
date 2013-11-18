require 'thor'

class FileOp < Thor
  desc 'output FILE_NAME', 'print out the contents of FILE_NAME'
  option :stderr, :type => :boolean
  def output(file_name)
    #options[:stderr] is either true or false depending
    #on whether or not --stderr was passed
    contents = File.read(file_name)
    if options[:stderr]
      $stderr.puts contents
    else
      $stdout.puts contents 
    end
  end

  desc 'touch FILE_NAME', 'creates an empty file named FILE_NAME'
  option :chmod, :type => :numeric
  def touch(file_name)
    f = File.new(file_name, "w")
    f.chmod(options[:chmod]) if options[:chmod]
  end
end

FileOp.start(ARGV)
