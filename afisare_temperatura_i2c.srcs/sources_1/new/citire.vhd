library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

entity i2c_read is
    Port (clk: in std_logic;
          dd1: out std_logic_vector(3 downto 0);
          dd2:out std_logic_vector(3 downto 0);
          dd3:out  std_logic_vector(3 downto 0);
          dd4:out std_logic_vector(3 downto 0);
          temp: in std_logic_vector(19 downto 0));
end i2c_read;

architecture Behavioral of i2c_read is
signal d1: integer:=0;
signal d2: integer:=0;
signal d3: integer:=0;
signal d4: integer:=0;
signal tempp: std_logic_vector(19 downto 0):=temp;
begin
process (clk)
variable te: integer:=0;
variable tee: integer:=0;
begin

for k in 0 to 19 loop
if (tempp(k) = '1') then
te := te+2**k;
end if;
end loop; 

tee :=(te*1000)/52429-5000;
d4 <= tee mod 10;
d3 <= (tee/10) mod 10;
d2 <= (tee/100) mod 10;
d1 <= (tee/1000)mod 10;
te :=0;
               
        case d1 is 
                     when 0 => dd1 <="0000";
                     when 1 => dd1 <="0001";
                     when 2 => dd1 <="0010";
                     when 3 => dd1 <="0011";
                     when 4 => dd1 <="0100";
                     when 5 => dd1 <="0101";
                     when 6 => dd1 <="0110";
                     when 7 => dd1 <="0111";
                     when 8 => dd1 <="1000";
                     when 9 => dd1 <="1001";
                     when others => dd1 <="1111";
                     end case;          
        case d2 is 
                         when 0 => dd2 <="0000";
                         when 1 => dd2 <="0001";
                         when 2 => dd2 <="0010";
                         when 3 => dd2 <="0011";
                         when 4 => dd2 <="0100";
                         when 5 => dd2 <="0101";
                         when 6 => dd2 <="0110";
                         when 7 => dd2 <="0111";
                         when 8 => dd2 <="1000";
                         when 9 => dd2 <="1001";
                         when others => dd2 <="1111";
                         end case;  
        case d3 is 
                             when 0 => dd3 <="0000";
                             when 1 => dd3 <="0001";
                             when 2 => dd3 <="0010";
                             when 3 => dd3 <="0011";
                             when 4 => dd3 <="0100";
                             when 5 => dd3 <="0101";
                             when 6 => dd3 <="0110";
                             when 7 => dd3 <="0111";
                             when 8 => dd3 <="1000";
                             when 9 => dd3 <="1001";
                             when others => dd3 <="1111";
                             end case;
        case d4 is 
     when 0 => dd4 <="0000";
     when 1 => dd4 <="0001";
     when 2 => dd4 <="0010";
     when 3 => dd4 <="0011";
     when 4 => dd4 <="0100";
     when 5 => dd4 <="0101";
     when 6 => dd4 <="0110";
     when 7 => dd4 <="0111";
     when 8 => dd4 <="1000";
     when 9 => dd4 <="1001";
     when others => dd4 <="1111";
     end case;
     
     
end process;


end Behavioral;
