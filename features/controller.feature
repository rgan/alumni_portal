Feature: Create a new alumnus using json
  Scenario: Should be able to create new alumni
      When I create the following alumnus in json format:
        """
		{
		 "first_name": "John",
		 "last_name": "Doe",
		 "ug_college": "CMC Vellore",
		 "pg_college": "Loma Linda",
		 "specialty" : "Internal medicine"
		}
		"""
      Then the response JSON should contain the following key-value pairs:
        """
		{
		 "first_name": "John",
		 "last_name": "Doe",
		 "ug_college": "CMC Vellore",
		 "pg_college": "Loma Linda",
		 "specialty" : "Internal medicine"
		}
     	"""
  Scenario: Should be able to create and find new alumni
      When I create the following alumnus in json format:
        """
		{
		 "first_name": "John",
		 "last_name": "Doe",
		 "ug_college": "CMC Vellore",
		 "pg_college": "Loma Linda",
		 "specialty" : "Internal medicine"
		}
		"""
	  When I submit search request with text "Doe"
      Then the response JSON array should contain the following key-value pairs:
        """
		[{
		 "first_name": "John",
		 "last_name": "Doe",
		 "ug_college": "CMC Vellore",
		 "pg_college": "Loma Linda",
		 "specialty" : "Internal medicine"
		}]
		"""