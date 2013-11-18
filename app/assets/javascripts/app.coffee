# All of our application's state lives in this object
window.App =
  Collections: {}
  Models: {}
  Views: {}
  start: ->
    console.log "App starting..."

    @things = new @Collections.Things
    @things.fetch().then =>
      @renderViews()
    .then =>
      @setupEvents()
    .then =>
      @setupAjax()
    .then null, (err) =>
      console.log "Error starting app: #{err}"

  renderViews: ->
    @inspectorView = new @Views.Inspector
      el: '#inspector'
    .render()

    @checkedThingsView = new @Views.Things
      el: '#checked-things'
      thingState: 'checked'
      collection: @things
    .render()

    @uncheckedThingsView = new @Views.Things
      el: '#unchecked-things'
      thingStatue: 'unchecked'
      collection: @things
    .render()

  setupEvents: ->
    thingViews = [@checkedThingsView, @uncheckedThingsView]
    _.each thingViews, (view) =>
      view.on 'select', (thing) =>
        # Clear selection on the other list
        (_.without thingViews, view)[0].clearSelection()

        # Rerender the inspector with the selected thing
        @inspectorView.model = thing
        @inspectorView.render()

  setupAjax: ->
    @csrf_token = ($ 'meta[name="csrf-token"]').attr('content')

    ($ document).ajaxSend (event, xhr) =>
      xhr.setRequestHeader 'X-CSRF-Token', @csrf_token
