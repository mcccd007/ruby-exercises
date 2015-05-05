class CountLeaves
  def count_leaves c
    if c.is_a? Array
      count_array c
    elsif c.is_a? Hash
      count_hash c
    else
      1
    end
  end

  private

  def count_array c
    return 0 if c == []
    first = c.shift
    count_leaves(first) + count_array(c)
  end

  def count_hash c
    return 0 if c == {}
    first = c.shift
    return count_leaves(first[1]) + count_leaves(c)
  end
end
