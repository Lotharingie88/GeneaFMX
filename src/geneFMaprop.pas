unit geneFMaprop;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TFAprop = class(TForm)
    Layout1: TLayout;
    btAprop: TButton;
    memAprop: TMemo;
    procedure btApropClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FAprop: TFAprop;

implementation

{$R *.fmx}

procedure TFAprop.btApropClick(Sender: TObject);
begin
  close;
end;

end.
