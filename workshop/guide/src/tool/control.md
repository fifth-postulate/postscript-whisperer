# Control Flow
PostScript is an interpreted language. It reads operators from a program and executes them. Some of these operators allow the developer to control the flow of execution.

All _control flow_ operators have a similar structure. They take as operands one or more procedures and a description when to execute it.

We will go through a few control flow operators, but don't hesitate tho look for more in the [reference][book:reference].

## if
The `if` operator takes as its two operands a boolean, which can be obtained with various operands like `eq`, `and`, `not` etc, and a procedure.

It will execute the procedure only if the boolean is `true`.

## ifelse
With a little imagination one could guess what the `ifelse` operator does. It accepts three operands, a boolean and two procedures. Depending on the truth value of the boolean, either the first procedure is executed or else the second procedure is executed.

## repeat
If you want to repeat a procedure a number of times, `repeat` is the operator you are looking for. Its operands, a number and a procedure, control the execution.

The number determines how many times the procedure is executed.

## for
This is your standard for loop. It accepts a whooping four operands. E.g.

```ps
0 1 10 { pop } for
```

The first three operands are numbers: _initial_, _increment_ and _limit_. The fourth operand is the procedure to execute.

The procedure is with values from initial by steps of increment to limit, inclusive. Each time around the loop, the index is pushed onto the stack for the procedure to consume.

## Exercises
1. Imagine that the language designers forgot to provided `ifelse`, but they provided `if`. Implement `ifelse` in terms of `if` and the boolean operators.

[book:reference]: ../appendix/manual.md