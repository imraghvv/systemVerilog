`include "trans.sv"
`include "gen.sv"
`include "drvr.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class env;

    generator gen;
    driver drv;
    virtual inf vif;
    mailbox gen2drv;
    mailbox mon2scb;
    monitor mon;
    scoreboard scr;


    function new(virtual inf vif);
        this.vif=vif;
        gen2drv = new();
        mon2scb = new();
        gen=new(gen2drv);
        drv=new(gen2drv,vif);    
        mon=new(mon2scb,vif);
        scr=new(mon2scb)
    endfunction //new()

//presest(reset) task, main((test) task, run task
    task preset;
        drv.reset();        
    endtask //automatic

    task test;
        fork
            gen.main();
            drv.main();
            mon.main();
            scr.main();        
        join
    endtask //automatic

    task run;
        preset();  
        test();
        $finish;      
    endtask //automatic
    

endclass 


