class X0Mat.Priorization
  constructor:(stack, container)->
    @results = stack.serializeStatements()
    @el = container
    @toResultsEl = $(".to-results", @el)
    @toResultsEl.css({visibility: "hidden"})
    @count = 0
    @fillElement()
    that = @
    @el.on "click", ".statement", (e)->
      elm = $(@)
      if that.count < 3 or elm.hasClass("chosen")
        elm.toggleClass "chosen"
        that.updateResults elm.data("index")
        that.updateCount()
      if that.count >= 1
        that.toResultsEl.css({visibility: "visible"})
      else
        that.toResultsEl.css({visibility: "hidden"})
    @toResultsEl.on "click", (e)->
      $(window).trigger "x0mat:resultsReady"

  show:->
    @el.show()

  hide:->
    @el.hide()

  updateCount:->
    @count = $(".statement.chosen", @el).size()

  fillElement:->
    statements = $("#chosenStatements", @el)
    @results.each (item, i)=>
      elm = item.el
      elm.data("index", i)
      statements.append elm

  updateResults: (index)->
    actual = @results.value()[index].info.chosen
    @results.value()[index].info.chosen = !actual
