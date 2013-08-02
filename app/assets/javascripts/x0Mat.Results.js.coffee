class X0Mat.Results
  constructor:(priorization, @el, partiesData)->
    @results = priorization.results
    @totalScore = 0
    @perParty = @preprocessParties(partiesData)
    @processParties()
    @calculatePercents()
    @displayResults()

  processParties:->
    @results.each (item)=>
      doubled = item.info.chosen
      primaryParty = item.info.parties.primary
      secondaryParties = item.info.parties.secondary
      @updateCount(primaryParty, secondaryParties, doubled)

  updateCount: (primary, secondary, doubled)->
    delta = if doubled then 2 else 1
    @perParty[primary].score += delta
    @perParty[party].score += 1 for party in secondary if secondary
    @totalScore += (delta + (secondary and secondary.length or 0))

  calculatePercents:->
    for party, data of @perParty
      data.percent = (data.score/@totalScore)*100

  preprocessParties:(parties)->
    for party, data of parties
      data.score = 0
    parties

  displayResults:->
    container = $("ul.parties-list", @el)
    buffer = (@buildBufferItem(k, v) for k, v of @perParty)
    sorted = _.sortBy buffer, (item)->
      -item.percent
    @firstParty = (_.first sorted).key
    elements = (item.el for item in sorted)
    htmlList = $(elements.join "")
    firstLi = htmlList.first().prepend('<span class="icon-plus-sign"></span>')
    firstLi.append @descriptionParagraph()
    firstLi.on "click", "p.party-header", (e)=>
      @paragraph.toggle()
      $('.icon-plus-sign').toggleClass('icon-minus-sign')
    container.html htmlList

  buildBufferItem:(party, data)->
    item = {}
    item.key = party
    item.percent = data.percent
    title = "<span class=\"title\"><strong>#{@partyName(party)}: </strong></span>"
    percent = "<span class=\"percent\">#{Math.round(item.percent)}% </span>"
    item.el = "<li class=\"party\"><p class=\"party-header\">" + title + percent + "</p></li>"
    item

  partyName:(sym)->
    @perParty[sym].name

  descriptionParagraph: ->
    @paragraph = $("<p>")
    description = $('<span class="party-description">')
    description.text @perParty[@firstParty].description
    @paragraph.append description
    @paragraph.addClass "description"
    if link = @perParty[@firstParty].link
      @paragraph.append @partyExternalLink(link)
    @paragraph.hide()

  partyExternalLink: (link)->
    anchor = $('<a target="_blank" class="party-link">')
    anchor.attr "href", link.url
    anchor.text link.label
    anchor