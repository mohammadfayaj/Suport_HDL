ghdl -a --std=02 ..\src\list_pkg.vhd ..\src\test_list.vhd 
ghdl -e --std=02 test_list
ghdl -r --std=02 test_list --vcd=sim.vcd --disp-tree