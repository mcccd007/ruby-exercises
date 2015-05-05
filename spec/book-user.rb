#require_relative 'spec_helper.rb'
require_relative '../book_database'


RSpec.describe BookDatabase do
any = BookDatabase.new
any.set_books({ #Need parenthesis here so Ruby doesn't think this is a block
  'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
  'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
  'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
  'William Goldman' => ['The Princess Bride']
  })


describe "count" do
  it "counts the number of books by the author in the db" do
    expect(any.count_books 'Frank Herbert').to eq 4
  end

  it "counts the number of books by william goldman" do
    expect(any.count_books 'William Goldman').to eq 1
  end
end

end
