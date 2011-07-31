Given /^the following alumni exist in the system:$/ do |alumni_table|
  alumni_table.hashes.each do |alumnus_hash|
    alumnus = Alumnus.new alumnus_hash
    alumnus.save!
  end
end

When /^I search using "([^"]*)"$/ do |search_term|
    @search_result = Alumnus.doSearch(search_term)
end

Then /^I should get ([0-9]+) result$/ do |count|
    @search_result.total.should == count
end