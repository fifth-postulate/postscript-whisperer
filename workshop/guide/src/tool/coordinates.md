# Coordinates
The painting primitives accept operands that describe where marks should be made. These descriptions are relative to a _coordinate system_.

This coordinate system starts out with the center in the lower left corner of the page. With its x-axis horizontal pointing to the right and its y-axis vertical pointing up. Its units are expressed in the arcane [_PostScript points_][book:sizes].

The coordinate system can be modified to suit your needs. This chapter describes a few possibilities. We will be using the asymmetric letter P to visualize the transformations.

![The asymmetric letter P](../../image/generated/coordinates-00.png)

## translate

![The asymmetric letter P, translated](../../image/generated/coordinates-01.png)

The `translate` operator translates the coordinate system. It accepts two operands, that determine the amount to translate the origin in both the x-axis and y-axis.

## rotate

![The asymmetric letter P, rotated](../../image/generated/coordinates-02.png)

The `rotate` operator rotates the coordinate system. It accepts a single operand, an angle in degrees, that determines the amount to rotate the coordinate system.

Positive angles rotate counter clockwise.

## scale

![The asymmetric letter P, scaled](../../image/generated/coordinates-03.png)

The `scale` operator scales the coordinate system. It accepts two operands, that determine the factor to scale the x-axis and y-axis.

Non-uniform scaling, i.e. scaling with different factors for the x-axis and y-axis, produce a line width that depends on the direction of the line.

## Combination
By combining `translate`, `rotate` and `scale` in various ways, one can achieve all transformations that are allowed and possible by PostScript.

PostScript allows for direct manipulation of the current coordinate system. If you want to know more about that see the [reference][book:reference].

[book:sizes]: ../appendix/sizes.md
[book:reference]: ../appendix/manual.md
