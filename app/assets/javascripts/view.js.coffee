class App.View extends Backbone.View
  render: ->
    # Return ourself for chaining
    _.tap @, =>
      # Render our template, using our model's attributes if available
      @$el.html @template @model?.attributes

