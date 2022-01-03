# Postscript Whisperer
Material for a workshop on [PostScript][adobe:postscript], a [page description language][wikipedia:pdl].

[PostScript][wikipedia:postscript] is 

> a dynamically typed, concatenative programming language.

## Development
The repository contains the following parts

* **workshop**: contains the sources for an accompanying workbook guiding you through the intracies of PostScript.
* **presentation**: contains various presentations which will help in structuring the workshop.
* **resources**: contains background material which could help during the workshop.

### Workshop
The workshop is written with [mdbook][mdbook]. It is divided into two main parts

1. **Tools**: An introduction to PostScript.
2. **Projects**: Bob Ross style examples of what can be done with PostScript.

### Presentation
The presentation are Markdown driven and presented with [remark][remark].

## Material
The above material is automatically packaged when running the `make` command.

On each commit to master the the package is updated and the guide and the presentations are published as GitHub pages.

[adobe:postscript]: https://www.adobe.com/products/postscript.html
[wikipedia:pdl]: https://en.wikipedia.org/wiki/Page_description_language
[wikipedia:postscript]: https://en.wikipedia.org/wiki/PostScript
[mdbook]: https://rust-lang.github.io/mdBook/
[remark]: https://remarkjs.com/