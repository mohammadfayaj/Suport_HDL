use std.textio.all;
library work;
use work.quine_mccluskey.all;
entity testbench_qm is
end entity testbench_qm;

architecture EX_ACCESS of testbench_qm is
	shared variable min: minimizer;
begin

process begin
	min.load_function;
end process;


end architecture EX_ACCESS;
