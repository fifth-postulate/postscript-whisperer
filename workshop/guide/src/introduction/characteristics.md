# Characteristics
PostScript is described as a

> dynamically typed, concatenative programming language

What does this mean?

## Dynamically Typed
A [_type_][wikipedia:type-system] is a property associated with a certain programming constructs that can be used to determine what operations are legal.

Dynamically typed means that the _type_, i.e. the property that determines legal operations, is only known at runtime.

## Concatenative
A [_concatenative language_][wikipedia:concatenative] is part of programming paradigm that favors composition of functions over function application. This might be as illuminative as a broken flashlight.

What is meant by that can be illustrated by a code example in a pseudo language. Function application, i.e. applying functions to their arguments, typically looks like

```
x = f(w)
y = g(x)
z = h(z)
```

Here function `f` is applied to argument `w`, that result is applied to function `g` etcetera.

In a concatenative language the same example would typically look like

```
w f g h
```

It's probably best to try your hand on an actual concatenative language to get a feel for the trade-offs between the different paradigms. Luckily PostScript provides just such a language.

[wikipedia:type-system]: https://en.wikipedia.org/wiki/Type_system
[wikipedia:concatenative]: https://en.wikipedia.org/wiki/Concatenative_programming_language
