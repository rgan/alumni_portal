When /^I create the following alumnus in json format:$/ do |input_json|
  post("/alumni.json", { :alumnus => JSON.parse(input_json)})
end

When /^I submit search request with text "([^"]*)"$/ do |search_text|
   get "/alumni/search/" + search_text + ".json"
end

Then /^the response JSON should contain the following key-value pairs:$/ do |result|
  expectedJSON = JSON.parse(result)
  actualJSON = JSON.parse(last_response.body)
  containsKeysWithValue(expectedJSON, actualJSON).should be_true
end

Then /^the response JSON array should contain the following key-value pairs:$/ do |result|
  expectedJSONArray = JSON.parse(result)
  actualJSONArray = JSON.parse(last_response.body)
  similarJsonArrays(expectedJSONArray, actualJSONArray).should be_true
end

def similarJsonArrays(expectedJSONArray, actualJSONArray)
  actualJSONArray.size.should >= expectedJSONArray.size
  expectedJSONArray.select {|expectedJSON|
      actualJSONArray.find { |actualJSON|
         containsKeysWithValue(expectedJSON, actualJSON)
    }
  }.size == expectedJSONArray.size
end

def containsKeysWithValue(expectedJSON, actualJSON)
  expectedJSON.select{|key, value|  value != actualJSON[key] }.size == 0
end