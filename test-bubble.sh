#!/bin/bash

echo 'b main' >> _tmp.gdb
echo 'r' >> _tmp.gdb
echo 'source scripts/create_list.gdb' >> _tmp.gdb
echo 'source scripts/print_list.gdb' >> _tmp.gdb
echo 'source scripts/free_list.gdb' >> _tmp.gdb

echo 'def test' >>_tmp.gdb
echo 'init-if-undefined $RESOULT = 0' >>_tmp.gdb
echo 'p $RESOULT = $arg0 != $arg1' >>_tmp.gdb
echo 'end' >>_tmp.gdb

echo 'set $head = (pList*)malloc(sizeof(pList))' >> _tmp.gdb

echo 'set logging file '$2>>_tmp.gdb

echo ' '>$2
exec < $1

while  (read var) 
do
	read var
	list_length=$var

	echo 'create_list (*($head)) '$list_length >> _tmp.gdb
	read var
	list_value=($var)
    read var
    list_expcted=($var)

	echo 'set $_head = (*($head))' >> _tmp.gdb

	for value in "${list_value[@]}"
	do
		echo 'p $_head->value = '$value >> _tmp.gdb
		echo 'p $_head = $_head->next' >> _tmp.gdb
	done

	echo 'set logging on' >> _tmp.gdb
	echo 'p "test begin"' >> _tmp.gdb
	echo 'p "old_list"' >> _tmp.gdb
	echo 'printf_list (*($head))' >> _tmp.gdb
	echo 'set logging off' >> _tmp.gdb
	echo 'p bubble_sort($head)' >> _tmp.gdb
	echo 'set logging on' >> _tmp.gdb
	echo 'p "new_list"' >> _tmp.gdb
	echo 'printf_list (*($head))' >> _tmp.gdb

	echo 'set $_head = (*($head))' >> _tmp.gdb
	for value in "${list_expcted[@]}"
	do
        echo 'p "test '$value' $_head->value"'>> _tmp.gdb
        echo 'test '$value' $_head->value '>> _tmp.gdb
        echo 'set $_head = $_head->next' >> _tmp.gdb
	done
	echo 'set logging off' >> _tmp.gdb
	echo 'free_list (*($head))' >> _tmp.gdb
done

echo 'q' >> _tmp.gdb
echo 'y' >> _tmp.gdb

gdb -q -x _tmp.gdb bin-bubble >>/dev/null
result=$?
if [ ${result} -ne 0 ] 
then
    echo "!!!!!! Fail !!!!!!"
else
    echo "Pass"
fi
rm _tmp.gdb
exit $result
