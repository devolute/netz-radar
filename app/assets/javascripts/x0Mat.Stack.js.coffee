class X0Mat.Stack
  constructor: (@el)->
    @cards = $("#cards-stack .card", @el)
    @length = @cards.size()
    @cards.each (index, element)=>
      node = new X0Mat.Card(element, @)
      @list.push node
    buttons = $("#buttons .action", @el)
    @nextButtonEl = buttons.filter(".next")
    @buttonLabels = @nextButtonEl.data "labels"
    @answered = 0
    @updateProgress()
    @updateCards()
    console.log("stack init", @cards.size(), buttons, @nextButtonEl, @buttonLabels)

    that = @
    buttons.on "click", (e)->
      action = $(@).data("action")
      that[action].call(that)

  list: _.chain([])

  updateCards:->
    firstUnanswered = @list.find (card)->
      card.unanswered()
    card = firstUnanswered.value()
    console.log "first unanswered:", card, @progress
    if card
      @current = card
      card.show()
    @updateButtons()

  back:->
    last = @list.last().value()
    @list = @list.without last
    @list.unshift(last)
    console.log("last was:", last, @list)
    @current.hide()
    last.show()
    @current = last
    @updateButtons()

  next:->
    card = @current
    @list = @list.without(card)
    @list.push(card)
    @updateProgress()
    if @ready()
      $(window).trigger("x0mat:statementsChosen")
    else
      card.hide()
      @updateCards()

  ready:->
    @progress.answered == @length

  lastOne:->
    @progress.answered == (@length-1)

  readyForPriorization:->
    @answered == @length

  updateAnswered:->
    @answered +=1

  updateButtons:->
    # TODO: cache state of button not to execute this each time.
    textSpan = $(".text", @nextButtonEl)
    console.log "updating buttons:", @progress
    if @readyForPriorization()
      @nextButtonEl.show()
      console.log "setting button to priorize"
      textSpan.text @buttonLabels.priorize
    else if @current.answered()
      @nextButtonEl.show()
      textSpan.text @buttonLabels.next
    else if @lastOne()
      @nextButtonEl.hide()
    else
      @nextButtonEl.show()
      textSpan.text @buttonLabels.pass

  updateProgress:->
    count = @list.countBy (card)->
      card.answered() and "answered" or "unanswered"
    console.log "progress:", count.value()
    value = count.value()
    @progress = value
    $(window).trigger "x0mat:progressUpdated", value

  serializeStatements:->
    statements = @list.map (card)->
      card.statement
    # statements.value()
    statements