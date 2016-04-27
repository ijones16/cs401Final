library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;

entity alu is -- Arithmetic/Logic unit with add/sub, AND, OR, set less than
  port(a, b:       in  STD_LOGIC_VECTOR(31 downto 0);
       alucontrol: in  STD_LOGIC_VECTOR(3 downto 0);
       result:     inout STD_LOGIC_VECTOR(31 downto 0);
       zero:       out STD_LOGIC);
end;

architecture behave of alu is
  signal b2, sum, slt: STD_LOGIC_VECTOR(31 downto 0);
begin
  b2 <= not b when alucontrol(3) = '1' else b;
  sum <= a + b2 + alucontrol(3);
  -- slt should be 1 if most significant bit of sum is 1
  slt <= X"00000001" when sum(31) = '1' else X"00000000";
  with alucontrol(2 downto 0) select result <=
    a and b when "000",
    a or b  when "001",
	 a xor b when "011",
	 a nor b when "010",
    sum     when "100",
    slt     when others;
  zero <= '1' when result = X"00000000" else '0';
end;
