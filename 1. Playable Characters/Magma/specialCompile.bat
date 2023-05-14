REM Cyclops works a bit differently because his visor boltons are skin-specific
REM rename all cfg files to something else so that fbbuilder won't go for them. 
ren *.cfg *.txt
REM skin 3601
ren magma_3601.fb.txt magma_3601.fb.cfg
ren magma_3601_nc.fb.txt magma_3601_nc.fb.cfg
call fbbuilder.bat
ren magma_3601.fb.cfg magma_3601.fb.txt
ren magma_3601_nc.fb.cfg magma_3601_nc.fb.txt
ren actors\3610.igb 3610_3601.igb
REM skin 3602
ren magma_3602.fb.txt magma_3602.fb.cfg
ren magma_3602_nc.fb.txt magma_3602_nc.fb.cfg
ren actors\3610_3602.igb 3610.igb
call fbbuilder.bat
ren magma_3602.fb.cfg magma_3602.fb.txt
ren magma_3602_nc.fb.cfg magma_3602_nc.fb.txt
ren actors\3610.igb 3610_3602.igb
REM skin 3603
ren magma_3603.fb.txt magma_3603.fb.cfg
ren magma_3603_nc.fb.txt magma_3603_nc.fb.cfg
ren actors\3610_3603.igb 3610.igb
call fbbuilder.bat
ren magma_3603.fb.cfg magma_3603.fb.txt
ren magma_3603_nc.fb.cfg magma_3603_nc.fb.txt
ren actors\3610.igb 3610_3603.igb
REM skin 3604
ren magma_3604.fb.txt magma_3604.fb.cfg
ren magma_3604_nc.fb.txt magma_3604_nc.fb.cfg
ren actors\3610_3604.igb 3610.igb
call fbbuilder.bat
ren magma_3604.fb.cfg magma_3604.fb.txt
ren magma_3604_nc.fb.cfg magma_3604_nc.fb.txt
ren actors\3610.igb 3610_3604.igb
REM skin 3605
ren magma_3605.fb.txt magma_3605.fb.cfg
ren magma_3605_nc.fb.txt magma_3605_nc.fb.cfg
ren actors\3610_3605.igb 3610.igb
call fbbuilder.bat
ren magma_3605.fb.cfg magma_3605.fb.txt
ren magma_3605_nc.fb.cfg magma_3605_nc.fb.txt
ren actors\3610.igb 3610_3605.igb
REM skin 3606
ren magma_3606.fb.txt magma_3606.fb.cfg
ren magma_3606_nc.fb.txt magma_3606_nc.fb.cfg
ren actors\3610_3606.igb 3610.igb
call fbbuilder.bat
ren magma_3606.fb.cfg magma_3606.fb.txt
ren magma_3606_nc.fb.cfg magma_3606_nc.fb.txt
ren actors\3610.igb 3610_3606.igb
REM skin 3607
ren magma_3607.fb.txt magma_3607.fb.cfg
ren magma_3607_nc.fb.txt magma_3607_nc.fb.cfg
ren actors\3610_3607.igb 3610.igb
call fbbuilder.bat
ren magma_3607.fb.cfg magma_3607.fb.txt
ren magma_3607_nc.fb.cfg magma_3607_nc.fb.txt
ren actors\3610.igb 3610_3607.igb
REM skin 3608
ren magma_3608.fb.txt magma_3608.fb.cfg
ren magma_3608_nc.fb.txt magma_3608_nc.fb.cfg
ren actors\3610_3608.igb 3610.igb
call fbbuilder.bat
ren magma_3608.fb.cfg magma_3608.fb.txt
ren magma_3608_nc.fb.cfg magma_3608_nc.fb.txt
ren actors\3610.igb 3610_3608.igb
REM skin 3609
ren magma_3609.fb.txt magma_3609.fb.cfg
ren magma_3609_nc.fb.txt magma_3609_nc.fb.cfg
ren actors\3610_3609.igb 3610.igb
call fbbuilder.bat
ren magma_3609.fb.cfg magma_3609.fb.txt
ren magma_3609_nc.fb.cfg magma_3609_nc.fb.txt
ren actors\3610.igb 3610_3609.igb
REM NPC packages (and restore original visor bolton name)
ren actors\3610_3601.igb 3610.igb
ren magma_xml.fb.txt magma_xml.fb.cfg
call fbbuilder.bat
ren *.txt *.cfg