create_project proj -force
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]
add_files -norecurse {../src/test_list.vhd ../src/quine_mccluskey.vhd ../src/list_pkg.vhd ../src/testbench.vhd}
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1

