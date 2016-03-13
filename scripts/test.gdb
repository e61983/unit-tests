def test
init-if-undefined $RESULT = 0
set $RESULT = $RESULT + ($arg0 != $arg1)
if ( $RESULT > 0 )
    p "Test Fail" 
end
end
