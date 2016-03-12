def test
init-if-undefined $RESULT = 0
set $expected = (pList)$arg0
set $actual = (pList)$arg1->next 
set $RESULT = $actual != $expected
end
