class X0Mat.Card
  constructor:(el, @stack)->
    @el = $(el)
    @id = @el.data "id"

    @statementsEl = $(".statements .statement", @el)

    that = @
    @el.on "click", ".statement", (e)->
      console.log e, that, @
      that.setStatement $(@)
      that.stack.updateAnswered()
      that.stack.updateButtons()
      console.log "current statement:", that.statement, that.answered()

    console.log "init card", @id, @answered()
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

  # back: ->
  #   console.log "back"
  #   @stack.current = @
  #   @stack.goBack()
  # next: ->
  #   console.log "next"
  #   @stack.putBack(@)
