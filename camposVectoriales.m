x = linspace(-1,1,10);
y = x;

[Mx,My]=meshgrid(x,y);

U = (Mx.^2).+(2*Mx).-(4*My);
V = -2*(Mx.*My).-(2*My)

quiver(Mx,My,U,V);
axis equal
xlabel('Eje X');
ylabel('Eje Y');