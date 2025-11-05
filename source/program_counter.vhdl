-- ===================================================================
--                              INTRO
-- ===================================================================
-- This is the Intro to the Program Counter for the Intel 4004 clone
-- This one pushed my brain a bit harder as I was definitely confused
-- at first but now I can confidently explain why this Program Counter
-- is so important for the Intel 4004 to actually function properly
-- ==================================================================
--              PROGRAM COUNTER MAIN RESPONSIBILITY
-- ==================================================================
-- The program counter's main responsibility is to keep track 
-- of the data so the CPU knows what instruction is next after the 
-- current one. if you are an OS Dev think of it like whenever you 
-- are writing assembly code for the architecture you are developing
-- on and each line is a next instruction. The program counter keeps
-- track of the next line of that assembly file and reads through it
-- and then the logic of the cpu will handle the rest after thbe program
-- counter outputs its 12 bit program that it has essentially loaded
-- ==================================================================
--                 LIBRARIES AND MODULES IMPORTED
-- ==================================================================
library ieee;                                                        -- This is a must, our code will not work at all without it
use ieee.std_logic_1164.all;                                         -- this imports the standard logic from IEEE and allows for "std_logic" and "std_logic_vector" to be accessed
use ieee.numeric_std.all;                                            -- this imports numeric_std which allows for unsigned and signed characters
-- ==================================================================
--                DEFINING PROGRAM COUNTER ENTITY
-- ==================================================================
entity ProgramCounter is 
    Port (
        clk             : in std_logic;                              -- This defines clk as part of the Program Counter entity (we will use this for the rising_edge)
        reset           : in std_logic;                              -- This defines the reset which we will be using to reset the pc signal set in the process(clk)
        inc             : in std_logic;                              -- This will increment the pc (000000000000) will be  (000000000001) for example
        load            : in std_logic;                              -- This will load the actual data from the data_in. This will pretty much be like Jump essentially
        data_in         : in std_logic_vector(11 downto 0);          -- This is the data_in. This takes 12 bits worth of data from lets say a bootloader.asm file and load that in.
        pc_out          : out std_logic_vector(11 downto 0)          -- This is the pc_out and what this does is exports (prints) the final ProgramCounter to the output, the result of everything essentially
    );
end ProgramCounter;
-- =================================================================
--    DEFINING PROGRAMCOUNTER INTO THE INTEL 4004 ARCHITECTURE
-- =================================================================
architecture Intel4004 of ProgramCounter is
    signal pc : std_logic_vector(11 downto 0);                      -- We need this if we actually want to count the data
begin 
    process(clk)                                                    -- defines clk as a process
        if rising_edge(clk) then                                    -- Since clk is the process, pretty much how a cpu works is it goes from 0 to 1 at a fast rate of speed, this is saying once this is almost at a state of 1, it goes into an if statement
            if reset = '1' then 
                pc <= (others => '0');                              -- This defines the pc to reset to '0', it essentially clears the pc 
            elsif inc = '1' then 
                pc <= std_logic_vector(unsigned(pc) + 1);           -- This increments the pc by 1
            elsif load = '1' then 
                pc <= data_in;                                      -- loads data_in into the pc
            end if;
        end if;
    end process;
    pc_out <= pc;                                                   -- outputs the final results of pc to the output
end Intel4004;
