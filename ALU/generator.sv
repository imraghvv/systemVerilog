class generator;

    rand transaction tx;
    mailbox m1;
    

    function new(mailbox m1);
        this.m1=m1;
    endfunction 

    task main();
        repeat (10) begin
            tx = new();
            tx.randomize();
            m1.put(tx);
            tx.display("generator");
        end
    endtask 

endclass    

