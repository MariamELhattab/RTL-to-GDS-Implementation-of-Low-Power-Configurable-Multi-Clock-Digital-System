library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        DATAWIDTH       : integer := 8;
        FUNC            : integer := 4
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        ALU_FUNC        : in     vl_logic_vector;
        Enable          : in     vl_logic;
        ALU_OUT         : out    vl_logic_vector;
        OUT_VALID       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of FUNC : constant is 1;
end ALU;
