

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity afis is
Port ( clk : in STD_LOGIC;
dd1:in std_logic_vector(3 downto 0);
dd2:in std_logic_vector(3 downto 0);
dd3:in std_logic_vector(3 downto 0);
dd4:in std_logic_vector(3 downto 0);
an : out STD_LOGIC_VECTOR (3 downto 0);
CA : out STD_LOGIC;
CB : out STD_LOGIC;
CC : out STD_LOGIC;
CD : out STD_LOGIC;
CE : out STD_LOGIC;
CF : out STD_LOGIC;
CG : out std_logic);
            
end afis;
architecture Behavioral of afis is
signal sel : STD_LOGIC_VECTOR (2 downto 0);
signal dig : STD_LOGIC_VECTOR (3 downto 0);
begin
 
 process (clk)
     variable N : integer;
     variable  selN: integer range 0 to 3 ;
     variable  ce100khz: std_logic ;
     
    begin  
        if rising_edge (clk) then
            if N = 1000 then  
                N := 0;
                ce100khz := '1';
             else
                N := N + 1;
                ce100khz := '0';
             end if;
        end if;
        
         if rising_edge (clk) then
                   if (ce100kHz = '1') then 
                       if selN = 3 then
                           selN := 0;
                       else
                           selN := selN + 1;
                       end if;
                    end if;
                    sel <= std_logic_vector(to_unsigned(selN,sel'length));
                end if;                  
    end process; 
    
process (sel)
begin
case sel is
when "000" => An <="1110";
when "001" => An <="1101"; 
when "010" => An <="1011"; 
when "011" => An <="0111";
when others => dig <="1111";  
 end case;        
 
          case sel is                 
          when "000" => dig <=dd1; --dig0;                  
          when "001" => dig <=dd2; --dig1;                  
          when "010" => dig <= dd3;--dig2;                  
          when "011" => dig <=dd4; --dig3;   
          when others=> dig <="0000";                          
          end case;     
          end process;  
          
             process (dig)
             begin
             case dig is
             when "0000" => 
             CA <= '0';
             CB <= '0';
             CC <= '0';
             CD <= '0';
             CE <= '0';              
             CF <= '0';              
             CG <= '1';              
             when "0001" =>               
             CA <= '1';              
             CB <= '0';              
             CC <= '0';              
             CD <= '1';              
             CE <= '1';              
             CF <= '1';              
             CG <= '1';              
             when "0010" =>               
             CA <= '0';              
             CB <= '0';              
             CC <= '1';              
             CD <= '0';              
             CE <= '0';              
             CF <= '1';              
             CG <= '0';              
             when "0011" =>               
             CA <= '0';              
             CB <= '0';              
             CC <= '0';              
             CD <= '0';              
             CE <= '1';
             CF <= '1';
             CG <= '0';
         when "0100" =>            
         CA <= '1';
         CB <= '0';
         CC <= '0';
         CD <= '1';
         CE <= '1';
         CF <= '0';
         CG <= '0';
         when "0101" => 
         CA <= '0';
         CB <= '1';
         CC <= '0';
         CD <= '0';    
         CE <= '1';    
         CF <= '0';    
         CG <= '0';    
         when "0110" =>     
         CA <= '0';    
         CB <= '1';    
         CC <= '0';    
         CD <= '0';    
         CE <= '0';    
         CF <= '0';    
         CG <= '0';    
         when "0111" =>     
         CA <= '0';    
         CB <= '0';    
         CC <= '0';    
         CD <= '1';    
         CE <= '1';    
         CF <= '1';    
         CG <= '1';    
         when "1000" =>     
         CA <= '0';    
         CB <= '0';    
         CC <= '0';    
         CD <= '0';    
         CE <= '0';    
         CF <= '0';    
         CG <= '0';    
         when "1001" =>     
         CA <= '0';    
         CB <= '0';    
         CC <= '0';    
         CD <= '0';
         CE <= '1';
         CF <= '0';
         CG <= '0';
            when others =>     
               CA <= '1';    
               CB <= '1';    
               CC <= '1';    
               CD <= '0';
               CE <= '1';
               CF <= '1';
               CG <= '1';
         end case;
         end process;  
 
         end architecture;