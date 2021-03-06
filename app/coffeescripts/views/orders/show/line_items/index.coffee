App.Views.Order.Show.LineItem.Index = Backbone.View.extend
  el: '#order'

  initialize: ->
    this.render()

  render: ->
    $('#line-items').html ''
    _(App.order.get('line_items')).each (line_item) ->
      new App.Views.Order.Show.LineItem.Show line_item: line_item

    template = Handlebars.compile $('#price-summary-item').html()
    $('#price-summary').html template App.order.attributes
