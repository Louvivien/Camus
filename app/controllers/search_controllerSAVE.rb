class SearchController < ApplicationController

def initialize
	@word = "condition"
	@db = EPUB::Search::Database.new(File.join('./lib/epub-search/db', EPUB::Search::Database::DIR_NAME))
 end




def index(color=$stdout.tty?)
    highlight = [true, 'always'].include? color
    highlight = $stdout.tty? if color == 'auto'
    @db.search @word, @book do |result|
      EPUB::Search::Formatter::CLI.new(result, @word, highlight).format
    @list = @db.books
    puts @list
    end
 end

end
