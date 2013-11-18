require 'thor'

class FileOp < Thor
  desc 'output FILE_NAME', 'print out the contents of FILE_NAME'

  def output(file_name)
    puts File.read(file_name)
  end
end

FileOp.start(ARGV)
