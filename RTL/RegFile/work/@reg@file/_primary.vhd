library verilog;
use verilog.vl_types.all;
entity RegFile is
    generic(
        DATAWIDTH       : integer := 8;
        DEPTH           : integer := 16;
        ADDR            : integer := 4
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        Address         : in     vl_logic_vector;
        WrEn            : in     vl_logic;
        RdEn            : in     vl_logic;
        WrData          : in     vl_logic_vector;
        RdData          : out    vl_logic_vector;
        RdData_Valid    : out    vl_logic;
        REG0            : out    vl_logic_vector;
        REG1            : out    vl_logic_vector;
        REG2            : out    vl_logic_vector;
        REG3            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR : constant is 1;
end RegFile;
