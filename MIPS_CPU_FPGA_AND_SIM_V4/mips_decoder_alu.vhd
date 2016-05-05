library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity aludec is -- ALU control decoder
  port(funct:      in  STD_LOGIC_VECTOR(5 downto 0);
       aluop:      in  STD_LOGIC_VECTOR(2 downto 0);
       alucontrol: out STD_LOGIC_VECTOR(3 downto 0));
end;

architecture behave of aludec is
begin
  process(aluop, funct) begin
    case aluop is
      when "000" => alucontrol <= "0100"; -- add (for lb/sb/addi)
      when "001" => alucontrol <= "1100"; -- sub (for beq)
		when "100" => alucontrol <= "0011"; -- xori
		when "011" => alucontrol <= "0010"; --nori
		when "101" => alucontrol <= "0001"; --ori
      when others => case funct is         -- R-type instructions
                         when "100000" => alucontrol <= "0100"; -- add (for add)
                         when "100010" => alucontrol <= "1100"; -- subtract (for sub)
                         when "100100" => alucontrol <= "0000"; -- logical and (for and)
                         when "100101" => alucontrol <= "0001"; -- logical or (for or)
                         when "101010" => alucontrol <= "0111"; -- set on less (for slt)
                         when "100110" => alucontrol <= "0011"; -- xor
                         when "100111" => alucontrol <= "0010"; -- nor
                         when others   => alucontrol <= "----"; -- should never happen
                     end case;
    end case;
  end process;
end;