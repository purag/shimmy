# spackle
Spackle is a module system for bash scripts.

Spackle will dynamically namespace imported packages, so declared variables and functions will be accessible through the package prefix specified in the imported file.

Spackle also supports package-private declarations using a two-underscore prefix (`__private_varname`).

## Installation
First, place spackle in your project's root:

```
wget https://raw.githubusercontent.com/purag/spackle/master/spackle
```

Then, source spackle in each of your project's files:

`main.sh`:

```
#!/bin/bash
source spackle # or `source ../spackle`, `source ../../spackle`
```

## Packages
Each project file can contain one package, which must be declared before importing any other packages. To declare a package, use the `package` command, which takes one argument, the package name:

`test/readme/main.sh`:

```
#!/bin/bash
source ../../spackle
package myProject
```

The package name must be a classic bash identifier (alphanumberic + underscores) since it will be used in identifiers.

## Import
You include packages by importing the files they're defined in. To do this, use the `import` command, which takes one argument, the path to the file:

`test/readme/main.sh`:

```
#!/bin/bash
source ../../spackle
package myProject

import util/helpers.sh

echo "$util__var" # 'a public variable'
```

`test/readme/util/helpers.sh`:

```
#!/bin/bash
source ../../../spackle
package util

var="a public variable"
```

Any public variables/functions declared in `util/helpers.sh` will be accessible to files that import it with the prefix `util__`.

### Nested Imports
If you import a file which in turn imports a file, the package prefixes compound:

`test/readme/main.sh`:

```
#!/bin/bash
source ../../spackle
package myProject

import util/helpers.sh

echo "$util__var" # 'a public variable'

__trimmed=`util__str__trim "  hello  "`
echo "'$__trimmed'" # 'hello'
```

`test/readme/util/helpers.sh`:

```
#!/bin/bash
source ../../../spackle
package util

import string/helpers.sh
```

`test/readme/util/string/helpers.sh`

```
#!/bin/bash
source ../../../../spackle
package str

# trim leading and trailing whitespace from a string
trim () {
  echo "$1" | sed 's/^ *//g' | sed 's/ *$//g'
}
```

This example can be found in `test/readme`.

# TODO(?)
- add a function to print a dependency tree (using `set` to disable execution)
- add `import <file> as <renamed-package>` to rename packages on the fly
- add `import-private <file>` to import a file privately (do not expose the imported members to anyone importing the current file)
- add `import <member-list> from <file>` to only import specified members
