class monitor;

    virtual inf vif;
    mailbox m2;

    function new(virtual inf vif, mailbox m2);
    this.vif= vif;
    this.m2 =m2;        
    endfunction //new()

    task main();

        repeat(10) begin
            transaction tx;
            tx = new();
            tx.a = vif.a;
            tx.b = vif.b;
            tx.o = vif.o;
            @(posedge vif.clk);
            tx.result = vif.result;
            tx.c = vif.c;
            tx.bo = vif.bo;

            m2.put(tx);
            tx.display("monitor");
        end

    endtask

endclass //monitor