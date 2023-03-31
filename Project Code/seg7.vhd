LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY seg7 IS
	PORT ( 
	A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
	s   : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	led1: OUT STD_LOGIC_VECTOR(1 TO 7);
	led2: OUT STD_LOGIC_VECTOR(1 TO 7)); --NOTICE ORDER

END seg7;

ARCHITECTURE Behavior OF seg7 IS
	SIGNAL Sum : STD_LOGIC_VECTOR(4 DOWNTO 0);
   SIGNAL tmp : STD_LOGIC_VECTOR (1 TO 14);
	COMPONENT FourBitAdder
	PORT(
		Cin  : In STD_LOGIC;
		X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		SUM  : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
	END COMPONENT;
BEGIN 
	STAGE_FA : FourBitAdder PORT MAP('0',A,B,Sum);	
	PROCESS(A,B)
	BEGIN
	CASE Sum IS                 --abcdefgabcdefg
			WHEN "00000" => tmp <= "00000010000001"; --00
			WHEN "00001" => tmp <= "00000011001111"; --01
			WHEN "00010" => tmp <= "00000010010010"; --02
			WHEN "00011" => tmp <= "00000010000110"; --03
			WHEN "00100" => tmp <= "00000011001100"; --04
			WHEN "00101" => tmp <= "00000010100100"; --05
			WHEN "00110" => tmp <= "00000010100000"; --06
			WHEN "00111" => tmp <= "00000010001111"; --07
			WHEN "01000" => tmp <= "00000010000000"; --08
			WHEN "01001" => tmp <= "00000010000100"; --09
			WHEN "01010" => tmp <= "10011110000001"; --10
			WHEN "01011" => tmp <= "10011111001111"; --11
			WHEN "01100" => tmp <= "10011110010010"; --12
			WHEN "01101" => tmp <= "10011110000110"; --13
			WHEN "01110" => tmp <= "10011111001100"; --14
			WHEN "01111" => tmp <= "10011110100100"; --15
			WHEN "10000" => tmp <= "10011110100000"; --16
			WHEN "10001" => tmp <= "10011110001111"; --17
			WHEN "10010" => tmp <= "10011110000000"; --18
			WHEN "10011" => tmp <= "10011110000100"; --19
			WHEN "10100" => tmp <= "00100100000001"; --20
			WHEN "10101" => tmp <= "00100101001111"; --21
			WHEN "10110" => tmp <= "00100100010010"; --22
			WHEN "10111" => tmp <= "00100100000110"; --23
			WHEN "11000" => tmp <= "00100101001100"; --24
			WHEN "11001" => tmp <= "00100100100100"; --25
			WHEN "11010" => tmp <= "00100100100000"; --26
			WHEN "11011" => tmp <= "00100100001111"; --27
			WHEN "11100" => tmp <= "00100100000000"; --28
			WHEN "11101" => tmp <= "00100100000100"; --29
			WHEN "11110" => tmp <= "00001100000001"; --30
			WHEN OTHERS => tmp <= "--------------"; --XX
	END CASE;
			S   <= Sum;
        led2 <= tmp (1 TO 7); --The left most 7 bits are the tenth which is led 2 in our case
        led1 <= tmp (8 TO 14); --The Right most 7 bits are the unith which is led 1 in our case
	--NOTE : because we used 1 TO 14 so tmp is read as 12345....14 (left most bit is indix 1 and right most is indix 14)
        
	END PROCESS;
END Behavior;
