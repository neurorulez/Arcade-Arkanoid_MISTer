--============================================================================
-- 
--  VHDL implementation of the 74LS374 octal D-flip flop
--  Copyright (C) 2018, 2019 Ace
--
--  Permission is hereby granted, free of charge, to any person obtaining a
--  copy of this software and associated documentation files (the "Software"),
--  to deal in the Software without restriction, including without limitation
--	 the rights to use, copy, modify, merge, publish, distribute, sublicense,
--	 and/or sell copies of the Software, and to permit persons to whom the 
--	 Software is furnished to do so, subject to the following conditions:
--
--  The above copyright notice and this permission notice shall be included in
--	 all copies or substantial portions of the Software.
--
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--	 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--	 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--	 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--	 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--	 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--	 DEALINGS IN THE SOFTWARE.
--
--============================================================================

--Chip pinout:
/*         _____________
         _|             |_
out_ctl |_|1          20|_| VCC
         _|             |_                     
q(0)    |_|2          19|_| q(7)
         _|             |_
d(0)    |_|3          18|_| d(7)
         _|             |_
d(1)    |_|4          17|_| d(6)
         _|             |_
q(1)    |_|5          16|_| q(6)
         _|             |_
q(2)    |_|6          15|_| q(5)
         _|             |_
d(2)    |_|7          14|_| d(5)
         _|             |_
d(3)    |_|8          13|_| d(4)
         _|             |_
q(3)    |_|9          12|_| q(4)
         _|             |_
GND     |_|10         11|_| clk
          |_____________|
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity ls374 is
port
(
	d			: in std_logic_vector(7 downto 0);
	clk		: in std_logic;
	out_ctl	: in std_logic;
	q			: out std_logic_vector(7 downto 0)
);
end ls374;

architecture arch of ls374 is
signal q_internal : std_logic_vector(7 downto 0);
begin	
	process(clk) begin
		if(clk'event and clk = '1') then
			q_internal <= d;
		end if;
	end process;
	q <= q_internal when not out_ctl
		else (others => 'Z');
end arch;