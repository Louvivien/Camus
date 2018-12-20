class HomeController < ApplicationController
  
 def initialize
    @db = EPUB::Search::Database.new(File.join('./lib/epub-search/db', EPUB::Search::Database::DIR_NAME))
  end

  def index(force=true)
  	$stderr.puts "create database #{@db.db_file}"
    @db.init force
    if force
      exit_time_file = @db.db_dir.join('../exittime')
      exit_time_file.delete if exit_time_file.exist?
    end
  end

  def create 
  	result = @db.search("search word")
  	puts result
  end


  def show
  end

end
