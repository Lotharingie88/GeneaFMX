unit Consult;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Memo.Types,
  FMX.Edit,firedac.stan.Param, FMX.ListBox, FMX.ScrollBox, FMX.Memo;

type
  TFCons = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btQuit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbPren3: TLabel;
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
    edPren3: TEdit;
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
    lbInd: TLabel;
    lbEpo: TLabel;
    lbPer: TLabel;
    lbMer: TLabel;
    lbEpo2: TLabel;
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
  FCons: TFCons;
  i:integer;
  individu : string;
implementation

{$R *.fmx}
  var
    datmaj:string;
procedure TFCons.btQuitClick(Sender: TObject);
begin
  fcons.hide;
end;

procedure TFCons.cbNomChange(Sender: TObject);
  var
  		i,idIndi,IndPers: Integer;
      iInd,iPer,iMer,iEpo,iEpo2,iNdep,iDdep,iNpa,iDpa : string;
begin
  for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;

                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name =  'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2') )) then
                     begin
                       TLabel(Components[i]).Text:='0';
                     end;
               end;
  Individu := CbNom.Text;

  if cbnom.ItemIndex<>0 then
    begin
      datamodule1.fdQuerMaj.close;
      datamodule1.fdQuerMaj.SQL.Clear;
               datamodule1.fdQuerMaj.SQL.text := 'SELECT idperson,nom,prenom,if(datnaiss="0000-00-00", "NC",datnaiss) as Naissance,if(datdec="0000-00-00", "NC",datdec) as Deces,idper,'
                               +'idmer,if(datmaria="0000-00-00", "NC",datmaria) as Mariage,idepou,'
                               +'if(datmarbis="0000-00-00", "NC",datmarbis) as Mariage2,idepoubis,lieunaiss,lieudec,idnatnaiss,idnatdec,'
                               +'iddeptnaiss,iddeptdec,prenom2,prenom3,memo,datmaj'
                               +' FROM personnes as a  where (nom||" "||prenom||" -"||idperson) = :indiv' ;
               datamodule1.fdQuerMaj.ParamByName('indiv').AsString := Individu;
     datamodule1.fdQuerMaj.open;

     if (datamodule1.fdQuerMaj.RecordCount =1) then
           	begin
                  IndPers := datamodule1.fdQuerMaj.FieldByName('idperson').AsInteger;
                  lbInd.Text :=  datamodule1.fdQuerMaj.FieldByName('idperson').AsString;
                 	EdNaiss.Text :=  datamodule1.fdQuerMaj.FieldByName('Naissance').AsString;
                  EdDec.Text := datamodule1.fdQuerMaj.FieldByName('Deces').AsString;
                  EdMaria.Text := datamodule1.fdQuerMaj.FieldByName('Mariage').AsString;
                  Ed2Maria.Text :=  datamodule1.fdQuerMaj.FieldByName('Mariage2').AsString;
                  EdLDec.Text := datamodule1.fdQuerMaj.FieldByName('lieudec').AsString;
                  EdLNaiss.Text := datamodule1.fdQuerMaj.FieldByName('lieunaiss').AsString;
                  edPren.Text := datamodule1.fdQuerMaj.FieldByName('prenom').AsString;
                  edPren2.Text := datamodule1.fdQuerMaj.FieldByName('prenom2').AsString;
                  edPren3.Text := datamodule1.fdQuerMaj.FieldByName('prenom3').AsString;
                  iInd:=datamodule1.fdQuerMaj.FieldByName('idperson').AsString;
                  iPer:=datamodule1.fdQuerMaj.FieldByName('idper').AsString;
                  iMer:=datamodule1.fdQuerMaj.FieldByName('idmer').AsString;
                  iEpo:=datamodule1.fdQuerMaj.FieldByName('idepou').AsString;
                  iEpo2:=datamodule1.fdQuerMaj.FieldByName('idepoubis').AsString;
                  iNdep:=datamodule1.fdQuerMaj.FieldByName('iddeptnaiss').AsString;
                  iDdep:=datamodule1.fdQuerMaj.FieldByName('iddeptdec').AsString;
                  iNpa:=datamodule1.fdQuerMaj.FieldByName('idNatnaiss').AsString;
                  iDpa:=datamodule1.fdQuerMaj.FieldByName('idNatdec').AsString;
                  MemMaj.Text:=  datamodule1.fdQuerMaj.FieldByName('memo').AsString;
                  if (DateTimeToStr(datamodule1.fdQuerMaj.FieldByName('datmaj').AsDateTime)<>'31/12/1899') then
                  		lbMaj.Text:= 'Mise à jour le : ' +  DateTimeToStr(datamodule1.fdQuerMaj.FieldByName('datmaj').AsDateTime)
                  else
                  		lbMaj.Text:= 'Mise à jour le : 00/00/0000 ' ;
                    datamodule1.fdQuerMajPlus.Close;
                  	datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idperson,nom,prenom FROM personnes where idperson= :idmer';
                    datamodule1.fdQuerMajPlus.ParamByName('idmer').AsString := imer;
                    datamodule1.fdQuerMajPlus.Open;
                    if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                      begin
                 		    EdNMer.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                     		EdPmer.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                        lbMer.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;

                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idperson,nom,prenom FROM personnes where idperson= :idper';
                    datamodule1.fdQuerMajPlus.ParamByName('idper').AsString := iper;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                 		  edNPer.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                 		  edPPer.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                      lbPer.text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;
                   datamodule1.fdQuerMajPlus.Close;
                 	 datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:='SELECT idperson,nom,prenom FROM personnes where idperson= :idepou';
                    datamodule1.fdQuerMajPlus.ParamByName('idepou').AsString := iEpo;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                 		  edNEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                 		  edPEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                      lbEpo.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;
                    datamodule1.fdQuerMajPlus.Close;
                    datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idperson,nom,prenom FROM personnes where idperson= :idepou2';
                    datamodule1.fdQuerMajPlus.ParamByName('idepou2').AsString := iEpo2;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                 		edN2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                 		edP2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                    lbEpo2.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;
                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT iddept,dept FROM departement where iddept= :idddep';
                    datamodule1.fdQuerMajPlus.ParamByName('idddep').AsString := iDdep;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                         CbDDec.itemindex:=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger
                         else
                         CbDDec.itemindex:=0;
                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT iddept,dept FROM departement where iddept= :idndep';
                    datamodule1.fdQuerMajPlus.ParamByName('idndep').AsString := iNdep;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                 		     CbDNaiss.ItemIndex:=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger
                         else
                         CbDNaiss.ItemIndex:=0;
                         datamodule1.fdQuerMajPlus.Close;
                         datamodule1.fdQuerMajPlus.SQL.Clear;
                         datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idnation,nom FROM pays where idnation= :idnpa';
                         datamodule1.fdQuerMajPlus.ParamByName('idnpa').AsString := iNpa;
                         datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                 		     CbPNaiss.ItemIndex:=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger
                         else
                         CbPNaiss.ItemIndex:=0;
                    	   datamodule1.fdQuerMajPlus.Close;
                 		     datamodule1.fdQuerMajPlus.SQL.Clear;
                  		   datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idnation,nom FROM pays where idnation= :iddpa';
                         datamodule1.fdQuerMajPlus.ParamByName('iddpa').AsString := iDpa;
                         datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                         CbPDec.ItemIndex:=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger
                         else
                         CbPDec.ItemIndex:=0;
                  datamodule1.fdQuerMajPlus.SQL.Clear;
                  datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT count(*) as nbe FROM personnes where idper=:idind or idmer=:idind ' ) ;
                  datamodule1.fdQuerMajPlus.ParamByName('idind').AsInteger := IndPers;
                  datamodule1.fdQuerMajPlus.Open;
                  EdEnf.Text :=datamodule1.fdQuerMajPlus.FieldByName('nbe').AsString;
             end;
           
           
    end
    else
               begin
                  for i := 0 to Componentcount-1 do
                        begin
                            if Components[i] is TEdit  then
                                 begin
                                   TEdit(Components[i]).Text:='';
                                 end;
                             if (Components[i] is TComboBox and (TComboBox(Components[i]).Name <> 'CbNom')) then
                                 begin
                                   TComboBox(Components[i]).itemindex:=0;
                                 end;
                                if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name =  'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2')or (TLabel(Components[i]).Name =  'lbInd') )) then
                                 begin
                                   TLabel(Components[i]).Text:='0';
                                 end;
                              if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                                  begin
                                     lbMaj.Text:= 'Mise à jour le : ' ;
                                  end;
                        end;
               end;

