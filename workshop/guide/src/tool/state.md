# Graphics State
We have learned that PostScript differentiates between constructing a path and painting that path.

In this chapter we are mentioning a few internal graphic states that PostScript keep track of that effect the resulting marks on the paper.

Almost all state variables have a pair of operators associated with them. One that set the value, the other to get the value.

## setgray / currentgray
To influence the _grayness_ with which paths are stroked use the `setgray` operator. It takes a single operand, a value between `0` and `1`. Black corresponds to `0`, white corresponds to `1`.

Below you see the same line stroked with different levels of gray.

![Different levels of gray](../../image/generated/setgray.png)

## setlinewidth / currentlinewidth
To influence the _thickness_ with which paths are stroked use the `setlinewidth` operator. Just like the `setgray` operator, `setlinewidth` takes a single operand, a measure how think the stroked line should be.

Below you see the same line stroked with different thickness levels.

![Different thicknesses of lines](../../image/generated/setlinewidth.png)

## setlinecap / currentlinecap
To influence how the ends of lines are capped when stroked use the `setlinecap` operator. It takes a single operand. It's value determines the cap.

| operand | cap    |
|---------|--------|
| 0       | butt   |
| 1       | round  |
| 2       | square |

![Different line caps](../../image/generated/setlinecap.png)

## setlinejoin / currentlinejoin
To influence how lines are joined when stroked use the `setlinejoin` operator. Just like the `setlinecap` operator, `setlinejoin` it takes a single operand. It's value determines how to join lines.

| operand | join  |
|---------|-------|
| 0       | miter |
| 1       | round |
| 2       | bevel |

The miter join has some other parameters associated with it. We will let the [reference][book:reference] tell you about them

![Different line joins](../../image/generated/setlinejoin.png)

## gsave / grestore
It will probably will not surprise you that the graphics state is maintained in a stack as well, the _graphics stack_.

If you want to revert to a graphics stack after you have stroked a few paths, you can use `gsave` to push onto the graphics stack, and `grestore` to return to it.

## Exercises
1. Draw your house in a different shade of gray.

[book:reference]: ../appendix/manual.md
