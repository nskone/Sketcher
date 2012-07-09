# Requires nothing

class Point
    constructor: (@x,@y) ->
    distance: (p) -> return Math.abs(Math.sqrt(Math.pow(@x - p.x, 2) + Math.pow(@y - p.y, 2)))
    toString: () -> return "Point: #{ @x },#{ @y }"