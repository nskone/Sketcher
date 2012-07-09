# Requires RaphaelCanvas, Wall

$(document).ready ->
    mapdiv = $("#map")

    canvas = new RaphaelCanvas(mapdiv, 50)

    wall = new Wall(10,10)
    canvas.addLayer(wall)
    canvas.setActiveLayer(wall)