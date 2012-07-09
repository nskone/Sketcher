# Requires Point, Raphael

class RaphaelCanvas
    constructor: (@div, @gridsize) ->
        @layers = []
        @activeLayer = null

        @width = @div.width()
        @height = @div.height()
        @left = @div.position().left
        @top = @div.position().top

        @paper = new Raphael(@div.get(0), @width, @height)

        # The foreground rectangle catches all the mouse events
        @foreground = @paper.rect(0, 0, @width, @height)
        @foreground.attr({fill: "red", opacity: 0})
        @foreground.owner = @
        @foreground.mousedown(@mousedown)
        @foreground.mouseup(@mouseup)
        @foreground.mousemove(@mousemove)


    toString: () ->
        return "The Canvas"

    addLayer: (layer) ->
        @layers.push(layer)
        layer.parent = @

    setActiveLayer: (layer) ->
        @activeLayer = layer

    getEventPoint: (e) ->
        x = (e.pageX - @left) / @gridsize
        y = (e.pageY - @top) / @gridsize
        return new Point(x,y)

    draw: (item) ->
        points = item.getPoints()

        # TODO: Translate points into this coordinate

        pathString = "M #{ points[0].x } #{ points[0].y } "

        points = points.slice(1,points.length)

        for point in points
            pathString += "L #{ point.x } #{ point.y } "

        return null


    # These events happen in the context of the foreground
    # rectangle. To get this canvas class we have to get
    # the foreground's owner property
    mousedown: (e) ->
        canvas = @.owner
        if canvas.activeLayer
            canvas.activeLayer.mousedown(canvas.getEventPoint(e))

    mouseup: (e) ->
        canvas = @.owner
        if canvas.activeLayer
            canvas.activeLayer.mouseup(canvas.getEventPoint(e))

    mousemove: (e) ->
        canvas = @.owner
        if canvas.activeLayer
            canvas.activeLayer.mousemove(canvas.getEventPoint(e))