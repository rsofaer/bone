class App.Views.Things extends App.View
  template: JST['templates/things']
  className: 'things'
  initialize: (opts) ->
    super opts

    {@thingState} = opts

    _.each ['add', 'remove', 'reset', 'change'], (event) =>
      @listenTo @collection, event, => @render()

  thingsToShow: ->
    @collection.filter (thing) =>
      (@thingState == 'checked') == thing.get('checked')
