
class SayHello

  def perform
  	@db = EPUB::Search::Database.new('./lib/epub-search/db')
  	@db.init
  	@db.add "/home/louvivien/vivien/sem9dimanche/epub/lib/epub-search/db/1.epub"
  	list = @db.books

  end

  def list
  	@db = EPUB::Search::Database.new('./lib/epub-search/db')
  	list = @db.books
  end


   def search(color=$stdout.tty?)
    highlight = [true, 'always'].include? color
    highlight = $stdout.tty? if color == 'auto'
  	@db = EPUB::Search::Database.new('./lib/epub-search/db')
  	@word = "condition"

	@db.search @word do |result|
      EPUB::Search::Formatter::CLI.new(result, @word, highlight).format
    end
    
  end

end