-- =========================================================================
--                  The Control Unit for The Intel 4004
-- =========================================================================
-- This is the Control Unit for the 4004, its basic for now just like the 
-- ALU, ofc I plan to eventually make a fully fledged version of all of 
-- these modules inside the legendary Intel 4004 created by Federico Faggin
-- and the rest of the brilliant engineers at Intel in 1971. 
-- =========================================================================
library ieee;                                                               -- Again we need this, this is the standard library for VHDL
use ieee.std_logic_1164.all;                                                -- This clarifies std_logic and std_logic_vector
use ieee.numeric_std.all;                                                   -- This clarifies unsigned and signed characters to be a possiblity

entity ControlUnit is                                                       -- this clarifies the ControlUnit entity
    Port (
        clk             : in std_logic;                                     -- This is the clk, we need this for the process(clk) down below.
        reset           : in std_logic;                                     -- This is the reset and this is needed just in case a reset signal was made 
        alu_en_in       : in std_logic;                                     -- this is the alu enable in and we need this hear for if alu is enabled or not
        reg_wr_in       : in std_logic;                                     -- This is the reg_write in, this comes also from the decoder and tells the control unit if '0' or '1'
        pc_load_in      : in std_logic;                                     -- this also comes from the decoder and clarifies the pc_load 
        pc_inc_in       : in std_logic;                                     -- given from decoder and clarifies the program counter increment

        pc_load         : out std_logic;                                    -- this outputs the program counter load
        pc_inc          : out std_logic;                                    -- this outputs the program counter increment
        reg_write       : out std_logic;                                    -- this outputs the register write
        alu_enable      : out std_logic                                     -- this outputs if alu was enabled
    );
end ControlUnit;

architecture Intel4004 of ControlUnit is                                    -- this techincally imports the ControlUnit entity into the Intel4004
begin 
    process(clk)                                                            -- this starts the process clk
    begin 
        if rising_edge(clk) then                                            -- this pretty much means whenever if clk reaches to a point where its almost 1, then this all synchronizes
            if reset = '1' then                                             -- if the reset signal given equals one, clears all data
                pc_load         <= '0';                                     -- clears program counter load
                pc_inc          <= '0';                                     -- clears progam counter increment
                reg_write       <= '0';                                     -- clears register write
                alu_enable      <= '0';                                     -- clears alu_enable
            else                                                            -- else it continues and synchronizes everything.
                pc_load         <= pc_load_in;
                pc_inc          <= pc_inc_in;
                reg_write       <= reg_wr_in;
                alu_enable      <= alu_en_in;
            end if;
        end if;
    end process;
end Intel4004;

-- ==============================================================
--                            OUTRO
-- =============================================================
-- This is a basic control unit that simulates the synchronization
-- of the basic core data. Without this data will be written 
-- pretty much at random to my understanding which is also
-- not good at all to my understanding. So yeah, pretty important
-- to have this.