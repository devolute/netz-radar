class X0Mat.Card
  constructor:(el, @stack)->
    @el = $(el)
    @id = @el.data "id"
    @statementsEl = $(".statements .statement", @el)
    that = @
    @el.on "click", ".statement", (e)->
      that.setStatement $(@)
      that.stack.updateAnswered()
      that.stack.updateButtons()
    @

  answered: ->
    !_.isEmpty(@statement)

  unanswered: ->
    !@answered()

  statement: {}

  setStatement: (p)->
    @statementsEl.removeClass "selected"
    p.addClass "selected"
    @statement =
      info: p.data("info")
      el: p.clone().removeClass "selected"

  show: ->
    @el.show()

  hide:->
    @el.hide()
