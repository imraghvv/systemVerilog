class transaction;
    rand bit a;
    rand bit b;
    rand bit cin;
    bit s;
    bit cout;
    function void display(string name);

        $display("......................");
        $display("%s", name);
        $display("a = %0d, b = %0d, cin = %0d", a, b, cin);
        $display("s = %0d, cout = %0d", s, cout);
        
    endfunction //new()
endclass //trx