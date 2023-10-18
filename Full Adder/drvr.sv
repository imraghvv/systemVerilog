class driver;

//handles
    virtual inf vif;
    mailbox gen2drv;

//New function 
    function new(mailbox gen2drv, virtual inf vif);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction //new()

//reset
    task reset;
        if (vif.reset)
            vif.a <= 0;
            vif.b <= 0;
            vif.cin <= 0;   
    endtask 

//main 
    task  main;
        repeat(10)
        begin
            transaction trxn;
            gen2drv.get(trxn);
            vif.a <= trxn.a;
            vif.b <= trxn.b;
            vif.cin <= trxn.cin;
            trxn.cout = vif.count;
            trxn.s = vif.s;
            trxn.display("Driver");
        end
    endtask     


endclass 
