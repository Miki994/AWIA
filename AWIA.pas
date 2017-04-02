unit AWIA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.MPlayer, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    Image1: TImage;
    TrackBar2: TTrackBar;
    Label3: TLabel;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure TrackBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
if OpenDialog1.Execute then
begin

Timer1.Enabled:=False;
 MediaPlayer1.FileName:=OpenDialog1.FileName;
 MediaPlayer1.Open;
 MediaPlayer1.Display:=Panel2;
 MediaPlayer1.DisplayRect:=Panel2.ClientRect;
 TrackBar1.Max:=MediaPlayer1.TrackLength[1];
 Timer1.Enabled:=True;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Label1.Parent:=TrackBar1;
Label1.Left:=Round(TrackBar1.Width/2);
Label1.Top:=0;
end;

procedure TForm1.Panel2Resize(Sender: TObject);
begin
MediaPlayer1.DisplayRect:=Panel2.ClientRect;
Label1.Left:=Round(TrackBar1.Width/2);
Label1.Top:=0;
end;

procedure TForm1.Panel1Resize(Sender: TObject);
begin
MediaPlayer1.DisplayRect:=Panel1.ClientRect;
Label1.Left:=Round(TrackBar1.Width/2);
Label1.Top:=0;
end;

procedure TForm1.TrackBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
MediaPlayer1.Position:=TrackBar1.Position;
MediaPlayer1.Play;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
 begin
TrackBar1.Position:=MediaPlayer1.Position;
Label1.Caption:=FormatFloat('0#.##',(TrackBar1.Position/Trackbar1.Max)*100)+' %';
if MediaPlayer1.Position=TrackBar1.Max then MediaPlayer1.Stop;
end;

end.
