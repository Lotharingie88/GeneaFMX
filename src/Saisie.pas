unit Saisie;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Memo.Types, FMX.ListBox, FMX.Edit,
  FMX.ScrollBox, FMX.Memo,UdbGenea, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TFSaisie = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btRec: TButton;
    btQuit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Memo1: TMemo;
    Label21: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    cbDNaiss: TComboBox;
    cbPNaiss: TComboBox;
    cbDDec: TComboBox;
    cbPDec: TComboBox;
    Edit18: TEdit;
    Label23: TLabel;
    Panel1: TPanel;
    Label24: TLabel;
    procedure btQuitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FSaisie: TFSaisie;

implementation

{$R *.fmx}
 var
    datmaj:string;
procedure TFSaisie.btQuitClick(Sender: TObject);
begin
  Fsaisie.hide;
end;

procedure TFSaisie.FormActivate(Sender: TObject);
begin
    Datmaj := DateToStr(Date);
    datamodule1.fdQuerPays.close;
     datamodule1.fdQuerPays.open;
     CbPNaiss.Items.Clear();
     CbPNaiss.Items.Add('');
     CbPNaiss.ItemIndex := 0;
     CbPdec.Items.Clear();
     CbPdec.Items.Add('');
     CbPdec.ItemIndex := 0;
  	while not datamodule1.fdQuerPays.Eof do
       begin
           CbPNaiss.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
           CbPNaiss.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;
           CbPdec.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
           CbPdec.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;
           //CbPNaiss.AddItem(datamodule1.fdQuerPays.FieldByName('nom').AsString,TObject(datamodule1.fdQuerPays.FieldByName('idnation').AsInteger));
           //CbPdec.AddItem(datamodule1.fdQuerPays.FieldByName('nom').AsString,TObject(datamodule1.fdQuerPays.FieldByName('idnation').AsInteger));
           datamodule1.fdQuerPays.Next;
       end;
         //CbPNaiss.Selected.Text :='';
//         CbPdec.Selected.Text :='';
//
       datamodule1.fdQuerDept.close;
       datamodule1.fdQuerDept.open;
       CbDNaiss.Items.Clear();
       CbDNaiss.Items.Add('');
       CbDNaiss.ItemIndex := 0;
       CbDDec.Items.Clear();
       CbDDec.Items.Add('');
       CbDDec.ItemIndex := 0;
     while not datamodule1.fdQuerDept.Eof do
       begin
           CbDNaiss.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
           CbDNaiss.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
//           CbDdec.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
//           CbDdec.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
////           CbDeptNaiss.AddItem(OutRequet.FieldByName('dept').AsString,TObject(OutRequet.FieldByName('iddept').AsInteger));
////           CbDeptDec.AddItem(OutRequet.FieldByName('dept').AsString,TObject(OutRequet.FieldByName('iddept').AsInteger));
          datamodule1.fdQuerDept.Next;
       end;
//         CbDNaiss.Selected.Text:='';
//         CbDDec.Selected.Text:='';

end;

end.
