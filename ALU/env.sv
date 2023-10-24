`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class env;

    generator gen;
    driver drv;
    monitor mon;
    scoreboard scr;
    mailbox m1;
    mailbox m2;
    virtual inf vif;


    function new(virtual inf vif);
        this.vif = vif;
        m1 = new();
        m2 = new();
        gen = new(m1);
        drv = new(vif, m1);
        mon = new (vif, m2);
        scr = new (m2);    
    endfunction

    task t0();
        drv.reset();
    endtask
    
    task test();
        fork
            gen.main();
            drv.main();
            mon.main();
            scr.main();        
        join
    endtask

    task run();
        t0();
        test();
        $finish();
    endtask
    
endclass 