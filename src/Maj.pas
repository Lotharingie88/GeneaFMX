unit Maj;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Memo.Types,
  FMX.Edit, FMX.ListBox, FMX.ScrollBox, FMX.Memo;

type
  TFMaj = class(TForm)
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
    edPren3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lbMaj: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Label23: TLabel;
    memMaj: TMemo;
    cbNom: TComboBox;
    cbDNaiss: TComboBox;
    cbPNaiss: TComboBox;
    cbDDec: TComboBox;
    cbPDec: TComboBox;
    edPren: TEdit;
    edPren2: TEdit;
    Edit3: TEdit;
    edNaiss: TEdit;
    edDec: TEdit;
    edLNaiss: TEdit;
    edLDec: TEdit;
    edMaria: TEdit;
    edNEpo: TEdit;
    edPEpo: TEdit;
    ed2Maria: TEdit;
    edN2Epo: TEdit;
    edP2Epo: TEdit;
    edNper: TEdit;
    edPPer: TEdit;
    edNMer: TEdit;
    edPMer: TEdit;
    edEnf: TEdit;
    Label18: TLabel;
    lbNMaj: TLabel;
    lbEpMaj: TLabel;
    LbEp2Maj: TLabel;
    lbPMaj: TLabel;
    lbMMaj: TLabel;
    procedure btQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbNomChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FMaj: TFMaj;
  i:integer;
  individu : string;
implementation

{$R *.fmx}
  var
    datmaj:string;
procedure TFMaj.btQuitClick(Sender: TObject);
begin
  fmaj.hide;
end;

procedure TFMaj.cbNomChange(Sender: TObject);
  var
  		i,idIndi,IndPers: Integer;
begin
  for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
//                 if (Components[i] is TComboBox and (TComboBox(Components[i]).Name <> 'CbNom')) then
//                     begin
//                       TComboBox(Components[i]).itemindex:=0;
//                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMMaj') or (TLabel(Components[i]).Name = 'lbPMaj') or (TLabel(Components[i]).Name =  'lbEpMaj') or (TLabel(Components[i]).Name =  'lbEp2Maj') )) then
                     begin
                       TLabel(Components[i]).Text:='';
                     end;
               end;
  Individu := CbNom.Text;
  IndPers := CbNom.ItemIndex;
  if cbnom.ItemIndex<>0 then
    begin
      datamodule1.fdQuerMaj.close;
      datamodule1.fdQuerMaj.SQL.Clear;
               datamodule1.fdQuerMaj.SQL.text := 'SELECT idperson,nom,prenom,if(datnaiss="0000-00-00", "NC",datnaiss) as Naissance,if(datdec="0000-00-00", "NC",datdec) as Deces,idper,'
                               +'idmer,if(datmaria="0000-00-00", "NC",datmaria) as Mariage,idepou,'
                               +'if(datmarbis="0000-00-00", "NC",datmarbis) as Mariage2,idepoubis,lieunaiss,lieudec,idnatnaiss,idnatdec,iddeptnaiss,iddeptdec,prenom2,prenom3,memo,datmaj'
                               +' FROM personnes where (nom||" "||prenom||" -"||idperson) = :indiv' ;
               datamodule1.fdQuerMaj.ParamByName('indiv').AsString := Individu;
     datamodule1.fdQuerMaj.open;

     if (datamodule1.fdQuerMaj.RecordCount =1) then
           	begin
                  lbNMaj.Text :=  datamodule1.fdQuerMaj.FieldByName('idperson').AsString;
                 	EdNaiss.Text :=  datamodule1.fdQuerMaj.FieldByName('Naissance').AsString;
                  EdDec.Text := datamodule1.fdQuerMaj.FieldByName('Deces').AsString;
                  EdMaria.Text := datamodule1.fdQuerMaj.FieldByName('Mariage').AsString;
                  Ed2Maria.Text :=  datamodule1.fdQuerMaj.FieldByName('Mariage2').AsString;
                 	  EdLDec.Text := datamodule1.fdQuerMaj.FieldByName('lieudec').AsString;
                 	  EdLNaiss.Text := datamodule1.fdQuerMaj.FieldByName('lieunaiss').AsString;
             end;
    end;
end;

procedure TFMaj.FormActivate(Sender: TObject);

begin
Datmaj := DateToStr(Date);
    for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
//                 if (Components[i] is TComboBox and (TComboBox(Components[i]).Name <> 'CbNom')) then
//                     begin
//                       TComboBox(Components[i]).itemindex:=0;
//                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMMaj') or (TLabel(Components[i]).Name = 'lbPMaj') or (TLabel(Components[i]).Name =  'lbEpMaj') or (TLabel(Components[i]).Name =  'lbEp2Maj')or (TLabel(Components[i]).Name =  'lbNMaj') )) then
                     begin
                       TLabel(Components[i]).Text:='';
                     end;
            end;
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
         CbPNaiss.ItemIndex :=0;
         CbPdec.ItemIndex :=0;
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
           CbDdec.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
           CbDdec.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
////           CbDeptNaiss.AddItem(OutRequet.FieldByName('dept').AsString,TObject(OutRequet.FieldByName('iddept').AsInteger));
////           CbDeptDec.AddItem(OutRequet.FieldByName('dept').AsString,TObject(OutRequet.FieldByName('iddept').AsInteger));
           datamodule1.fdQuerDept.Next;
      end;
         CbDNaiss.ItemIndex :=0;
         CbDDec.ItemIndex :=0;
    datamodule1.fdQuerNomPren.close;
     datamodule1.fdQuerNomPren.open;
     CbNom.Items.Clear();
     CbNom.Items.Add('');
     CbNom.ItemIndex := 0;

  	while not datamodule1.fdQuerNomPren.Eof do
       begin
           individu :=  datamodule1.fdQuerNomPren.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerNomPren.FieldByName('prenom').AsString + ' -' + datamodule1.fdQuerNomPren.FieldByName('idperson').AsString ;

           CbNom.Items.Add(individu);
           CbNom.ItemIndex := datamodule1.fdQuerNomPren.FieldByName('idperson').AsInteger;

           //CbPNaiss.AddItem(datamodule1.fdQuerPays.FieldByName('nom').AsString,TObject(datamodule1.fdQuerPays.FieldByName('idnation').AsInteger));
           //CbPdec.AddItem(datamodule1.fdQuerPays.FieldByName('nom').AsString,TObject(datamodule1.fdQuerPays.FieldByName('idnation').AsInteger));
           datamodule1.fdQuerNomPren.Next;
       end;
         CbNom.ItemIndex :=0;
end;

procedure TFMaj.FormCreate(Sender: TObject);
begin
  Datmaj := DateToStr(Date);

end;

end.
