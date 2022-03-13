# Drawing primitives
![A doodle made possible by the drawing primitives of PostScript](../../image/generated/drawing.png)

It is about time we talk about drawing with PostScript!

The above doodle is created with some of the drawing primitives that PostScript provides. To wet our apetite we will list the entire program below

```ps
{{#include ../../image-src/drawing.ps}}
```

## Current Path
The central concept in PostScript programs is the path. The drawing primitives construct paths. You might remember from the "Hello, World!"-program that you first construct a path and then stroke it. Later we will learn that paths can also be filled.

The path that is being constructed is called the _current path_. The drawing operators change the current path in certain ways.

## newpath
The `newpath` operator clears the current path and starts an empty path, ready to be altered to your hearts content.

## moveto
The `moveto` operator changes the _current point_. The current point is important building block for drawing primitives. Usually drawing primitives change the current point to be the current point to the last control point.

The `moveto` operator requires two operands to be present on the stack. Those are the `x`-coordinate and the `y`-coordinate of the current point to be.

No marks will be left on the paper with a `moveto` operator.

## lineto
If you do want to leave a straight line segment as a mark on the paper, use the `lineto` operator.

The `lineto` operator requires four operands. The `x`- and `y`-coordinates of the start point and the `x`- and `y`-coordinates of the end point. The current point will be set to the end point.

## arc
The `arc` operator and variants create a circular arc. It needs 5 operands. The `x`- and `y`-coordinate of the center of the arc, the radius of the arc and the two angles in degrees.

`arc` creates a counter-clockwise arc from the first angle to the second angle. The `arcn` variant produces a clockwise arc from the first angle to the second angle.

Furthermore, a line segment is added from the current point to the first point, the point at the first angle, of the circular arc.

The following snippets show the various options

```ps
{{#include ../../image-src/arc.ps:5:6}}
```

```ps
{{#include ../../image-src/arc.ps:10:11}}
```

```ps
{{#include ../../image-src/arc.ps:15:16}}
```

```ps 
{{#include ../../image-src/arc.ps:20:21}}
```

Their result collated in a single image

![Some of the variants of `arc`](../../image/generated/arc.png)

## curveto
The curveto operator extends the current path with [a cubic bezier curve][wikipedia:bezier-curve].

Bezier curves are fascinating and well-behaved drawing tool. we will not say a lot about it now, but feel free to pick the brain of the workshop leaders.

## closepath
The close path operator will draw a line segment from the current point to the point designated by the last moveto operator.

There is a subtle difference, that will be noticable under close scrutiny, between drawing the segment yourself and using closepath.

![The difference between "closing" a path by hand and using `closepath`](../../image/generated/closepath.png)

## Relative drawing primitive
The above drawing primitives all accept operands that are coordinates are global. For example if you want to draw a square with the lower left corner at 10 10 and with side length of 30 one could use the following program

```ps
10 10 moveto
40 10 lineto
40 40 lineto
10 40 lineto
closepath
```

The problem is that we need to calculate the endpoints. We can let PostScript do the heavy lifting, but there is an alternative. Take a look at the following snippet

```ps
10 10 moveto
30 0 rlineto
0 30 rlineto
30 neg 0 rlineto
closepath
```

The big difference is the use of `rlineto`. This will draw a line segment with a relative to the _current point_.

Almost all the mentioned drawing primitives have such a relative cousin.

## Reference
There are more drawing operators, all with a specific need. Listing them all isn't very exciting. Instead I will point you to the [reference][book:reference].

## Exercises
1. Match the `arc` snippets to the drawing.

[wikipedia:bezier-curve]: https://en.wikipedia.org/wiki/B%C3%A9zier_curve
[book:reference]: ../appendix/manual.md