def movie_attributes(overrides = {})
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    director: "Jon Favreau",
    duration: "126 min",
    image_file_name: "ironman.jpg"
  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    stars: 3,
    comment: "I laughed, I cried, I spilled my popcorn!"
  }.merge(overrides)
end

# calling this method without any parameters simply returns the hash of attribute names and values
# the added default hash parameter allows any of the attribute values to be overridden

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    username: "johndoe",
    password: "secretpass",
    password_confirmation: "secretpass",
    admin: false
  }.merge(overrides)
end