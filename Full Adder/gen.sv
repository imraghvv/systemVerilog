class generator;

    //handles
    rand transaction trxn;
    mailbox gen2drv;

    //New function 
    function new(mailbox gen2drv);
        this. gen2drv = gen2drv;
    endfunction //new()

    //main 
    task  main;
        repeat (10) begin
            trxn = new();
            trxn.randomize();
            gen2drv.put(trxn);
            trxn.display("Generator");
        end
    endtask 


endclass 