end;

procedure TFCons.FormActivate(Sender: TObject);
  var
    i:integer;
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

           datamodule1.fdQuerPays.Next;
       end;
        datamodule1.fdQuerPays.close;
         CbPNaiss.ItemIndex :=0;
         CbPdec.ItemIndex :=0;
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

           datamodule1.fdQuerDept.Next;
      end;
         datamodule1.fdQuerDept.close;
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


           datamodule1.fdQuerNomPren.Next;
       end;
         datamodule1.fdQuerNomPren.close;
         CbNom.ItemIndex :=0;
          for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
                 if (Components[i] is TComboBox and (TComboBox(Components[i]).Name <> 'CbNom')) then
                     begin
                       TComboBox(Components[i]).itemindex:=0;
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name =  'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2')or (TLabel(Components[i]).Name =  'lbInd') )) then
                     begin
                       TLabel(Components[i]).Text:='0';;
                     end;
                  if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                      begin
                         lbMaj.Text:= 'Mise à jour le : ' ;
                      end;
            end;
end;

procedure TFCons.FormCreate(Sender: TObject);
   var
    i:integer;
begin
  Datmaj := DateToStr(Date);
  for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
                 if (Components[i] is TComboBox and (TComboBox(Components[i]).Name <> 'CbNom')) then
                     begin
                       TComboBox(Components[i]).itemindex:=0;
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name =  'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2')or (TLabel(Components[i]).Name =  'lbInd') )) then
                     begin
                       TLabel(Components[i]).Text:='0';
                     end;
                  if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                      begin
                         lbMaj.Text:= 'Mise à jour le : ' ;
                      end;
            end;
end;

end.
