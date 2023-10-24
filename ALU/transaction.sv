class transaction;
 
    rand bit  [1:0]a;
    rand bit [1:0]b;
    rand bit [1:0] o;
    bit [1:0]result;
    bit [1:0]c;
    bit [1:0]bo;

    function void display (string name);
        $display("......................");
        $display ("%s", name);
        $display ("a = %0d,b = %0d",a,b);
        $display ("o = %0d", o);
        $display ("result = %0d, c = %0d,bo = %0d",result, c, bo);
        $display("......................");    
    endfunction //new()
endclass //transaction