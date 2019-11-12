ghdl -a --std=00 ..\src\list_pkg.vhd ..\src\test_list.vhd 
ghdl -e --std=00 --disp-tree test_list
ghdl -r --std=00 test_list --vcd=sim.vcd --disp-tree