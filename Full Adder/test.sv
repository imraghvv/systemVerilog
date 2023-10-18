`include "env.sv"
program test(inf vif);

    env envi;
    initial begin
        envi= new(vif);
        envi.run();
    end
    
endprogram //test
    

