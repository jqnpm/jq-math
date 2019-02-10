import "joelpurra/jq-dry" as DRY;

def pow($base; $n):
	1 | DRY::multiply($n; $base);

def round($decimals):
	. as $x
	# Assuming decimal numbers.
	| 10 as $base
	| (if $x < 0 then -1 else 1 end) as $signNegator
	| pow($base; $decimals) as $shifter
	| $x * $shifter * $signNegator
	| floor as $integer
	| (
		if (((. - $integer) * $base | floor) * 2) >= $base then
			1
		else
			0
		end
	) as $rounding
	| $integer + $rounding
	| . / $shifter * $signNegator;

def round:
	round(0);
