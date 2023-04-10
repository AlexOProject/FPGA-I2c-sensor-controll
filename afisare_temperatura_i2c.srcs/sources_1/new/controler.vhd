LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controler IS
GENERIC (
    sys_clk_freq : INTEGER := 100_000_000;
    temp_sensor_addr2 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1011000"; -- I2C address of the SGP30 sensor
    temp_sensor_addr : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0111000" -- I2C address of the AHT10 sensor
);
PORT (
    clk : IN STD_LOGIC;
    reset_n : IN STD_LOGIC;
    i2c_ack_err : IN STD_LOGIC := '0';
    temperature2 : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    i2c_ena : OUT STD_LOGIC := '0';
    i2c_addr : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    i2c_rw : OUT STD_LOGIC := '0';
    i2c_data_wr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111101";
    i2c_data_rd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    i2c_busy : IN STD_LOGIC
);       
END controler;

 ARCHITECTURE behavior OF controler IS
    TYPE machine IS(start, trigger,trigger2, pause2022, read_command, read_command2,read_data2, output_result2,  pause2sec,pause202, read_data, output_result); 
    SIGNAL state       : machine;                                    
    SIGNAL busy_prev   : STD_LOGIC;                    
    SIGNAL temp_data   : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL humidity_data   : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL m1  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL m2  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL m3  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL m4  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL m5  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL m6  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL trigger1 : INTEGER := 0;
    SIGNAL ok : STD_LOGIC := '1';
    SIGNAL input_clk : INTEGER := 100_000;
    SIGNAL bus_clk : INTEGER := sys_clk_freq;

