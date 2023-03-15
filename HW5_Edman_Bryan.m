initVel = input("Provide a number for velocity. . . ");
angl = input("Provide an angle. . . ");
rad = pi * angl / 180;
vx = initVel * cos(rad);
vy = initVel * sin(rad);

%makes a 20 x 20 square from -10 to 10
set(gca, 'XLim',[-10 10], 'YLim', [-10 10]); 
cla %clear out screen
axis square
grid on
ball = animatedline('color' , 'r', 'Marker', 'o' , 'MarkerSize',5,'MarkerFaceColor','r'); % make a ball

%limits for x and y
xl = -10;
xr = 10;
yb = xl;
yt = xr;
%initial position for the ball
x = 0;
y = 0;
while 1 == 1 %never ending loop, user must do control c to stop
    %hit left wall
    if x < xl
        vx = -vx;
    end
    %hit right wall
    if x > xr
        vx = -vx;
    end
    %hit bottom
    if y < yb
        vy = -vy;
    end
    %hit top
    if y > yt
        vy = -vy;
    end
    %reset ball position
    x = x + vx;
    y = y + vy;
    %clear old ball
    clearpoints(ball);
    %make new ball
    addpoints(ball,x,y);
    %draw to screen
    drawnow;
    %I changed this to 0.01 to run smoother on my machine
    pause(.01)
end