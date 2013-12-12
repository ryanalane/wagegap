# templates 
dominantTemplate = "<strong>{{group}}</strong> earn the <strong>most</strong>."
minorityTemplate = "<strong>{{group}}</strong> earn <strong>{{centsOnDollar}} cents</strong> for every <strong>dollar</strong> White men earn."

# data
people = 
    data:
        men: 
            africanAmerican: 73,
            hispanic: 61, 
            white: 100 
        women:
            africanAmerican: 64,
            hispanic: 54, 
            white: 78 
    text:
        men: 
            africanAmerican: "African-American men",
            hispanic: "Hispanic men", 
            white: "White men" 
        women:
            africanAmerican: "African-American women",
            hispanic: "Hispanic women", 
            white: "White women" 


# chart manipulation 
y = d3.scale.linear().domain([0, 100]).range([0, 400])

# On document.ready()
$ ->

    selectedLeft = $("div.people table td.selected.left")
    selectedRight = $("div.people table td.selected.right")
    divElement = $(".chart div")
    explanatoryElement = $(".explanatory-text.right p")

    updateChart = ->
        gender = $(selectedRight).attr "id"
        genderedData = if gender is "men" then people.data.men else people.data.women 
        genderedText = if gender is "men" then people.text.men else people.text.women 

        race = $(selectedLeft).attr "id"
        datum = if race is "white" then genderedData.white else if race is "african-american" then genderedData.africanAmerican else genderedData.hispanic
        text = if race is "white" then genderedText.white else if race is "african-american" then genderedText.africanAmerican else genderedText.hispanic

        $(divElement).animate {height: y(datum) + "px"}, 500
        $(divElement).text datum + "%"

        $(explanatoryElement).html ->
            template = if text is "White men" then dominantTemplate else minorityTemplate
            Mustache.to_html template, {group: text, centsOnDollar: datum}

    updateChart()

    $("div.people table td.left").click ->
        $(selectedLeft).removeClass "selected"
        $(this).addClass "selected"
        selectedLeft = this
        updateChart()

    $("div.people table td.right:not(.empty)").click ->
        $(selectedRight).removeClass "selected"
        $(this).addClass "selected"
        selectedRight = this
        updateChart()
