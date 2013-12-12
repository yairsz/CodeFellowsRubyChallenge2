class Library
  attr_reader :name
  attr_accessor :shelves,:books
  def initialize(name)
    @name = name
    @shelves = []
  end
  
  def reportAllBooks
    @shelves.each do |shelf|
      shelf.books.each do |book|
        puts book.title , book.author, "\n"
      end
    end
  end
end

class Shelf
  attr_reader :number
  attr_accessor :books
  def initialize(number)
    @number = number
    @books = []
  end
end

class Book
  attr_accessor :title,:author,:atShelf
  def initialize(title,author)
    @title = title
    @author = author
  end
  def enshelf(shelf)
    @atShelf = shelf
    shelf.books << self
  end
  def unshelf
    @atShelf.books.delete(self)
    @atShelf = nil
    self
  end
end
    
sample_books = {
                "Forward the Foundation" => "Isaac Asimov",
                "Foundation and Earth" => "Isaac Asimov",
                "Foundation's Edge"=>"Isaac Asimov"
              }  
              
              
                
george_Bush_Library = Library.new("George H. W. Bush Library")

for i in 1..5
  shelf = Shelf.new(i)
  george_Bush_Library.shelves << shelf
  sample_books.each_pair do |title,author|
    book = Book.new(title, author)
    book.enshelf (shelf)
  end
end

george_Bush_Library.reportAllBooks

unshelved_book = george_Bush_Library.shelves[0].books[0].unshelf

puts "\nUnshelfed: \n", unshelved_book.title , unshelved_book.author, "\n\n\n"

george_Bush_Library.reportAllBooks

       
  