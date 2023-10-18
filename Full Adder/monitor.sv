class monitor;
    virtual inf vif;
    mailbox mon2scb;
    
    function new(mailbox mon2scb, virtual inf vif);
        this.vif = vif;
        this.mon2scb = mon2scb;        
    endfunction //new()

    task main;
        repeat(10)
        #5;
        begin
            transaction trxn;
            trxn = new();    
            trxn.a = vif.a;    
            trxn.b = vif.b;    
            trxn.cin = vif.cin;    
            trxn.s = vif.s;    
            trxn.cout = vif.cout;
            mon2scb.put(trxn);
            trxn.display("monitor");
        end       
    endtask //automatic main;

endclass //monitor