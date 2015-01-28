import "joelpurra/jq-dry" as DRY;

def pow($base; $n):
	1 | DRY::multiply($n; $base);

def round($decimals):
	. as $x
	# Assuming decimal numbers because of tostring.
	| 10 as $base
	| pow($base; $decimals) as $shifter
	| $x * $shifter
	| tostring
	| split(".")
	| .[0] as $integer
	| (
		if (
			(
				(
				.[1][0:1] as $rounder
				| if ($rounder // "") == "" then
					"0"
				else
					$rounder
				end
				)
				| tonumber
			)
			* 2
		) >= $base then
			1
		else
			0
		end
	) as $rounding
	| $integer
	| tonumber
	| . + $rounding
	| . / $shifter;

def round:
	round(0);
