Given /^the following alumni exist in the system:$/ do |alumni_table|
  alumni_table.hashes.each do |alumnus_hash|
    if alumnus_hash["city"] || alumnus_hash["country"]
       address = Address.new :city => alumnus_hash["city"], :country => alumnus_hash["country"]
    end
    alumnus_hash.delete("city")
    alumnus_hash.delete("country")
    alumnus = Alumnus.new alumnus_hash
    alumnus.address = address
    alumnus.save!
    Sunspot.commit
  end
end

When /^I search using "([^"]*)"$/ do |search_term|
    @search_result = Alumnus.doSearch(search_term)
end

Then /^I should get ([0-9]+) result$/ do |count|
    @search_result.length.should == count.to_i
end