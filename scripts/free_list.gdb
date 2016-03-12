def free_list

set $_head = $arg0
set $_next = (pList)0

while($_head)
	
	p $_next = $_head->next
	p free($_head)
	p $_head = $_next
end


end
