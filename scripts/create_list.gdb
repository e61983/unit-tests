def create_list

p $i = 0
p $tmp = (pList)malloc(sizeof(struct List))
p $tmp->value = $i
p $tmp->next = (pList)0
p $arg0 = $tmp
p $_head = $arg0
p $i = 1

while($i<$arg1)
	p $tmp = (pList)malloc(sizeof(struct List))
	p $tmp->value = $i
	p $tmp->next = (pList)0

	p $arg0->next = $tmp

	p $i = $i+1
	p $arg0 = $arg0->next
end

p $arg0 = $_head
end
