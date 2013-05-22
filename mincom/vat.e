
deferred class VAT 
inherit TANK

feature
	in_valve, out_valve: VALVE
	
	fill is
		-- Fill the vat
		require
			in_valve.open
			out_valve.closed
		deferred
		ensure
			in_valve.closed
			out_valve.closed
			is_full
		end
		
		empty, is_full, is_empty, gauge, maximum, ... [Other features] ...

	invariant
		is_full = (gauge >= 0.97 * maximum) and (gauge <= 1.03 * maximum)
		
end
