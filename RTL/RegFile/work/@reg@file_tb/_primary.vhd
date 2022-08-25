library verilog;
use verilog.vl_types.all;
entity RegFile_tb is
    generic(
        DATAWIDTH       : integer := 8;
        DEPTH           : integer := 16;
        ADDR            : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATAWIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR : constant is 1;
end RegFile_tb;
