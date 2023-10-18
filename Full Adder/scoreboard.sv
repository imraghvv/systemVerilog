class scoreboard;
    mailbox mon2scb;


    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction //new()

    task main;
        transaction trxn;
        repeat(10)
            begin
                mon2scb.get(trxn);
                if ((((trxn.a^trxn.b)^trxn.cin) == trxn.s) && ((((trxn.a^trxn.b)&&trxn.cin) || trxn.a&&trxn.b) == trxn.cout))
                    $display("results as expected");
                else
                    $error("wrong result");
                
                trxn.display("scoreboard");
            end
        
    endtask //automatic

endclass 

