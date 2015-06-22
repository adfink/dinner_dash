class Search
  def self.items_search(search)
    terms = search.split
    results = []
    terms.each do |term|
      results << Item.search(term).uniq
    end
    sorted = results.flatten.sort_by { |item| -results.count(item) }.uniq
    sorted
  end
end
