
class STACK[T]
creation
	make

-- hide implementation details
feature {NONE}
	
	array: ARRAY[T];
	
feature -- initialisation

	make is
		do
			create array.make;
		ensure
			empty
		end

feature -- queries
	
	count: INTEGER is
		do
			Result := array.count;
		end
	
	top: T is
		require
			not empty
		do
			Result := array.get(count);
		end

	empty: BOOLEAN
		do
			Result := count = 0;
		ensure
			Result = (count = 0)
		end

feature -- commands

	push(item: T) is
		-- add item to top
		do
			array.append(item);
		ensure
			not empty
			top = item
			count = old count + 1
		end
		
	pop is
		require
			not empty
		do
			array.remove(array.count);
		ensure
			count = old count - 1
		end

invariant

	count >= 0
	empty implies (count = 0)
	not empty implies top = array.get(array.count)

end
