# Arithmetic
We have learned how to use variables in PostScript. Sometimes we want a group of variables related to each other.

For example, if you are drawing a house with a door, where the door should be directly in the center of the house. In this situation the location of the door should be calculated from the width of the house and the width of the door.

That is why we are looking at arithmetic operators.

## Operators
Like regular operators _arithmetic operators_ take arguments from the stack and places their results back on the stack.

There are corresponding operators for addition, subtraction, multiplication and division. The operators usually have a shortened name

| Operation      | Operator name |
|----------------|---------------|
| addition       | **add**       |
| subtraction    | **sub**       |
| multiplication | **mul**       |
| division       | **div**       |

It would become pretty boring to list all the known arithmetic operators. Instead I would like to point you to the [reference manual](../appendix/manual.md) for an complete overview. You can use that to lookup operators that you think would exist.



## Exercises

1. In your drawing of a house, add a centered door.
2. Assume that there are two numbers on the stack. What does the following program calculate

```postscript
dup mul exch
dup mul add
sqrt
```
