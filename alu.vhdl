-- =======================================================================================
--              INTRO TO THE ARITHMETIC LOGIC UNIT BASED ON 4004
-- =======================================================================================
-- Sup I am Alex Gomez, I am a 19 year old who is in a major in IT for an Associates
-- I was creating an Operating System using assembly code which I thought was an operating
-- System my teacher did say I was wrong and wasn't creating an OS. He mentioned something 
-- About ALU and other logic like that was how and so I went on a journey while doing 
-- my back to back 16 hour shifts over the weekend and Sunday and now I have
-- hopefully theoritcally a fully wokring 4004 based ALU, Enjoy
-- =======================================================================================
--                 INTRODUCING BASIC LIBRARIES WE ARE GOING TO NEED
-- =======================================================================================
library IEEE;                                                                              -- # This is the library that we are going to need if we want to successfully create an ALU
use IEEE.std_logic_1164.all;                                                               -- # this is the heart and soul of the alu, this introduces standard logic with two modules (std_logic) (std_logic_vector)
use IEEE.numeric_std.all;                                                                  -- # This will make it allow us to use usigned and signed characters
-- ========================================================================================
--                              ARITHMETIC LOGIC UNIT ENTITY
-- ========================================================================================
entity ALU is 
    Port (
        A, B        : in std_logic_vector(3 downto 0);                                      -- # This makes the A and B inputs that are assigned to 4-bit
        Op          : in std_logic_vector(3 downto 0);                                      -- # this is where we define the op (being "00" for ADD, "01" for SUB "10" for AND "11" for OR)
        R           : out std_logic_vector(3 downto 0);                                     -- # This is where we define the Results after the process of (A, B, Op) 
        Z           : out std_logic		                                                    -- # This is the Zero flag
        );
end ALU;

-- ==================================================================================================
--                             ADDS ALU TO THE ARCHITECTURE
-- ==================================================================================================
architecture AG_4004 of ALU is 
begin 
	process(A, B, Op)
	begin 
		case Op is 
			when "0000" =>	
				R <= std_logic_vector(unsigned(A) + unsigned(B));
			when "0001" =>
				R <= std_logic_vector(unsigned(A) - unsigned(B));
			when "0010" =>
				R <= A and B;
			when "0011" =>
				R <= A or B;
			when others =>
				R <= (others => '0');
		end case;
		
		if R = "0000" then 
			Z <= '1';
		else 
			Z <= '0';
		end if;
		
	end process;
end AG_4004;
-- ==================================================================================================
--                                          OUTRO
-- ==================================================================================================
-- All in all I am very interested in VHDL now to a point where I am starting to come up with ideas
-- for a new architecture. Symbolic_x86 that combines a BPU (Binary Processing Unit) for classic 
-- Computing. SPU (Symbolic Processing Unit) for Symbolic Computing, (Smart Memory Bridge) handles
-- Cache, has Permenant memory that can be accessed by the SysMan, and is a binary to symbolic converter
-- and vice versa to ease the load of the BPU during classic computing (binary computing)
-- The SysMAn is a Hardware level overseer (think of it like a General Manager of a supermarket)
-- and the SysMan can also be accessed by a shell and sits inside the CPU and can be accessed either 
-- remotely encrypted or by pressing a certain amoutn of keys im not too sure but I want SysMan to
-- be the protector at a low-level point that has a shell where you can talk directly to your CPU
-- But I have more ideas that just flow to my head every single time I program and I just want to 
-- express them to the world and create these projects but its hard to find learning sources for 
-- learning VHDL, and learning how to create a full CPU, I want to try to attempt to create
-- the 4004 on my own, 8008, 8088, and maybe all the way up to the i286 one day, I wanna udnerstand computers
-- because computers has been my passions for most of my life. Idk if I should keep going for IT
-- or if I should change career paths to Computer Science, please let me know Mr. Surratt
-- (I do plan on creating a testbench for this, I just need to learn how to do so)
