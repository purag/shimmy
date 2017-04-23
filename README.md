# shimmy
A shell script package scoping and importing tool.

Shimmy will dynamically namespace imported packages, so declared variables and functions will be accessible through the package prefix specified in the imported file. See below for an example.

## Packages
You can declare a package in a shell script using thw `package <package_name>` command. One file can only contain one package.

## Import
You can import a package using `import path/to/file`. When a package is imported, all the variable and function declarations in the package will be prefixed with the package name followed by two underscores (i.e. if you import a file containing `package lib`, you access variables declared in that package with `lib__<var>`).

## Usage
For consistency, all scripts you wish to use shimmy with should start like this:

```
source shimmy
package <package_name>
```

## Example
Here's a simple example of two files, where one includes the other:

```
#!/bin/bash
source shimmy
package main

import lib

echo ${lib__var:-undefined}

endpackage
```

```
#!/bin/bash
# lib/main
source shimmy
package lib

var="hello world"

endpackage
```

# TODO
functions don't actually work yet. :P
