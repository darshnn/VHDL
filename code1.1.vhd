library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwmm is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           b : out STD_LOGIC );
end pwmm;


architecture Behavioral of pwmm is
signal s0,s1,s2,s3,s4,s5,s6,s7 : STD_LOGIC;
begin
process (a,clk)
variable con0 : integer range 0 to 102;
begin
 
 con0:= con0 + 1;
 
 if a(0) = '1' and (con0 >= 1) and (con0 <= 2) then
   s0 <= '1';
 else
   s0 <= '0';
 end if;
 
 if a(1) = '1' and (con0 >= 2) and (con0 <= 3) then
   s1 <= '1';
 else
   s1 <= '0';
 end if;   
 
 
 if a(2) = '1' and (con0 >= 4) and (con0 <= 7) then
   s2 <= '1';
 else
   s2 <= '0'; 
 end if;
 
 if a(3) = '1' and (con0 >= 8) and (con0 <= 15) then
   s3 <= '1';
 else 
   s3 <= '0';
 end if;
 
 if a(4) = '1' and (con0 >= 16) and (con0 <= 31) then
   s4 <= '1';
 else
   s4 <= '0';
 end if; 
 
 if a(5) = '1' and (con0 >= 32) and (con0 <= 63) then
   s5 <= '1';
 else 
   s5 <= '0';
 end if;      
 
 if a(6) = '1' and a(5) = '0' and (con0 >= 32) and (con0 <= 96) then
   s6 <= '1';
 elsif a(6) = '1' and a(5) = '1' and (con0 <= 97) then
    s6 <= '1';
      if a(2) = '1' and (con0 <= 101) then 
        s6 <= '1';
      elsif a(1) = '1' and a(0) = '1' and (con0 <= 100) then
        s6 <= '1';
      elsif a(1) = '1' and a(0) = '0' and  (con0 <= 99) then
        s6 <= '1';
      elsif a(1) = '0' and a(0) = '1' and  (con0 <= 98) then 
        s6 <= '1';
      end if; 
 end if;   
 
 
 if (con0 = 102) then
  con0 := 0;
 end if;
 


 b <= s0 OR s1 OR s2 OR s3 OR s4 OR s5 OR s6;

end process;
end Behavioral;
