H = [10.65;10.15;9.55;9.05;8.45;7.85;7.15;6.55;5.75;4.95;3.95;2.65];
Xcp = [8.256;8.106;8.041;7.818;7.671;7.466;7.328;6.937;6.712;6.270;5.826;5.258];
Ycp = [22.241;22.446;23.050;23.100;23.553;23.880;24.673;24.5;25.433;25.739;26.947;29.935];
XcpT = [];
YcpT = [];
for i=1:12
  YcpT(i,1) = 25-H(i,1)/3;
endfor
  YcpT
  Ycp
 hold on;
 
 subplot(1,2,1)
 plot(H,Xcp,"color","R","o","markersize",2.5);
 plot(H,Xcp,"linewidth",1,"color","R");
 title("Xcp - H","fontsize", 15);
 grid on;
 xlabel('H (cm)'), ylabel('Xcp (cm)');
 
 subplot(1,2,2)
 plot(H,Ycp,"color","B","o","markersize",2.5);
 plot(H,Ycp,"linewidth",1,"color","B");
 title("Ycp - H","fontsize", 15);
 grid on;
 xlabel('H (cm)'), ylabel('Ycp (cm)');
 