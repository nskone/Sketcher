# Requires Point & Layer

class Wall extends Layer
    toString: () ->
        return "A Wall Layer"

    class Line
        constructor: (@coordinate) -> # TODO: Divide the y coordinates by two?
            if coordinate.y % 2 == 0 # Even = vertical line
                @point1 = new Point(coordinate.x, coordinate.y    )
                @point2 = new Point(coordinate.x, coordinate.y + 1)


            else # Odd = horizontal line
                @point1 = new Point(coordinate.x    , coordinate.y)
                @point2 = new Point(coordinate.x + 1, coordinate.y)


        getPoints: () ->
            return [@point1,@point2]

        getAttr: () ->
            return {}



    findPath: (point) ->
        # Vertical line to the left of the click
        l1 = new Line(new Point(Math.floor(point.x)    , Math.floor(point.y) * 2    ))
        # Vertical line to the right of the click
        l2 = new Line(new Point(Math.floor(point.x) + 1, Math.floor(point.y) * 2    ))
        # Horizontal line above the click
        l3 = new Line(new Point(Math.floor(point.x)    , Math.floor(point.y) * 2 + 1))
        # Horizontal line under the click
        l4 = new Line(new Point(Math.floor(point.x) + 1, Math.floor(point.y) * 2 + 1))

        @.parent.draw(l1)
        @.parent.draw(l2)
        @.parent.draw(l3)
        @.parent.draw(l4)


    mousedown: (point) ->
        alert "Clicked #{point}"
        @.findPath(point)
        return null

    mouseup: (point) ->
        return null

    mousemove: (point) ->
        return null