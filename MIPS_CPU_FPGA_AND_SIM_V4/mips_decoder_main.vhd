
library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity maindec is -- main control decoder
  port(op:                 in  STD_LOGIC_VECTOR(5 downto 0);
       memtoreg, memwrite: out STD_LOGIC;
       branch:     out STD_LOGIC_VECTOR(1 downto 0);
       alusrc: out STD_LOGIC_VECTOR(1 downto 0);
		 regdst, regwrite:   out STD_LOGIC;
       jump:               out STD_LOGIC;
       aluop:              out  STD_LOGIC_VECTOR(2 downto 0));
end;

architecture behave of maindec is
  signal controls: STD_LOGIC_VECTOR(11 downto 0);
begin
  process(op) begin
    case op is
      when "000000" => controls <= "110000000110"; -- Rtype -- xor nor
      when "100011" => controls <= "100100010000"; -- LW
      when "101011" => controls <= "0X10100X0000"; -- SW
      when "000100" => controls <= "0X00100X0001"; -- BEQ
      when "001000" => controls <= "101000000000"; -- ADDI
      when "000010" => controls <= "0XXXXX0X1XXX"; -- J
      when "001101" => controls <= "101000000101"; -- ORI
      when "000101" => controls <= "0X00010X0001"; -- BNE
      when "001001" => controls <= "101000000100"; -- XORI
      when "001111" => controls <= "101000000011"; -- NORI
      when others   => controls <= "------------"; -- illegal op
    end case;
  end process;
--101000000100
  regwrite <= controls(11);
  regdst   <= controls(10);
  alusrc   <= controls(9 downto 8);
  branch   <= controls(7 downto 6);
  memwrite <= controls(5);
  memtoreg <= controls(4);
  jump     <= controls(3);
  aluop    <= controls(2 downto 0);
end;


