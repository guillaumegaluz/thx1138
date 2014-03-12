#= require spec_helper

describe "Movies", =>
  describe "#filter", =>
    it "returns a filtered array of movies", =>
      movie1 = new Movie(title: "Bullitt")
      movie2 = new Movie(title: "The Rock")
      movie3 = new Movie(title: "The Conversation")
      movies = new Movies([movie1, movie2, movie3])

      movies.filter("Bull").should.equal([movie1])
