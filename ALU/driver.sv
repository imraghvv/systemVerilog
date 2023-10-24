class driver;

    virtual inf vif;
    mailbox m1;

    function new(virtual inf vif, mailbox m1);
        this.vif = vif;
        this.m1 = m1;
    endfunction //new()

    task reset (); 
        if (vif.rst) begin
            vif.a <= 0;
            vif.b <= 0;        
            vif.o <= 0;
        end
    endtask

    task main ();
    repeat (10) begin
        transaction tx;
        m1.get(tx);
        vif.a <= tx.a;
        vif.b <= tx.b;        
        vif.o <= tx.o;
        @(posedge vif.clk);
        tx.result = vif.result;
        tx.bo = vif.bo;
        tx.c = vif.c;
        tx.display("Driver");
    end
    endtask

endclass 