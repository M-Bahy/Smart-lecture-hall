LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity FourBitAdder IS
	PORT (
		Cin  : IN STD_LOGIC;
		X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		SUM  : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END FourBitAdder;

ARCHITECTURE Structure OF FourBitAdder IS
	SIGNAL C : STD_LOGIC_VECTOR(3 DOWNTO 1);
	SIGNAL T : STD_LOGIC_VECTOR(4 DOWNTO 0);
	COMPONENT FullAdd 
		PORT(Cin, X, Y : IN STD_LOGIC;
	     	S, Cout   : OUT STD_LOGIC);
	END COMPONENT;
BEGIN
	STAGE0: FullAdd PORT MAP(Cin, X(0), Y(0), T(0), C(1));
	STAGE1: FullAdd PORT MAP(C(1), X(1), Y(1), T(1), C(2));
	STAGE2: FullAdd PORT MAP(C(2), X(2), Y(2), T(2), C(3));
	STAGE3: FullAdd PORT MAP(C(3), X(3), Y(3), T(3), T(4));
	SUM <= T;
END Structure;

