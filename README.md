<p align="center">
  <a href="https://github.com/joelpurra/jqnpm"><img src="https://rawgit.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg" alt="jqnpm logotype, a Penrose triangle" width="100" border="0" /></a>
</p>

# [jq-math](https://github.com/joelpurra/jq-math)

A collection of basic mathematical functions.

This is a package for the command-line JSON processor [`jq`](https://stedolan.github.io/jq/). Install the package in your jq project/package directory with [`jqnpm`](https://github.com/joelpurra/jqnpm):

```bash
jqnpm install joelpurra/jq-math
```



## Usage


```jq
import "joelpurra/jq-math" as Math;

# Math::pow($base; $n)
Math::pow(2; 10)		# 1024

# Math::round
1234.567 | Math::round		# 1235

# Math::round($decimals)
1234.567 | Math::round(2)		# 1234.57
```



---

## License
Copyright (c) 2015 Joel Purra <http://joelpurra.com/>
All rights reserved.

When using **jq-math**, comply to the MIT license. Please see the LICENSE file for details.
