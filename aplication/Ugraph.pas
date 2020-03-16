unit Ugraph;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  Tfrmgraph = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    trdtsc: TChart;
    Series1: TFastLineSeries;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgraph: Tfrmgraph;

implementation

{$R *.fmx}

end.
