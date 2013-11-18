class App.View extends Backbone.View
  render: ->
    # Return ourself for chaining
    _.tap @, =>
      # Render our template, using our model's attributes if available
      # as well as any helpers
      attrs = _.cloneDeep (@model?.attributes || {})
      @$el.html @template _.extend attrs, @helpers

