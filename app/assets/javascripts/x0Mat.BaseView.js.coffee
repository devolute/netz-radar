X0Mat.BaseView =
  init:(@parties)->
    @cards = $("#cards")
    @priorize = $("#priorize")
    @results = $("#results")

    @priorize.hide()
    @results.hide()

    @stack = new X0Mat.Stack(@cards)
    $("#counter .count", @cards).html(1)
    $("#counter .of", @cards).html("/ " + @stack.length)

    $(window).on "x0mat:progressUpdated", (e, data)=>
      answered = data.answered or 0
      $("#counter .count", @cards).html("").html(answered+1)

    $(window).on "x0mat:statementsChosen", (e)=>
      @cards.hide()
      @priorize.show()
      @priorization = new X0Mat.Priorization(@stack, @priorize)

    $(window).on "x0mat:resultsReady", (e, data)=>
      @priorization.hide()
      @results.show()
      @finalResults = new X0Mat.Results(@priorization, @results, @parties)
