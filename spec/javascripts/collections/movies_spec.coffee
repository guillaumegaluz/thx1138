#= require spec_helper

describe "Movies", =>
  beforeEach =>
    @movie1 = new Movie(title: "Bullitt")
    @movie2 = new Movie(title: "The Rock")
    @movie3 = new Movie(title: "The Conversation")
    @movies = new Movies([@movie1, @movie2, @movie3])

  describe "#filter", =>
    describe "when the query is empty", =>
      it "returns an empty array", =>
        query = ""

        @movies.filter(query).length.should.equal(0)

    describe "when the query is only whitespace", =>
      it "returns an empty array", =>
        query = "   "

        @movies.filter(query).length.should.equal(0)

    describe "when there's no match", =>
      it "returns an empty array", =>
        query = "Vertigo"

        @movies.filter(query).length.should.equal(0)

    describe "when there's a match but the case differs", =>
      it "returns an array of movie results", =>
        query = "Bull"

        @movies.filter(query).length.should.equal(1)
        @movies.filter(query)[0].should.equal(movie1)

    describe "when there's a match and the case is the same", =>
      it "returns an array of movie results", =>
        query = "bull"

        @movies.filter(query).length.should.equal(1)
        @movies.filter(query)[0].should.equal(movie1)

    describe "when there's more than one match", =>
      it "returns an array of movie results", =>
        query = "The "

        @movies.filter(query).length.should.equal(2)
        @movies.filter(query)[0].get('title').should.equal("The Rock")
        @movies.filter(query)[1].get('title').should.equal("The Conversation")

  describe "#getRandonMovies", =>
    it "returns an array of 3 movies", =>
      @movies.getRandomMovies().length.should.equal(3)
