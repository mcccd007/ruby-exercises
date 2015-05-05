require_relative 'spec_helper'
require_relative '../book_database'

RSpec.describe BookDatabase do
  bd = BookDatabase.new
  bd.set_books({ #Need parenthesis here so Ruby doesn't think this is a block
    'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
    'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
    'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
    'William Goldman' => ['The Princess Bride']
  })

  describe "count" do
      it "returns 4 for the count for Frank Herbert" do
        expect(bd.count_books 'Frank Herbert').to eq 4
      end

      it "returns 1 for the count for William Goldman" do
        expect(bd.count_books 'William Goldman').to eq 1
      end
  end

  describe "get" do
    it "returns Dune and Dune Messiah for Frank Herbert" do
      books = bd.get_books "Frank Herbert"
      expect(books).to include 'Dune'
      expect(books).to include 'Dune Messiah'
    end

    it "returns 4 for the count for Frank Herbert" do
      #TODO
    end
  end

  describe "add new" do
    it "adds new book to an existing author" do
      teste = 'Frank Herbert'
      title ='test title'
      bd.add_book teste, title
      finder = bd.get_books teste
      expect(finder).to include 'test title'
    end
  end

  describe "delete" do
    it "removes Dune from Frank Herbert" do
      author = "Frank Herbert"
      title = "Dune"
      bd.delete_book author, title
      expect(bd.find title).to be_nil
    end
  end

  describe "find" do
    it "finds Dune Messiah from Frank Herbert" do
      author = "Frank Herbert"
      title = "Dune Messiah"
      expect(bd.find title).to include author
    end
  end

end
