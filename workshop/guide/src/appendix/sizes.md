# Points, Inches and Millimeters
For historic reasons the default unit of length is the _PostScript point_, or points for short.

There are 72 points in an inch. There are also 25.4 millimeters in an inch.

So if you want your default measurement to be in millimeters you can use a scaling factor of \\(\frac{72}{25.4}\\).

Or in PostScript code:

```ps
72 25.4 div
```
