# Requires Point

class Layer
    constructor: (@width,@height) ->

    toString: () ->
        return "A Layer"

    findSquare: (point) ->
        return new Point(Math.floor(point.x),Math.floor(point.y))

    mousedown: (point) ->
        return null

    mouseup: (point) ->
        return null

    mousemove: (point) ->
        return null