BEGIN

   PROCESS(clk, reset_n)
      VARIABLE busy_cnt : INTEGER RANGE 0 TO 6 := 0;       
      VARIABLE counter  : INTEGER RANGE 0 TO sys_clk_freq*20 := 0;
      VARIABLE counter2  : INTEGER RANGE 0 TO sys_clk_freq*20 := 0;
   BEGIN                       
   IF(reset_n = '1') THEN              
      counter := 0;                       
      i2c_ena <= '0';                     
      busy_cnt := 0;                     
      trigger1 <=0;
      state <= start;                    
    ELSIF(clk'EVENT AND clk = '1') THEN  
      CASE state IS                      


        WHEN start =>

           IF(ok='1') then
              state<=trigger;
           ELSE
              state<= trigger2;
           END IF;
    -------------------------------------------------------------------      
        WHEN  trigger2  =>
            ok <= not ok;        
            counter:=0;
      
            IF(busy_prev = '1' AND i2c_busy = '0') THEN                                          
              busy_cnt := busy_cnt + 1;                                    
            END IF;
            busy_prev <= i2c_busy;                      
            CASE busy_cnt IS                          
              WHEN 0 =>                                 
                i2c_ena <= '1';                         
                i2c_addr <= temp_sensor_addr2;              
                i2c_rw <= '0';                             	
                i2c_data_wr <="00100000";                         
        
              WHEN 1 =>                                   

                IF(i2c_busy = '0') THEN  
                  i2c_data_wr<="01010000";
                END IF;
 
              WHEN 2 =>
                IF(i2c_busy = '0') THEN                     
                   i2c_ena <= '0';  
                   busy_cnt := 0;                                                
                   state <= pause2022;                  
                         
                END IF; 
                                                                                                                      
              WHEN OTHERS => NULL;														
            END CASE;
 
-------------------------------------------------------------------
                                                                                    
          WHEN trigger =>  
            ok <= not ok;        
            counter:=0;
            IF(busy_prev = '1' AND i2c_busy = '0') THEN                                          
              busy_cnt := busy_cnt + 1;                                    
            END IF;
            busy_prev <= i2c_busy;                      
            CASE busy_cnt IS                          
              WHEN 0 =>                                 
               i2c_ena <= '1';                         
               i2c_addr <= temp_sensor_addr;              
               i2c_rw <= '0';                             	
               i2c_data_wr <="10101100";                         
        
              WHEN 1 =>                                   

                IF(i2c_busy = '0') THEN                     
                  i2c_ena <= '0';  
                  busy_cnt := 0;                                     
                  state <= pause202;                        
                END IF; 
                                                                                                                      
              WHEN OTHERS => NULL;														
              END CASE;
                                                                                                                            
        ---------------------------------------------------------------------------                                                                          
      
          
            
          WHEN pause2sec =>
            IF(counter < sys_clk_freq*2) THEN  
              counter := counter + 1;                
            ELSE                                  
              counter := 0;                            
              i2c_ena <= '0';                    
              busy_cnt := 0;                      
              trigger1 <=0;
              state <= start;
            END IF;
            
            
	---------------------------------------------------------------------------------------------------		 
			
          
          
          WHEN pause202 =>
            IF(counter < 10000) THEN  
              counter := counter + 1;                 
            ELSE                                    
              counter := 0;                          
              i2c_ena<='1';
              state <= read_command;                      
            END IF;
 -------------------------------------------------------------------------------------         
          WHEN pause2022 =>
            IF(counter < 3000000) THEN  
              counter := counter + 1;                 
            ELSE                                    
              counter := 0;                          
              i2c_ena<='1';
              state <= read_command2;                      
            END IF;
          
   -------------------------------------------------------------------------------------------       
          
 	 
		  WHEN read_command =>
			  i2c_ena<='1';
			  IF(busy_prev = '1' AND i2c_busy = '0') THEN   
                busy_cnt := busy_cnt + 1;                                    
              END IF;
              busy_prev <= i2c_busy;                    
              CASE busy_cnt IS                           
                WHEN 0 =>                                 
                  i2c_ena <= '1';                            
                  i2c_addr <= temp_sensor_addr;                
                  i2c_rw <= '1';                                                 
                WHEN 1 =>                                  
                  IF(i2c_busy='0') THEN
                    i2c_ena <= '1';                             
                    busy_cnt := 0;                              
                    state<= read_data;
                  END IF;
                WHEN OTHERS=> NULL;
              END CASE;  
----------------------------------------------------------------------------------------------        
        
          WHEN read_command2 =>
			i2c_ena<='1';
			IF(busy_prev = '1' AND i2c_busy = '0') THEN   
              busy_cnt := busy_cnt + 1;                                    
            END IF;
            busy_prev <= i2c_busy;                    
            CASE busy_cnt IS                           
              WHEN 0 =>                                 
                i2c_ena <= '1';                            
                i2c_addr <= temp_sensor_addr2;                
                i2c_rw <= '1';                             
                                  
              WHEN 1 =>                                  
                IF(i2c_busy='0') then
                  i2c_ena <= '1';                             
                  busy_cnt := 0;                              
                  state<= read_data2;
                END IF;
              WHEN OTHERS=>NULL;
            END CASE;  
			
	-------------------------------------------------------------------------------------------		 
       
          WHEN read_data =>
            busy_prev <= i2c_busy;                                                              
            IF(busy_prev = '1' AND i2c_busy = '0') THEN 
              busy_cnt := busy_cnt + 1;                   
            END IF;
            CASE busy_cnt IS                          
              WHEN 0 =>                                   
                i2c_ena <= '1';                             
                i2c_addr <= temp_sensor_addr;              
                i2c_rw <= '1';                             
              WHEN 1 =>                                                               
                IF(i2c_busy = '0') THEN 
                  humidity_data(19 downto 12) <=i2c_data_rd;
                END IF;
    
              WHEN 2 =>
                IF(i2c_busy = '0') THEN 
                  humidity_data(11 downto 4) <=i2c_data_rd;
               END IF;                       

              WHEN 3 =>                                  
                IF(i2c_busy = '0') THEN                     
                  humidity_data(3 downto 0) <=i2c_data_rd(7 downto 4);
                  temp_data(19 DOWNTO 16) <= i2c_data_rd(3 downto 0);       
                END IF;
              WHEN 4 =>
                i2c_ena<='0';
                IF(i2c_busy = '0') THEN                     
                temp_data(15 downto 8) <= i2c_data_rd;
                END IF;
              WHEN 5 => 
                 i2c_ena <= '0';                                                         
                 IF(i2c_busy = '0') THEN                     
                   temp_data(7 DOWNTO 0) <= i2c_data_rd;       
                   busy_cnt := 0;                              
                   state <= output_result;                      
                 END IF;
              WHEN OTHERS => NULL;
            END CASE;





----------------------------------------------------------------------

     WHEN read_data2 =>
       busy_prev <= i2c_busy;                                                              
       IF(busy_prev = '1' AND i2c_busy = '0') THEN 
          busy_cnt := busy_cnt + 1;                   
        END IF;
        CASE busy_cnt IS                          
          WHEN 0 =>                                   
            i2c_ena <= '1';                             
            i2c_addr <= temp_sensor_addr2;              
            i2c_rw <= '1';                             
          WHEN 1 =>                                  
            IF(i2c_busy = '0') THEN 
              m1 <=i2c_data_rd;
            END IF;
          WHEN 2 =>
            IF(i2c_busy = '0') THEN 
              m2 <=i2c_data_rd;
            END IF;                       
          WHEN 3 =>                                  
            IF(i2c_busy = '0') THEN 
              m3 <=i2c_data_rd;
            END IF;                       
          WHEN 4 =>             
            i2c_ena <= '0';                                                         
              IF(i2c_busy = '0') THEN                     
                 m4 <=i2c_data_rd;
                 busy_cnt := 0;                              
                 state <= output_result2;                      
              END IF;
          WHEN OTHERS => NULL;
        END CASE;


 -------------------------------------------------------------------------------------      
     WHEN output_result =>
       temperature2<=temp_data;
       state <= pause2sec;     

        -------------------------------------------------------------------  
     WHEN output_result2 =>
       temperature2<=m1&m2&m3(3 downto 0);
       state <= pause2sec;                           
-----------------------------------------------------------------------------
        
     WHEN OTHERS =>
       state <= start;
    END CASE;  
   
  END IF;
END PROCESS;  
END behavior;