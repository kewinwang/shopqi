App.Controllers.Orders.Index = Backbone.Controller.extend

  initialize: ->
    # 列表页面的查询条件：状态、支付状态、打包状态
    $('#status-filter-link').click ->
      $('#order-status-select
 > .filter-select').toggle()
      $('#payment-status-select > .filter-select').hide()
      $('#shipping-status-select > .filter-select').hide()
      false

    $('#payment-filter-link').click ->
      $('#order-status-select
 > .filter-select').hide()
      $('#payment-status-select > .filter-select').toggle()
      $('#shipping-status-select > .filter-select').hide()
      false

    $('#shipping-filter-link').click ->
      $('#order-status-select
 > .filter-select').hide()
      $('#payment-status-select > .filter-select').hide()
      $('#shipping-status-select > .filter-select').toggle()
      false

    # 选择页码
    $('#page-size-select').change ->
      document.location.href = $(this).val()

    $(document).click ->
      $('.filter-select').hide()

  routes:
    "nothing":      "nothing"
