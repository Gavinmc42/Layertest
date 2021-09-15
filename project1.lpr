program project1;

{$mode delphi}{$H+}

uses
  RaspberryPi, GlobalConfig,GlobalConst, GlobalTypes, Platform, Threads, SysUtils,
  Classes, Ultibo, RemoteShell, ShellUpdate, VGlayers, VC4, console, dispmanx;

var
  i, w, h : integer;
  wh : TWindowHandle;

begin
  wh := ConsoleWindowCreate(ConsoleDeviceGetDefault,CONSOLE_POSITION_FULL,True);

  // init layers
  // we deliberately do this in an odd order to check that the code
  // is working properly.
  vgshapessetlayer(0);
  vgshapesinit(w, h);

  vgshapessetlayer(2);
  vgshapesinit(w, h, DISPMANX_FLAGS_ALPHA_FROM_SOURCE);

  vgshapessetlayer(1);
  vgshapesinit(w, h, DISPMANX_FLAGS_ALPHA_FROM_SOURCE);

  // draw something

  // this is the black rectangle. This layer is opaque.
  vgshapessetlayer(0);
  vgshapesstart(w, h, false);
  vgshapesrect(100, 20, 200, 200);
  vgshapesend;

  // layer 2 is the uppermost, yellow rectangle
  vgshapessetlayer(2);
  vgshapesstart(w, h, true);
  vgshapesfill(255,255,0,1);
  vgshapesrect(200, 40, 200, 200);
  vgshapesend;

  // layer 1 is the middle, red rectangle.
  vgshapessetlayer(1);

  for i := 20 to 600 do
  begin
    vgshapesstart(w, h, true);
    vgshapesfill(255,0,0,1);
    vgshapesrect(i, 0, 100, 100);
    vgshapesend;
  end;

{ commented out so you can see the result
  at the end of execution.

  vgshapessetlayer(0);
  vgshapesfinish(0);
  vgshapessetlayer(1);
  vgshapesfinish(1);
  vgshapessetlayer(2);
  vgshapesfinish(2);
  }
end.
