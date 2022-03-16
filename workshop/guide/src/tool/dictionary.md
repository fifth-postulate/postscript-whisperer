# Dictionaries
In the previous chapter on [procedures](./procedure.md) you were asked to use variables in the exercises. If one isn't careful, one could encounter the problem of [_aliasing_][wikipedia:aliasing].

Take a careful look at the following code and try to predict what the resulting image looks like:

```ps
{{#include ../../image-src/aliasing.ps}}
```

You will recognize a few sections in the above code

### Definitions

```ps
{{#include ../../image-src/aliasing.ps:1:2}}
```

Here we bind the keys `height` and `width` to the values `595` and `419`.
These are the dimension of A5 paper in [PostScript points][book:sizes], the default scale that is used.

### Procedures

```ps
{{#include ../../image-src/aliasing.ps:4:14}}
```

The code goes on to bind a procedure to the key `box`.

The procedure uses the [tip][book:exch-tip] from the variable chapter to bind the arguments to names.

Note that if we write the arguments in order

```ps
x y width height
```

`height` ends up on top of the stack. That is why you have to bind them in the reverse order.

It goes on to draw a box by moving to the lower left corner, and drawing lines to each corner in a counter-clockwise fashion.

```ps
{{#include ../../image-src/aliasing.ps:9:13}}
```

### Drawing
The next section of code uses the defined `box` procedure to draw, and stroke, three boxes.

```ps
{{#include ../../image-src/aliasing.ps:16:20}}
```

The same arguments are passed each time. So one would expect to see only one box.

![Three boxes where one would expect only one](../../image/generated/aliasing.png)

## Aliasing
As hinted in the opening paragraph the unexpected boxes originate from aliasing. If you look carefully you will notice that the "global" `width` and `height` variables are reassigned each time the `box` procedure is called.

One could solve the problem if one could scope the variables to the procedure only. This is where dictionaries come in.

## Use of dictionary

![A single box, drawn three times](../../image/generated/no-aliasing.png)

The above image is the one we expected. It is drawn by the following program.

```ps
{{#include ../../image-src/no-aliasing.ps}}
```

The only difference with the program mentioned in the beginning of this chapter is the pair

```ps
{{#include ../../image-src/no-aliasing.ps:5:5}}
```

and

```ps
{{#include ../../image-src/no-aliasing.ps:15:15}}
```

`4 dict` creates a dictionary that can contain 4 items and puts it on the operand stack, `begin` takes the dictionary from the stack and makes it the current dictionary, so that it will be used to bind variables in and look up names from.

`end` restores the previous dictionary as the current dictionary.

## Dictionary Stack
The operand stack is of central importance in any PostScript program. But it is not the only stack that PostScript knows about.

There is also a dictionary stack. Just like the operand stack the dictionary stack is a stack. We saw that you can use `begin` and `end` to push dictionaries onto and pop them from the stack.

The dictionary stack plays an integral role in PostScript programs. Specifically how it looks up values bound to names. When the PostScript interpreter encounters a name like `bergen` it will search for a binding in the current, or top-most, dictionary.

If it finds the key in the dictionary it returns the value bound to it.

If it can not find the name in the dictionary it begins searching in lower dictionaries on the dictionary stack.

Interestingly enough, PostScript programs start with a number of dictionaries on the stack. The most important one is the **system dict**. It contains all definitions of the PostScript operators!

## Literal Dictionaries
Creating a dictionary with the `dict` operator and pushing it on the dictionary stack with `begin` makes it the current dictionary. It will be used to bind names to values with the `def` operator.

There is a literal notation for dictionaries. For example, the following snippet

```ps
3 dict begin
    /foo 1 def
    /bar 2 def
    /baz 3 def
...
```

is equivalent to

```ps
<</foo 1 /bar 2 /baz 3>> begin
...
```

## Exercises
1. What values are left on the stack after the following program executes.

```ps
<</a 1 /b 2>> begin
    /a 3 def
    a b add
    /b exch def
    a b
end
```

2. In the following snippet, what value is the name `a` bound to, according to the PostScript interpreter.

```ps
3 dict begin
    /a 1 def
    /b 2 def
    /c <</a 3 /b 4>> def
    c begin
...
```

[wikipedia:aliasing]: https://en.wikipedia.org/wiki/Aliasing_(computing)
[book:paper-size]: ../appendix/paper-sizes.md
[book:sizes]: ../appendix/sizes.md
[book:exch-tip]: variable.md#tip
