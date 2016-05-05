----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Katie & Elias
-- 
-- Create Date:     11/28/1015
-- Design Name: 
-- Module Name:    vga_gen - Behavioral 
-- Project Name: Frogger
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vgatest is
port(clk50_in : in std_logic;
up : in  std_logic;
down : in std_logic;
red_out : out std_logic_vector(2 downto 0);
green_out : out std_logic_vector(2 downto 0);
blue_out : out std_logic_vector(2 downto 0);
hs_out : out std_logic;
vs_out : out std_logic);
end vgatest;

architecture behavioral of vgatest is

signal clk25              : std_logic;
signal hcounter : integer range 0 to 800;
signal vcounter   : integer range 0 to 521;
signal color: std_logic_vector(2 downto 0);
signal color1: std_logic_vector(2 downto 0);
--u w t s are different speed variables for the cars moving across the screen
--frog is the locaiton of the frog vertically on the screen
--reset and resetProc are signals used for traking whether or not our frog has been hit in 2 seperate processes, the movement process and the animate process
--won is whether you've won or not or gotten to the water
signal u: integer := 0;
signal w: integer := 50 ;
signal t: integer :=0;
signal s: integer :=50;
signal frog: integer := 380;
signal reset: boolean := false;
signal resetProc: boolean := false;
signal won: boolean := false;
begin

-- generate a 25Mhz clock
process (clk50_in)
begin
  if clk50_in'event and clk50_in='1' then
    clk25 <= not clk25;
  end if;
end process;

-- this process keeps track of the different speeds of the different cars, and incriments them, or resets them
p1: process (clk25)
	variable cnt: integer;
	variable back : integer := 0;
begin
	if clk25'event and clk25='1' then
		cnt := cnt + 1;
		if ((cnt = 5000000) and (won = false)) then
			
			color <= "111";
			color1 <= "101";
			
			
			if( ((u < 700) and (w < 750))) then
					u <= u + 50;
					w <= w + 50;
			else
				u <= 0;
				w <= 50;
			
			end if;
			if( ((t < 700) and (s < 750))) then
					t <= t + 20;
					s <= s + 20;
			else
				t <= 0;
				s <= 50;
			
			end if;
			cnt := 0;
			resetProc <=false;
		if(reset = true) then
				frog <= 380;
				resetProc <= true;
			end if;	
			--this is just tracking whether up and down are hit, and if they are hit it changes the position of the frog
			if(up = '0') then
				frog <= frog + 10;
			elsif(down = '0') then
				frog <= frog - 10;
			end if;
		end if;
	end if;
end process;

p2: process (clk25, hcounter, vcounter)
	variable x: integer range 0 to 639;
	variable y: integer range 0 to 479;
	
