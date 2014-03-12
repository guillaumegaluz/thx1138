#= require spec_helper

describe "Movie", =>
  describe "#actorsToString", =>
    describe "when the movie has no actor", =>
      it "returns an empty string", =>
        movie = new Movie()

        movie.actorsToString().should.equal("")

    describe "when the movie has one actor", =>
      it "returns the string containing the actor's name", =>
        movie = new Movie(actor_1: "Woody Allen")

        movie.actorsToString().should.equal("Woody Allen")

    describe "when the movie has two actors", =>
      it "returns the string containing the actors' names", =>
        movie = new Movie(actor_1: "Steve McQueen", actor_2: "Jacqueline Bisset")

        movie.actorsToString().should.equal("Steve McQueen, Jacqueline Bisset")

    describe "when the movie has three actors", =>
      it "returns the string containing the actors' name", =>
        movie = new Movie(actor_1: "Sean Penn", actor_2: "Emile Hirsch", actor_3: "Josh Brolin")

        movie.actorsToString().should.equal("Sean Penn, Emile Hirsch, Josh Brolin")
