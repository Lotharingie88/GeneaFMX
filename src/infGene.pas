unit infGene;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.Edit,
  FMX.ScrollBox, FMX.Memo;

type
  TFinfGen = class(TForm)
    Layout1: TLayout;
    tbInf: TToolBar;
    btOk: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lbInd: TLabel;
    Label17: TLabel;
    lbEpo: TLabel;
    lbEpo2: TLabel;
    lbPer: TLabel;
    lbMer: TLabel;
    Memo1: TMemo;
    edNom: TEdit;
    edPren: TEdit;
    edPren2: TEdit;
    edPren3: TEdit;
    edNaiss: TEdit;
    edDec: TEdit;
    edMar: TEdit;
    edEpo: TEdit;
    edMar2: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    edLNaiss: TEdit;
    edLDec: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label16: TLabel;
    lbMaj: TLabel;
    btPrint: TButton;
    procedure btOkClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FinfGen: TFinfGen;

implementation

{$R *.fmx}

procedure TFinfGen.btOkClick(Sender: TObject);
begin
  finfgen.Hide;
end;

end.