begin
	-- hcounter counts from 0 to 799
	-- vcounter counts from 0 to 520
	-- x coordinate: 0 - 639 (x = hcounter - 144, i.e., hcounter -Tpw-Tbp)
	-- y coordinate: 0 - 479 (y = vcounter - 31, i.e., vcounter-Tpw-Tbp)
	x := hcounter - 144;
	y := vcounter - 31;

	
  	if clk25'event and clk25 = '1' then
 		-- To draw a pixel in (x0, y0), simply test if the ray trace to it
		--if( ((u < 500) and (w < 550))) then
		
		--else
			--u := 0;
			--w := 50;
	--	end if;
		
		--this loop is animating each car 	
	 	
			if ( (( x > u) and (x < w)) and ((y > 50) and (y < 70)) ) then
				if((( frog >= 50) and (frog <= 70)) and ((330 >= u) and (340 <= w))) then
					reset <= true;
					end if;
				red_out <= color;
				green_out <= color; 
				blue_out <= color;
			elsif( (( x > t) and (x < s )) and ((y > 100) and (y < 120)) ) then
				if((( frog >= 100) and (frog <= 120)) and ((330 >= t) and (340 <= s))) then
					reset <= true;
					end if;
				red_out <= "000";
				green_out <= "111"; 
				blue_out <= "000";
			elsif( (( (x + 100) > t) and ((x + 100) < s )) and ((y > 150) and (y < 170)) ) then
				if((( frog >= 150) and (frog <= 170)) and ((330 >= (t - 100)) and (340 <= (s-100)))) then
					reset <= true;
					end if;
				red_out <= "000";
				green_out <= "000"; 
				blue_out <= "111";
			elsif( (( (x + 50) > u) and ( (x + 50) < w )) and ((y > 190) and (y < 210)) ) then
				if((( frog >= 190) and (frog <= 210)) and ((330 >= (u - 50)) and (340 <= (w-50)))) then
					reset <= true;
					end if;
				red_out <= "111";
				green_out <= "000"; 
				blue_out <= "111";
			elsif( (( (x + 70) > u) and ( (x + 70) < w )) and ((y > 230) and (y < 250)) ) then
				if((( frog >= 230) and (frog <= 250)) and ((330 >= (u - 70)) and (340 <= (w - 70)))) then
					reset <= true;
					end if;
				red_out <= "000";
				green_out <= "111"; 
				blue_out <= "111";
			elsif( (( (x + 20 ) > t) and ( (x  + 20) < s )) and ((y > 270) and (y < 290)) ) then
				if((( frog >= 270) and (frog <= 290)) and ((330 >= (t - 20)) and (340 <= (s - 20)))) then
					reset <= true;
					end if;
				red_out <= "111";
				green_out <= "111"; 
				blue_out <= "111";
			elsif( (( (x + 200) > t) and ( (x + 200) < s )) and ((y > 310) and (y < 330)) ) then
				if((( frog >= 310) and (frog <= 330)) and ((330 >= (t - 200)) and (340 <= (s-200)))) then
					reset <= true;
					end if;
				red_out <= "111";
				green_out <= "111"; 
				blue_out <= "000";
			elsif( (( (x + 130) > t) and ( (x + 130) < s )) and ((y > 350) and (y < 370)) ) then
				if((( frog >= 350) and (frog <= 370)) and ((330 >= (t - 130)) and (340 <= (s - 130)))) then
					reset <= true;
					end if;
				red_out <= "000";
				green_out <= "000"; 
				blue_out <= "000";
			--water animation
			elsif( (( x > 0) and (x < 700 )) and ((y > 0) and (y < 30)) ) then
				if((frog >= 0) and (frog <= 30)) then
					won <= true;
					red_out <= "101";
					green_out <= "010"; 
					blue_out <= "110";
				end if;
				red_out <= "000";
				green_out <= "000"; 
				blue_out <= "111";
			--frog animation
		
			elsif (( x > 330) and ( (x < 340)) and ((y > frog) and (y < (frog + 10))) ) then
				red_out <= "000";
				green_out <= "111"; 
				blue_out <= "000";
			--this is all the win animation
			elsif(  won = true) then
				if((( x > 0) and (x < 700 )) and ((y > 30) and (y < 60))) then
					red_out <= "010";
					green_out <= "111";
					blue_out <= "001";
				elsif((( x > 0) and (x < 700 )) and ((y > 60) and (y < 90))) then
					red_out <= "011";
					green_out <= "101";
					blue_out <= "001";
				elsif((( x > 0) and (x < 700 )) and ((y > 90) and (y < 120))) then
					red_out <= "100";
					green_out <= "001";
					blue_out <= "001";
				elsif((( x > 0) and (x < 700 )) and ((y > 120) and (y < 150))) then
					red_out <= "001";
					green_out <= "001";
					blue_out <= "101";
				elsif((( x > 0) and (x < 700 )) and ((y > 150) and (y < 180))) then
					red_out <= "011";
					green_out <= "011";
					blue_out <= "011";
				elsif((( x > 0) and (x < 700 )) and ((y > 180) and (y < 210))) then
					red_out <= "111";
					green_out <= "111";
					blue_out <= "111";
				elsif((( x > 0) and (x < 700 )) and ((y > 210) and (y < 240))) then
					red_out <= "100";
					green_out <= "100";
					blue_out <= "100";
				elsif((( x > 0) and (x < 700 )) and ((y > 240) and (y < 270))) then
					red_out <= "010";
					green_out <= "010";
					blue_out <= "010";
				elsif((( x > 0) and (x < 700 )) and ((y > 270) and (y < 300))) then
					red_out <= "001";
					green_out <= "001";
					blue_out <= "010";
				elsif((( x > 0) and (x < 700 )) and ((y > 300) and (y < 330))) then
					red_out <= "100";
					green_out <= "010";
					blue_out <= "100";		
				end if;

			else
				-- if not traced, set it to "black" color
				red_out <= "000";
				green_out <= "000";
				blue_out <= "000";
			end if;
			if(resetProc = true) then
				reset <= false;
			end if;
			

	 
	
	
		-- Here is the timing for horizontal synchronization.
		-- (Refer to p. 24, Xilinx, Spartan-3 Starter Kit Board User Guide)
	 	-- Pulse width: Tpw = 96 cycles @ 25 MHz
	 	-- Back porch: Tbp = 48 cycles
		-- Display time: Tdisp = 640 cycles
	 	-- Front porch: Tfp = 16 cycles
		-- Sync pulse time (total cycles) Ts = 800 cycles

    	if hcounter > 0 and hcounter < 97 then
      	hs_out <= '0';
    	else
      	hs_out <= '1';
    	end if;
		-- Here is the timing for vertical synchronization.
		-- (Refer to p. 24, Xilinx, Spartan-3 Starter Kit Board User Guide)
	 	-- Pulse width: Tpw = 1600 cycles (2 lines) @ 25 MHz
	 	-- Back porch: Tbp = 23200 cycles (29 lines)
		-- Display time: Tdisp = 38400 cycles (480 lines)
	 	-- Front porch: Tfp = 8000 cycles (10 lines)
		-- Sync pulse time (total cycles) Ts = 416800 cycles (521 lines)
    	if vcounter > 0 and vcounter < 3 then
      	vs_out <= '0';
    	else
      	vs_out <= '1';
    	end if;
	 	-- horizontal counts from 0 to 799
    	hcounter <= hcounter+1;
    	if hcounter = 800 then
      	vcounter <= vcounter+1;
      	hcounter <= 0;
    	end if;
	 	-- vertical counts from 0 to 519
    	if vcounter = 521 then		    
      	vcounter <= 0;
    	end if;
  end if;
end process;

end behavioral;