
# This is a response to the second part of the code fellows coding challenge, we are writing a simple model of a library

class Library
  #generate accessors for the instance variables
  attr_reader :name #is read-only
  attr_accessor :shelves,:books
  #initialize method, takes a name and creates an empty array of shelfs
  def initialize(name)
    @name = name
    @shelves = []
  end
  
  #the report all books method iterates through the shelfs and puts each one of the books in them
  def reportAllBooks
    @shelves.each do |shelf|
      shelf.books.each do |book|
        puts book.title , book.author, "\n"
      end
    end
  end
end


class Shelf
  #generate accessors for the instance variables
  attr_reader :number #is read-only
  attr_accessor :books
  
  #initialize method, takes a number and creates an empty array of books
  def initialize(number)
    @number = number
    @books = []
  end
end

class Book
  
  #generate accessors for the instance variables
  attr_accessor :title,:author,:atShelf
  
   #initialize method, takes a title and author, books are initialized "unshelfed"
  def initialize(title,author)
    @title = title
    @author = author
  end
  
  #the enshelf method takes a Shelf and adds the book to the shelfs book array and keeps a pointer to the shelf
  def enshelf(shelf)
    @atShelf = shelf
    shelf.books << self
  end
  
  #the unshelf method deletes the book from the Shelf and removes the pointer to Shelf. 
  #the method returns the unshelved book so it can be used
  
  def unshelf
    @atShelf.books.delete(self)
    @atShelf = nil
    self
  end
end

#we will only have three different books because, honestly, there aren't any other books worth reading
sample_books = {
                "Foundation" => "Isaac Asimov",
                "Foundation and Earth" => "Isaac Asimov",
                "Foundation's Edge"=>"Isaac Asimov"
              }  
              
              
#create a library for president bush, he could learn a lot from Isaac Asimov

george_Bush_Library = Library.new("George H. W. Bush Library")

#create five shelfs each one with three books on them
for i in 1..5
  shelf = Shelf.new(i)
  george_Bush_Library.shelves << shelf
  sample_books.each_pair do |title,author|
    book = Book.new(title, author)
    book.enshelf (shelf)
  end
end

#let's see all our books
george_Bush_Library.reportAllBooks

# let's try unshelving the first book, I feel like starting the trilogy again...
unshelved_book = george_Bush_Library.shelves[0].books[0].unshelf

#what book did we unshelf?
puts "\nUnshelfed: \n", unshelved_book.title , unshelved_book.author, "\n\n\n"

#did we really unshelf it?
george_Bush_Library.reportAllBooks

       
  
