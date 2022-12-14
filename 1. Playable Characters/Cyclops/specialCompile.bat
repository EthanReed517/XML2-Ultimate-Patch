REM Cyclops works a bit differently because his visor boltons are skin-specific
REM rename all cfg files to something else so that fbbuilder won't go for them. 
ren *.cfg *.txt
REM skin 0101
ren cyclops_0101.fb.txt cyclops_0101.fb.cfg
ren cyclops_0101_nc.fb.txt cyclops_0101_nc.fb.cfg
call fbbuilder.bat
ren cyclops_0101.fb.cfg cyclops_0101.fb.txt
ren cyclops_0101_nc.fb.cfg cyclops_0101_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor01.igb
REM skin 0102
ren cyclops_0102.fb.txt cyclops_0102.fb.cfg
ren cyclops_0102_nc.fb.txt cyclops_0102_nc.fb.cfg
ren models\bolton\cyclops_visor02.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0102.fb.cfg cyclops_0102.fb.txt
ren cyclops_0102_nc.fb.cfg cyclops_0102_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor02.igb
REM skin 0103
ren cyclops_0103.fb.txt cyclops_0103.fb.cfg
ren cyclops_0103_nc.fb.txt cyclops_0103_nc.fb.cfg
ren models\bolton\cyclops_visor03.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0103.fb.cfg cyclops_0103.fb.txt
ren cyclops_0103_nc.fb.cfg cyclops_0103_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor03.igb
REM skin 0104
ren cyclops_0104.fb.txt cyclops_0104.fb.cfg
ren cyclops_0104_nc.fb.txt cyclops_0104_nc.fb.cfg
ren models\bolton\cyclops_visor04.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0104.fb.cfg cyclops_0104.fb.txt
ren cyclops_0104_nc.fb.cfg cyclops_0104_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor04.igb
REM skin 0105
ren cyclops_0105.fb.txt cyclops_0105.fb.cfg
ren cyclops_0105_nc.fb.txt cyclops_0105_nc.fb.cfg
ren models\bolton\cyclops_visor05.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0105.fb.cfg cyclops_0105.fb.txt
ren cyclops_0105_nc.fb.cfg cyclops_0105_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor05.igb
REM skin 0106
ren cyclops_0106.fb.txt cyclops_0106.fb.cfg
ren cyclops_0106_nc.fb.txt cyclops_0106_nc.fb.cfg
ren models\bolton\cyclops_visor06.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0106.fb.cfg cyclops_0106.fb.txt
ren cyclops_0106_nc.fb.cfg cyclops_0106_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor06.igb
REM skin 0107
ren cyclops_0107.fb.txt cyclops_0107.fb.cfg
ren cyclops_0107_nc.fb.txt cyclops_0107_nc.fb.cfg
ren models\bolton\cyclops_visor07.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0107.fb.cfg cyclops_0107.fb.txt
ren cyclops_0107_nc.fb.cfg cyclops_0107_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor07.igb
REM skin 0108
ren cyclops_0108.fb.txt cyclops_0108.fb.cfg
ren cyclops_0108_nc.fb.txt cyclops_0108_nc.fb.cfg
ren models\bolton\cyclops_visor08.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0108.fb.cfg cyclops_0108.fb.txt
ren cyclops_0108_nc.fb.cfg cyclops_0108_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor08.igb
REM skin 0109
ren cyclops_0109.fb.txt cyclops_0109.fb.cfg
ren cyclops_0109_nc.fb.txt cyclops_0109_nc.fb.cfg
ren models\bolton\cyclops_visor09.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0109.fb.cfg cyclops_0109.fb.txt
ren cyclops_0109_nc.fb.cfg cyclops_0109_nc.fb.txt
ren models\bolton\cyclops_visor.igb cyclops_visor09.igb
REM NPC packages (and restore original visor bolton name)
ren models\bolton\cyclops_visor01.igb cyclops_visor.igb
ren cyclops_xml.fb.txt cyclops_xml.fb.cfg
ren cyclops_mc_20012.fb.txt cyclops_mc_20012.fb.cfg
ren cyclops_mc_20012_nc.fb.txt cyclops_mc_20012.fb.cfg
ren cyclopssimple_0101.fb.txt cyclopssimple_0101.fb.cfg
ren cyclopssimple_0101_nc.fb.txt cyclopssimple_0101_nc.fb.cfg
ren sin_cyc_0100.fb.txt sin_cyc_0100.fb.cfg
ren sin_cyc_0100_nc.fb.txt sin_cyc_0100_nc.fb.cfg
call fbbuilder.bat
ren *.txt *.cfg