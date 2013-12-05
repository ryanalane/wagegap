# data
people = 
    men: 
        africanAmerican: 73,
        hispanic: 61, 
        white: 100 
    women:
        africanAmerican: 64,
        hispanic: 54, 
        white: 78 

# chart manipulation 
y = d3.scale.linear().domain([0, 100]).range([0, 400])

updateChart = (divElement, newDatum) ->
    gender = $(selectedRight).attr "id"
    genderedData = if gender is "men" then people.men else people.women 
    alert genderedData

    race = $(selectedLeft).attr "id"
    datum = if race is "white" then genderedData.white else if race is "african-american" then genderedData.africanAmerican else genderedData.hispanic
    alert datum

    $(divElement).height y(newDatum) + "px"
    $(divElement).text newDatum + "%"

# On document.ready()
$ ->

    selectedLeft = $("div.people table td.selected.left")
    selectedRight = $("div.people table td.selected.right")
    divElement = $(".chart div")

    updateChart = ->
        gender = $(selectedRight).attr "id"
        genderedData = if gender is "men" then people.men else people.women 

        race = $(selectedLeft).attr "id"
        datum = if race is "white" then genderedData.white else if race is "african-american" then genderedData.africanAmerican else genderedData.hispanic

        $(divElement).height y(datum) + "px"
        $(divElement).text datum + "%"

    updateChart()

    $("div.people table td.left").click ->
        $(selectedLeft).removeClass "selected"
        $(this).addClass "selected"
        selectedLeft = this
        updateChart()

    $("div.people table td.right").click ->
        $(selectedRight).removeClass "selected"
        $(this).addClass "selected"
        selectedRight = this
        updateChart()
