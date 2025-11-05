-- ====================================================================
--                      DECODER FOR INTEL4004
-- ====================================================================
-- This was probably the module that really had to make me use my  
-- imagination to learn this. This was complex but its easily one of the
-- most important and rewarding parts to know about any modern CPU
-- The decoder takes the 8-bit opcode that was given from the the ROM
-- and then the Decoder decodes it and tells what goes to where
-- for example for the alu. The decoder if it sees a "0001" for the upper
-- 4 bits of the opcode it then tells the alu_opcode that its a "0000"
-- which is an ADD. then it gives the reg_sel the lower 4 bits of the opcode
-- wihle telling alu and reg that its enabled/ready to write. 
-- and then the program counter increments
-- I memorized this higher than usualy 20 attemps to where
-- I can practice with no references and then I typed this code
-- out from memory 100 times after that.
-- ====================================================================
library ieee;                                                           -- This is the standard VHDL library we will be using
use ieee.std_logic_1164.all;                                            -- This allows us to use std_logic and std_logic_vector
use ieee.numeric_std.all;                                               -- This allows us to use unsigned and signed which is important for CPU logic

entity Decoder is                                                       -- This is the Decoder that we are declaring into an Entity format
    Port (
        opcode                  : in std_logic_vector(7 downto 0);      -- This is the 8 bit opcode that is coming from the ROM
        alu_op                  : out std_logic_vector(3 downto 0);     -- this is the alu_op that we are going to output to the alu
        reg_sel                 : out std_logic_vector(3 downto 0);     -- this is the reg_sel that we are utputing to the register
        reg_write               : out std_logic;                        -- this is a "on" or "off" for a register write
        alu_enable              : out std_logic;                        -- this is a "on" or "off" for enabling the alu
        pc_load                 : out std_logic;                        -- this is the program counter load 
        pc_inc                  : out std_logic                         -- tells it whether or not to increment the program coutner.
    );  
end Decoder;

architecture Intel4004 of Decoder is                                    -- declares the Decoder into the Intel4004 architecture
begin   
    process(opcode)                                                     -- begins the process involving opcode
    begin
        alu_op                  <= "0000";                              -- all of these down below we are declaring at zero
        alu_enable              <= '0';                                 -- for a sanity check because it might keep pc_load
        pc_inc                  <= '0';                                 -- at "1" before we even begin which can cause problems
        pc_load                 <= '0';
        reg_sel                 <= "0000";
        reg_write               <= '0';

        case opcode(7 downto 4) is                                      -- this is declaring opcode but the upper 4 bits
            when "0001" =>                                              -- this is for the ADD for the alu
                alu_op          <= "0000";
                alu_enable      <= '1';
                reg_sel         <= opcode(3 downto 0);
                reg_write       <= '1';
                pc_inc          <= '1';
            when "0010" =>                                              -- for the alu this is the SUB
                alu_op          <= "0001";
                alu_enable      <= '1';
                reg_sel         <= opcode(3 downto 0);
                reg_write       <= '1';
                pc_inc          <= '1';
            when "0011" =>                                              -- for the alu this is the AND
                alu_op          <= "0010";
                alu_enable      <= '1';
                reg_sel         <= opcode(3 downto 0);
                reg_write       <= '1';
                pc_inc          <= '1';
            when "0100" =>                                              -- for the alu this is the OR 
                alu_op          <= "0011";
                alu_enable      <= '1';
                reg_sel         <= opcode(3 downto 0);
                reg_write       <= '1';
                pc_inc          <= '1';
            when "0101" =>                                               -- this is newly added, this is to support XOR
                alu_op          <= "0100";
                alu_enable      <= '1';
                reg_sel         <= opcode(3 downto 0);
                reg_write       <= '1';
                pc_inc          <= '1';
            when "1000" =>                                              -- this is for the JMP. 
                pc_inc          <= '0';
                pc_load         <= '1';
            when others =>                                              -- this is if its another one non recognized this is a sanity check then just increments the program counter
                pc_inc          <= '1';
        end case;
    end process;
end Intel4004;

            
    
