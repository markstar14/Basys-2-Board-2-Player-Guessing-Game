`timescale 1ns / 1ps

module numberGame(p11, l3, k3, b4, m5, m11, e2, p7, p4, p6, g3, n5, f3, n4, n3, g1, btn, a,b, c, d, e, f, g, dp, display, clk);

	input p11, l3, k3, b4, g3, f3, n3, e2, clk;
	input [3:0] btn;
	output m5, m11, p7, p6, n5, n4, g1, p4, a, b, c, d, e, f, g, dp;
	output [3:0]display;
	reg  m5, m11, p7, p6, n5, n4, g1, p4, win;
	reg a, b, c, d, e, f, g,   slow_clock, check;
	reg [4:0] number, number1, number2, number3, number4, lastnumber;
	reg [31:0] player1num, player2num; 
	integer  ledcount, count, attempts = 0;
	integer change;
	reg [1:0] switched = 'b00;
	
	
	reg[3:0] display ;
	
	
	
	assign dp=1;
	
	
	
	
	always @ (posedge clk)
		create_slow_clock(clk, slow_clock);
		
	always @ (posedge f3)
		begin
			change <= 1;
		end	
		
	always @ (posedge slow_clock)	
	begin
	
	if(win == 0)
		begin
		
	m5=p11;
	m11=l3;
	p7=k3;
	p6=b4;
	n5=g3;
	n4=f3;
	g1=n3;
	p4=e2;	
		
				end 
					
					else
						begin
						ledcount=ledcount + 1;
						if(ledcount == 114)
							begin
								m5=~m5;
								m11=~m11;
								p7=~p7;
								p6=~p6;
								n5=~n5;
								n4=~n4;
								g1=~g1;
								p4=~p4;
								ledcount=0;
							end
						end
	
	if ((~f3) & (win == 1))
		begin
			number1 = 0;
			number2 = 0;
			number3 = 0;
			number4 = 0;
			win = 0;
			switched = 0;
			attempts = 0;
		end
		
		if((number1 | number2 | number3 | number4) == 0)
			begin
			
				
						number1=2;
						number2=0;
						number3=18;
						number4=17;
						
				
					win=0;
			end
		if(f3 & (switched == 0))
			begin
			switched = 'b01;
			end
			
		if ((change == 1) & (switched == 'd1))
			begin
				switched = 'b10;
				number1 = 3;
				number2 = 0;
				number3 = 18;
				number4 = 17;
			end

			number[0]=p11;
			number[1]=l3;
			number[2]=k3;
			number[3]=b4;
			number[4]=0;
			
			
			if( btn > 0)
					begin
			
					if(f3)
						begin
							number1=number1 - 'b1;
							number2=number2 - 'b1;
							number3=number3 - 'b1;
							number4=number4 - 'b1;
							//player2num[0]=0;
							player2num[0]=number1[0];
							player2num[1]=number1[1];
							player2num[2]=number1[2];
							player2num[3]=number1[3];
							player2num[4]=number2[0];
							player2num[5]=number2[1];
							player2num[6]=number2[2];
							player2num[7]=number2[3];
							player2num[8]=number3[0];
							player2num[9]=number3[1];
							player2num[10]=number3[2];
							player2num[11]=number3[3];
							player2num[12]=number4[0];
							player2num[13]=number4[1];
							player2num[14]=number4[2];
							player2num[15]=number4[3];
						
							number1=number1 + 'b1;
							number2=number2 + 'b1;
							number3=number3 + 'b1;
							number4=number4 + 'b1;
							
							
						end
					
					else
						begin
						
							number1=number1 - 'b1;
							number2=number2 - 'b1;
							number3=number3 - 'b1;
							number4=number4 - 'b1;
							//player1num[0]=0;
							player1num[0]=number1[0];
							player1num[1]=number1[1];
							player1num[2]=number1[2];
							player1num[3]=number1[3];
							player1num[4]=number2[0];
							player1num[5]=number2[1];
							player1num[6]=number2[2];
							player1num[7]=number2[3];
							player1num[8]=number3[0];
							player1num[9]=number3[1];
							player1num[10]=number3[2];
							player1num[11]=number3[3];
							player1num[12]=number4[0];
							player1num[13]=number4[1];
							player1num[14]=number4[2];
							player1num[15]=number4[3];
						
							
							number1=number1 + 'b1;
							number2=number2 + 'b1;
							number3=number3 + 'b1;
							number4=number4 + 'b1;
							
						end
					
					number=number + 'b1;
			
			
			
				
					case (btn)
						1:	begin
								number1=number;
							end
						2:	begin
								number2=number;
							end
						4:	begin
								number3=number;
							end
						default: 	number4=number;
						
					endcase
		
					
					end
		
					
		if(g3)
			check = 1;
					
		
		if((check == 1) & (~g3))
			begin
			attempts = attempts + 1;
			check=0;
			
					
			if (player1num == player2num)	
				begin
					number1[0]=attempts[0];
					number1[1]=attempts[1];
					number1[2]=attempts[2];
					number1[3]=attempts[3];
					number1[4]=0;
					number2[0]=attempts[4];
					number2[1]=attempts[5];
					number2[2]=attempts[6];
					number2[3]=attempts[7];
					number2[4]=0;
					number3[0]=attempts[8];
					number3[1]=attempts[9];
					number3[2]=attempts[10];
					number3[3]=attempts[11];
					number3[4]=0;
					number4[0]=attempts[12];
					number4[1]=attempts[13];
					number4[2]=attempts[14];
					number4[3]=attempts[15];
					number4[4]=0;
					
					number1 = number1 + 1;
					number2 = number2 + 1;
					number3 = number3 + 1;
					number4 = number4 + 1;
					
					win=1;
					m5=0;
					m11=0;
					p7=0;
					p6=0;
					n5=0;
					n4=0;
					g1=0;
					p4=0;
				end
				
			if (player1num < player2num)
				begin
					number4=3;
					number3=0;
					number2=19;
					number1=2;
				end
				
			if (player1num > player2num)
				begin
					number4=3;
					number3=0;
					number2=18;
					number1=1;
				end
			end


					
					
					count=count + 1;
					case (count)
					
					'd1: begin
						number=number2;
						lastnumber=number2;
						display=13;
					end
					
					'd2: begin
						number=number3;
						lastnumber=number3;
						display=11;
					end
					
					'd3: begin
						number=number4;
						lastnumber=number4;
						display=7;
					end
					
					'd4: begin
						number=number1;
						lastnumber=number1;
						display=14;
						count=0;
					end
					
					default:
						begin
						count=count + 0;
						number=lastnumber;
						end
						
						
						endcase
					
							case (number)
							
							0: begin //blank 
								 a=1;  b=1;  c=1;  d=1;  e=1;  f=1;  g=1;
							end
							1: begin //0
								 a=0;  b=0;  c=0;  d=0;  e=0;  f=0;  g=1; 
							end
							2: begin //1
								 a=1;  b=0;  c=0;  d=1;  e=1;  f=1;  g=1; 
							end	
							3: begin //2
								 a=0;  b=0;  c=1;  d=0;  e=0;  f=1;  g=0; 
							end
							4: begin //3
								 a=0;  b=0;  c=0;  d=0;  e=1;  f=1;  g=0; 
							end
							5: begin //4
								 a=1;  b=0;  c=0;  d=1;  e=1;  f=0;  g=0; 
							end
							6: begin //5
								 a=0;  b=1;  c=0;  d=0;  e=1;  f=0;  g=0; 
							end
							7: begin //6
								 a=0;  b=1;  c=0;  d=0;  e=0;  f=0;  g=0; 
							end
							8: begin //7
								 a=0;  b=0;  c=0;  d=1;  e=1;  f=1;  g=1; 
							end
							9: begin //8
								 a=0;  b=0;  c=0;  d=0;  e=0;  f=0;  g=0; 
							end
							10: begin //9
								 a=0;  b=0;  c=0;  d=1;  e=1;  f=0;  g=0; 
							end
							11: begin //a
								 a=0;  b=0;  c=0;  d=1;  e=0;  f=0;  g=0; 
							end
							12: begin //b
								 a=1;  b=1;  c=0;  d=0;  e=0;  f=0;  g=0; 
							end
							13: begin //c
								 a=0;  b=1;  c=1;  d=0;  e=0;  f=0;  g=1; 
							end
							14: begin //d
								 a=1;  b=0;  c=0;  d=0;  e=0;  f=1;  g=0; 
							end
							15: begin //e
								 a=0;  b=1;  c=1;  d=0;  e=0;  f=0;  g=0; 
							end
							16: begin //f
								 a=0;  b=1;  c=1;  d=1;  e=0;  f=0;  g=0; 
							end
							17: begin //P
								 a=0;  b=0;  c=1;  d=1;  e=0;  f=0;  g=0;
							end
							18: begin //L
								 a=1;  b=1;  c=1;  d=0;  e=0;  f=0;  g=1;
							end
							19: begin //H
								 a=1;  b=0;  c=0;  d=1;  e=0;  f=0;  g=0;
							end
							default: begin // undefined -
								 a=1;  b=1;  c=1;  d=1;  e=1;  f=1;  g=0;
							end
							
						endcase
								
	end	

task create_slow_clock;
	 input clk;
	 inout sclk;
	 integer count;
	 begin
		 if (count > 140000)
			 begin
				count=0;
				sclk = ~sclk;
			 end
		 count = count+1;
	 end

 endtask 

endmodule