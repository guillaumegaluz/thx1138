class @Movie extends Backbone.Model
  actorsToString: =>
    string = ""
    string += "#{@get('actor_1')}"    if @get('actor_1')
    string += ", #{@get('actor_2')}"  if @get('actor_2')
    string += ", #{@get('actor_3')}"  if @get('actor_3')
    string
