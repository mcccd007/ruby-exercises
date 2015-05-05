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
    #TODO finish
  end

  def count_hash c
    return 0 if c == {}
    #TODO finish
  end
end
