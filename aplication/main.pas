unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, MMSystem, ShellAPI, Winapi.Windows;

type
  Tfrmmain = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Timer1: TTimer;
    getCPU: TRoundRect;
    lblcpuspeed: TLabel;
    RoundRect2: TRoundRect;
    Memory: TLabel;
    getMemory: TRoundRect;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    nosound: TRoundRect;
    Label5: TLabel;
    Image2: TImage;
    procedure getCPUClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
    procedure getMemoryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nosoundClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.fmx}

uses Umsg;
// DLL DO RDTSC
function GetCPUSpeed: string; stdcall;
  external 'RDTSC_Calculator.dll' name 'GetCPUSpeed';
// FIM DO DLL

function about: string; stdcall; external 'RDTSC_Calculator.dll' name 'about';
// FIM DO DLL

function GetMemoryUsed: UInt64; stdcall; external 'RDTSC_Calculator.dll' name 'GetMemoryUsed';
// FIM DO DLL


procedure musica;
begin
   SndPlaySound('.\bg\bg.wav', SND_ASYNC + SND_LOOP);      //musica
end;

procedure Tfrmmain.FormShow(Sender: TObject);
begin
  musica;
end;

procedure Tfrmmain.getCPUClick(Sender: TObject);
begin
  if (Timer1.Enabled) then
  begin
    Timer1.Enabled := false;
    frmmsg.msg1.Text := 'The processor hook stopped';
    frmmsg.msg2.Text := 'OK.';
    frmmsg.Show;
  end
  else
  begin
    Timer1.Enabled := True;
    frmmsg.msg1.Text := 'The processor hook started';
    frmmsg.msg2.Text := 'OK.';
    frmmsg.Show;
  end;
end;

procedure Tfrmmain.getMemoryClick(Sender: TObject);
begin
  Memory.Text := FloatToStr(GetMemoryUsed/10000) + 'GB';
  frmmsg.msg1.Text := 'The memory hook started';
  frmmsg.msg2.Text := 'OK.';
  frmmsg.Show;
end;

procedure Tfrmmain.Image2Click(Sender: TObject);
begin
ShellExecute(GetDesktopWindow, 'open', 'https://github.com/keowu/RDTSC_Calculator', '', '', 1);
end;

procedure Tfrmmain.nosoundClick(Sender: TObject);
begin
   sndPlaySound(nil, SND_ASYNC);
   frmmsg.msg1.Text := 'Sound stopped !';
   frmmsg.msg2.Text := 'OK.';
   frmmsg.Show;
end;

procedure Tfrmmain.RoundRect2Click(Sender: TObject);
begin
  about;
end;

procedure Tfrmmain.Timer1Timer(Sender: TObject);
begin
  lblcpuspeed.Text := GetCPUSpeed;
end;

end.
