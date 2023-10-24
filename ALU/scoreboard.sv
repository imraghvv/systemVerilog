class scoreboard;

    mailbox m2;

    function new(mailbox m2);
        this.m2 = m2;    
    endfunction //new()

    task main();
        transaction tx;
        repeat(10)
        begin
            m2.get(tx);
            if ((o == 2'b00 ) && (tx.a ^ tx.b == tx.result) && (tx.a && tx.b == tx.c))
                $display("result as expected");
            else if ((o == 2'b01 ) && (tx.a && tx.b == tx.result))
                $display("result as expected");
            else if ((o == 2'b10 ) && (tx.a ^ tx.b == tx.result) && ((~tx.a) && tx.b == tx.bo))
                $display("result as expected");
            else if ((o == 2'b11 ) && (tx.a / tx.b == tx.result))
                $display("result as expected");
            else
                $display("error");
        end 
        tx.display("scoreboard");
    endtask
endclass //scoreboard
