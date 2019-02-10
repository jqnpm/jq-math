#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


read -d '' fourLineTests <<-'EOF' || true
pow/2: returns 1 for 0
null
pow(2; 0)
1

pow/2: returns $base for 1
null
pow(2; 1)
2

pow/2: returns 1024 for 10
null
pow(2; 10)
1024

pow/2: returns 1000000 for 6
null
pow(10; 6)
1000000

round/0: rounds down
0.3333
round
0

round/0: rounds up
0.9
round
1

round/0: rounds down
10.3333
round
10

round/0: rounds up
10.9
round
11

round/1: rounds up.
1234.567
round
1235

round/1: returns for 0
0.3333
round(0)
0

round/1: returns for 0
0.9
round(0)
1

round/1: rounds down for 1
0.3333
round(1)
0.3

round/1: rounds up for 1
0.6666
round(1)
0.7

round/1: rounds down for 2
0.3333
round(2)
0.33

round/1: rounds up for 2
0.6666
round(2)
0.67

round/1: round down.
0.123456789
round(3)
0.123

round/1: rounds up.
0.123456789
round(4)
0.1235

round/1: rounds up for nines.
0.999999999
round(7)
1

round/1: doesn't round.
1234.567
round(10)
1234.567
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
