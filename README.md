# THX 1138

http://thx1138.herokuapp.com

### The Name

[THX 1138](http://en.wikipedia.org/wiki/THX_1138) is a 1971 movie directed by George Lucas - his first film as a director. It was filmed in many locations around San Francisco, but somehow didn;t figure in the database used for this app!

### The Stack

##### Back-end
**Ruby on Rails**, with **Haml** for the views and **SASS** for the stylesheets.

The back-end is pretty slim: 2 models (Movie and Shooting, with a one-to-many relationship). Two main endpoints: `GET /movies` and `GET /shootings/:movie_id`.  
I hesitated between Rails and Sinatra (Sinatra is better dimensioned for this case), but I wanted to benefit from the built-in asset pipeline and not have to configure Sprockets...

##### Front-end
**Backbone.js**, with **Coffeescript**, and **Haml Coffee** for the templates. I used **Google Maps API** for the map interaction and **Geocoding API** to get coordinates from an address. 

On page load, movies are stored in JS objects, and it's only when a movie is selected that an AJAX request is made to the server to get the shooting locations.

A central part of the app is the `PageState` Backbone model: it knows about the search query, the results, the current movie, etc. In a nutshell: upon user action, a backbone view will change an attribute of `pageState`. Backbone views will in turn listen to events triggered by pageState and update themselves.

### Miscellaneous

##### Autocomplete

I decided to implement the autocomplete feature myself. I could have used a plugin but I thought it would be fun to use Backbone to do it. It didn't turn out to be as hard as I thought eventhough I don't currently support keyboard events ('Enter' to submit forn, 'up' and 'down' arrows to navigate results)

##### Suggestions

I added 3 movie suggestions under the search input. The change when the page reloads or when a movie is resetted. It seems like a detail feature but it turned out to be crucial in the development of the app: because they are randomly taken from the pool of movies, it allowed me to "test" the app with various movies, instead of picking always the same (Vertigo, The Rock, Bullitt, etc). It helped me find (and fix) some display interesting bugs: long titles, no actors, etc

##### A quick win

For some movies, few markers were being displayed on the map, while the Data SF database was showing many more shootings. The reason was that - for example - "3355 Geary Blvd" is just not specific to San Francisco. I fixed that by appending "San Francisco, CA" to every geocode request. It definitely improved the quality of coordinate generation! [commit c8ab580b74](https://github.com/guillaumegaluz/thx1138/commit/c8ab580b742663cb862e7301014c8e44196a71a8)

