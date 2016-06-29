def movie_attributes(overrides = {})
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02"
  }.merge(overrides)
end

# calling this method without any parameters simply returns the hash of attribute names and values
# the added default hash parameter allows any of the attribute values to be overridden