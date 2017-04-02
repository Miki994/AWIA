program AWIAPlayer;

uses
  Vcl.Forms,
  AWIA in 'AWIA.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('CopperDark');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
