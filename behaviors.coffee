# On document.ready()
$ ->

    selectedLeft = $("div.people table td.selected.left")
    selectedRight = $("div.people table td.selected.right")

    $("div.people table td.left").click ->
        $(selectedLeft).removeClass "selected"
        $(this).addClass "selected"
        selectedLeft = this

    $("div.people table td.right").click ->
        $(selectedRight).removeClass "selected"
        $(this).addClass "selected"
        selectedRight = this
