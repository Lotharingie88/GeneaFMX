unit Maj;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Firedac.Stan.Param, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
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
    btSupp: TButton;
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
    LbEpo2: TLabel;
    lbPer: TLabel;
    lbMer: TLabel;
    btPhot: TButton;
    procedure btQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbNomChange(Sender: TObject);
    procedure btRecClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPhotClick(Sender: TObject);
    procedure btSuppClick(Sender: TObject);


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
  uses
    Choix2;
  var
    datmaj:string;
procedure TFMaj.btPhotClick(Sender: TObject);
begin
  ShowMessage ('une photo à integrer ?');
end;

procedure TFMaj.btQuitClick(Sender: TObject);
  var
  i:integer;
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
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name = 'lbEpo') )) then
                     begin
                       TLabel(Components[i]).Text:='0';
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbEpo2') or (TLabel(Components[i]).Name = 'lbInd'))) then
                     begin
                       TLabel(Components[i]).Text:='0';
                     end;
                     if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                       begin
                           lbMaj.Text:= 'Mise à jour le : ' ;
                        end;
            end;
  fmaj.close;
end;

procedure TFMaj.btRecClick(Sender: TObject);
  var NomPer,PrenomPer,NomMer,PrenomMer,LNaiss,LDec,Dnaiss,DDec,DMar,Prenom2,Prenom3,NEpou,PEpou,NEpou2,PEpou2,DMar2, Datmaj : string;
 		idPer,idMer,idEpo,idEpo2,DeptNaiss,DeptDec,NatDec,NatNaiss,i : Integer;
begin
     NomPer :=EdNPer.Text;
     PrenomPer := EdPPer.Text;
     NomMer := EdNMer.Text;
     PrenomMer := EdPMer.Text;
     LDec := EdLDec.Text;
     LNaiss := EdLNaiss.Text;
     Dnaiss := EdNaiss.Text;
     Prenom2 := EdPren2.Text;
     Prenom3 := EdPren3.Text;
     DDec := EdDec.Text;
     Dmar := EdMaria.Text;
     NEpou := EdNEpo.Text;
     PEpou := EdPEpo.Text;
     Dmar2 := Ed2Maria.Text;
     NEpou2 := EdN2Epo.Text;
     PEpou2 := EdP2Epo.Text;
     if CbDNaiss.text<>'' then
             DeptNaiss:=CbDNaiss.ItemIndex
            else
            DeptNaiss:=0;
     if CbDDec.text<>'' then
           DeptDec :=CbDDec.itemindex
          else
            DeptDec:=0;
     if CbPNaiss.text<>'' then
           NatNaiss := CbPNaiss.ItemIndex
          else
            NatNaiss:=0;
     if CbPDec.text<>'' then
               NatDec := CbPDec.ItemIndex
          else
            NatDec:=0;
       Datmaj := DateToStr(Date);
//     idInd:=0;
//     idEpo:=0;
//     idEpo2:=0;
//     idPer:=0;
//     idMer:=0;
//     lbEpo.Text:=IntTostr(idEpo);
//     lbEpo2.Text:=IntTostr(idEpo2);
//     lbPer.Text:=IntTostr(idPer);
//     lbMer.Text:=IntTostr(idMer);
//     lbInd.Text:=IntTostr(idInd);

//     //controle des homonymie
//     //époux
     if (NEpou<>'') then
       begin
          datamodule1.fdQuerMaj.close;
          datamodule1.fdQuerMaj.SQL.Clear;
          datamodule1.fdQuerMaj.SQL.text:='SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NEPou and prenom=:PEPou ' ;
          datamodule1.fdQuerMaj.ParamByName('NEPou').AsString := NEpou;
          datamodule1.fdQuerMaj.ParamByName('PEPou').AsString := PEpou;
          datamodule1.fdQuerMaj.Open;
                   if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger=0) or (lbEpo.Text='-1') then
                   begin
                   	try
                        begin
                            datamodule1.fdQuerMajPlus.SQL.Clear;
                            datamodule1.fdQuerMajPlus.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                              'VALUES (:Nom, :Prenom,:Datmaj)';
                            datamodule1.fdQuerMajPlus.ParamByName('Nom').AsString := NEpou;
                            datamodule1.fdQuerMajPlus.ParamByName('Prenom').AsString := PEpou;

                            datamodule1.fdQuerMajPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                            datamodule1.fdQuerMajPlus.ExecSQL;
                        end;
                      except
                    end;
                   end
              		else
                   if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger>=1) then
                     begin
                             Fchoix.Caption:='MAJ-Homonymie pour l Epoux(se)';
                             Fchoix.lbChoix.Text:='MAJ';
                             Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.lbNom.Visible:=true ;
                             Fchoix.lbPren.Visible:=true ;
                             Fchoix.lbNom.Text:=edNEpo.Text ;
                             Fchoix.lbPren.Text:=edPEpo.text ;
                             Fchoix.LbMsg.Text :='il y a déjà des individus avec cette identité';
                             Fchoix.lbArbr.Visible:=False;
                             Fchoix.lbNiv.Visible:=False;
                             Fchoix.edNiv.Visible:=False;
                             fchoix.height:=610;
                             fchoix.Width:=695;
                             Fchoix.ShowModal;
                     end;

         end ;
//       	else
//         		begin
//            	idEpo:= StrToInt(lbEpo.text);
//         	 end;

//     //epoux2
     if (NEpou2<>'') then
       begin

          datamodule1.fdQuerMaj.SQL.Clear;
          datamodule1.fdQuerMaj.SQL.text:= 'SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NEPou2 and prenom=:PEPou2 ' ;
          datamodule1.fdQuerMaj.ParamByName('NEPou2').AsString := NEpou2;
          datamodule1.fdQuerMaj.ParamByName('PEPou2').AsString := PEpou2;
          datamodule1.fdQuerMaj.Open;
                   if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger=0) or (lbEpo2.text='-1') then
                      begin
                       	try
                          	begin
                           		datamodule1.fdQuerMajPlus.SQL.Clear;
                           		datamodule1.fdQuerMajPlus.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                            		'VALUES (:Nom, :Prenom,:Datmaj)';
                           		datamodule1.fdQuerMajPlus.ParamByName('Nom').AsString := NEpou2;
                           		datamodule1.fdQuerMajPlus.ParamByName('Prenom').AsString := PEpou2;

                          		datamodule1.fdQuerMajPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                           		datamodule1.fdQuerMajPlus.ExecSQL;
                            end;

                          except

                         end;
                     end
              		else
                   if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger>=1) then
                     begin
                         Fchoix.Caption:='MAJ-Homonymie pour l Epoux(se)2';
                         Fchoix.lbChoix.Text:='MAJ';
                         Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.lbNom.Visible:=true ;
                             Fchoix.lbPren.Visible:=true ;
                             Fchoix.lbNom.Text:=edN2Epo.Text ;
                             Fchoix.lbPren.Text:=edP2Epo.text ;
                             Fchoix.LbMsg.Text :='il y a déjà des individus avec cette identité';
                             Fchoix.lbArbr.Visible:=False;
                             Fchoix.lbNiv.Visible:=False;
                             Fchoix.edNiv.Visible:=False;
                             fchoix.height:=610;
                             fchoix.Width:=695;
                             Fchoix.ShowModal;
                     end;
//
         end
       	else
         	 	begin
             	idEpo2:= StrToInt(lbEpo2.text);
         		end;

     //père
     if (NomPer<>'') then
       begin
          datamodule1.fdQuerMaj.SQL.Clear;
          datamodule1.fdQuerMaj.SQL.Add( 'SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NomPer and prenom=:PrenomPer ') ;
          datamodule1.fdQuerMaj.ParamByName('NomPer').AsString := NomPer;
          datamodule1.fdQuerMaj.ParamByName('PrenomPer').AsString := PrenomPer;
          datamodule1.fdQuerMaj.Open;
                   if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger=0) or (lbPer.text='-1'  )then
                      begin
                    	  try
                           begin
                             datamodule1.fdQuerMajPlus.SQL.Clear;
                             datamodule1.fdQuerMajPlus.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                              'VALUES (:Nom, :Prenom,:Datmaj)';
                             datamodule1.fdQuerMajPlus.ParamByName('Nom').AsString := NomPer;
                             datamodule1.fdQuerMajPlus.ParamByName('Prenom').AsString := PrenomPer;

                             datamodule1.fdQuerMajPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                             datamodule1.fdQuerMajPlus.ExecSQL;
                           end;
                         except

                        end;
                      end
                   else
                     if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger>=1) then
                      begin
                             Fchoix.Caption:='MAJ-Homonymie pour le Père';
                             Fchoix.lbChoix.text:='MAJ';
                             Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.lbNom.Visible:=true ;
                             Fchoix.lbPren.Visible:=true ;
                             Fchoix.lbNom.Text:=edNPer.Text ;
                             Fchoix.lbPren.Text:=edPPer.text ;
                             Fchoix.LbMsg.Text :='il y a déjà des individus avec cette identité';
                             Fchoix.lbArbr.Visible:=False;
                             Fchoix.lbNiv.Visible:=False;
                             Fchoix.edNiv.Visible:=False;
                             fchoix.height:=610;
                             fchoix.Width:=695;
                             Fchoix.ShowModal;
                       end;
       end
       else
         begin
          idPer:=StrToInt(lbPer.text);
        end;
     //mère
     if (NomMer<>'') then
       begin

            datamodule1.fdQuerMaj.SQL.Clear;
            datamodule1.fdQuerMaj.SQL.Add( 'SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NomMer and prenom=:PrenomMer ') ;
            datamodule1.fdQuerMaj.ParamByName('NomMer').AsString := NomMer;
            datamodule1.fdQuerMaj.ParamByName('PrenomMer').AsString := PrenomMer;
            datamodule1.fdQuerMaj.Open;
                   if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger=0) or(lbMer.text='-1') then
                     begin
                        try
                           begin
                             datamodule1.fdQuerMajPlus.SQL.Clear;
                             datamodule1.fdQuerMajPlus.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                              'VALUES (:Nom, :Prenom,:Datmaj)';
                             datamodule1.fdQuerMajPlus.ParamByName('Nom').AsString := NomMer;
                             datamodule1.fdQuerMajPlus.ParamByName('Prenom').AsString := PrenomMer;
                             datamodule1.fdQuerMajPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                             datamodule1.fdQuerMajPlus.ExecSQL;
                           end;
                        except
                        end;
                     end
                   else
                   if (datamodule1.fdQuerMaj.FieldByName('nbp').AsInteger>=1) then
                     begin
                             Fchoix.Caption:='MAJ-Homonymie pour la Mère';
                             Fchoix.lbChoix.text:='MAJ';
                             Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.lbNom.Visible:=true ;
                             Fchoix.lbPren.Visible:=true ;
                             Fchoix.lbNom.Text:=edNMer.Text ;
                             Fchoix.lbPren.Text:=edPMer.text ;
                             Fchoix.LbMsg.Text :='il y a déjà des individus avec cette identité';
                             Fchoix.lbArbr.Visible:=False;
                             Fchoix.lbNiv.Visible:=False;
                             Fchoix.edNiv.Visible:=False;
                             fchoix.height:=610;
                             fchoix.Width:=695;
                             Fchoix.ShowModal;


                     end;
//
       end
       else
         begin
           idMer:=StrToInt(lbMer.text);
         end;
//  //mise à jour des données
  try
        if (EdNEpo.Text <>'') and ((lbEpo.Text='-1') or (lbEpo.Text='0')) then
                begin
                  datamodule1.fdQuerMaj.SQL.Clear;
                  datamodule1.fdQuerMaj.SQL.text:='SELECT idperson FROM personnes where nom= :NomEp and prenom= :PrenomEp';
                  datamodule1.fdQuerMaj.ParamByName('NomEp').AsString :=NEpou;
                  datamodule1.fdQuerMaj.ParamByName('PrenomEp').AsString :=PEpou;
                  datamodule1.fdQuerMaj.Open;
                  idEpo :=datamodule1.fdQuerMaj.FieldByName('idperson').AsInteger;
                end
               else
              if (lbEpo.text<>'0') and (lbEpo.text<>'-1') then
                 begin
                 	idEpo := StrToInt(lbEpo.text) ;
                 end
                 else
                 begin
                	idEpo :=0;
                 end;
                if (EdN2Epo.Text <>'') and ((lbEpo2.text='-1') or (lbEpo2.text='0')) then
                begin
//                  datamodule1.fdQuerMaj.close;
                  datamodule1.fdQuerMaj.SQL.Clear;
                  datamodule1.fdQuerMaj.SQL.text:='SELECT idperson FROM personnes where nom= :NomEp2 and prenom= :PrenomEp2';
                  datamodule1.fdQuerMaj.ParamByName('NomEp2').AsString :=NEpou2;
                  datamodule1.fdQuerMaj.ParamByName('PrenomEp2').AsString :=PEpou2;
                  datamodule1.fdQuerMaj.Open;
                  idEpo2 :=datamodule1.fdQuerMaj.FieldByName('idperson').AsInteger;
                end
               else
              if (lbEpo2.text<>'0') and (lbEpo2.text<>'-1') then
                 begin
                 	idEpo2 := StrToInt(lbEpo2.text) ;
                 end
                 else
                 begin
                	idEpo2 :=0;
                 end;
             if (EdNPer.Text <>'') and ((lbPer.text='-1') or (lbPer.text='0')) then
                 begin
//                      datamodule1.fdQuerMaj.close;
                      datamodule1.fdQuerMaj.SQL.Clear;
                      datamodule1.fdQuerMaj.SQL.text:='SELECT idperson FROM personnes where nom= :NomPer and prenom= :PrenomPer';
                      datamodule1.fdQuerMaj.ParamByName('NomPer').AsString :=NomPer;
                      datamodule1.fdQuerMaj.ParamByName('PrenomPer').AsString :=PrenomPer;
                      datamodule1.fdQuerMaj.Open;
                      idPer :=datamodule1.fdQuerMaj.FieldByName('idperson').AsInteger;
                end
                  else
               if (lbPer.text<>'0') and (lbPer.text<>'-1') then
                 begin
                      idPer := StrToInt(lbPer.text) ;
                 end
              else
                 begin
               	      idPer :=0;
                end;
               if (EdNMer.Text <>'') and ((lbMer.text='-1') or (lbMer.text='0')) then
                 begin
//                   datamodule1.fdQuerMaj.close;
                   datamodule1.fdQuerMaj.SQL.Clear;
                   datamodule1.fdQuerMaj.SQL.add('SELECT idperson FROM personnes where nom= :NomMer and prenom= :PrenomMer');
                   datamodule1.fdQuerMaj.ParamByName('NomMer').AsString :=UpperCase(NomMer);
                   datamodule1.fdQuerMaj.ParamByName('PrenomMer').AsString :=UpperCase(PrenomMer);
                   datamodule1.fdQuerMaj.Open;
                   idMer :=datamodule1.fdQuerMaj.FieldByName('idperson').AsInteger;
//
                end
                 else
               if (lbMer.text<>'0') and (lbMer.text<>'-1') then
                begin
                  IdMer := StrToInt(lbMer.text) ;
                 end
               else
                 begin
                 	IdMer :=0;
                end;
         begin
           datamodule1.fdQuerMaj.SQL.Clear;
           datamodule1.fdQuerMaj.SQL.Text := 'UPDATE  personnes SET lieunaiss=:LNaiss, lieudec=:LDec, prenom2=:Prenom2,'
           	+' datnaiss=:DNaiss,datdec=:DDec , idper=:idPer,idmer=:idMer,datmaria=:Dmar,idepou=:idEpo,'
               + 'datmarbis=:Dmar2,idepoubis=:idEpo2,idnatnaiss=:NatNaiss,idnatdec=:NatDec,iddeptnaiss=:DeptNaiss,iddeptdec=:DeptDec,prenom3=:Prenom3,memo=:Mmaj, datmaj=:Datmaj '+
            'WHERE idperson=:idInd ' ;
           datamodule1.fdQuerMaj.ParamByName('idInd').AsInteger := StrToInt(lbInd.text);
           datamodule1.fdQuerMaj.ParamByName('Prenom2').AsString := Prenom2;
           datamodule1.fdQuerMaj.ParamByName('Prenom3').AsString := Prenom3;
           datamodule1.fdQuerMaj.ParamByName('LNaiss').AsString := LNaiss;
           if  (MemMaj.Text<>'') then
              datamodule1.fdQuerMaj.ParamByName('Mmaj').AsString := MemMaj.Text
              else
              datamodule1.fdQuerMaj.ParamByName('Mmaj').AsString := '';
           if (EdNaiss.Text <>'') and (EdNaiss.Text <>'NC') then
           	datamodule1.fdQuerMaj.ParamByName('Dnaiss').AsDate := StrToDate(Dnaiss)
           	else
           	datamodule1.fdQuerMaj.ParamByName('Dnaiss').AsString := '0000-00-00';
           datamodule1.fdQuerMaj.ParamByName('LDec').AsString := LDec;
           if (EdDec.Text <>'') and (EdDec.Text <>'NC') then
           	datamodule1.fdQuerMaj.ParamByName('DDec').AsDate := StrToDate(DDec)
           	else
           	datamodule1.fdQuerMaj.ParamByName('DDec').AsString := '0000-00-00';
           datamodule1.fdQuerMaj.ParamByName('idPer').AsInteger := idPer;
           datamodule1.fdQuerMaj.ParamByName('idMer').AsInteger := idMer;
           datamodule1.fdQuerMaj.ParamByName('idEpo').AsInteger := idEpo;
           datamodule1.fdQuerMaj.ParamByName('idEpo2').AsInteger := idEpo2;
           datamodule1.fdQuerMaj.ParamByName('NatNaiss').AsInteger := NatNaiss;
           datamodule1.fdQuerMaj.ParamByName('DeptNaiss').AsInteger := DeptNaiss;
           datamodule1.fdQuerMaj.ParamByName('NatDec').AsInteger := NatDec;
           datamodule1.fdQuerMaj.ParamByName('DeptDec').AsInteger := DeptDec;
           if (EdMaria.Text <>'') and (EdMaria.Text <>'NC') then
           	datamodule1.fdQuerMaj.ParamByName('Dmar').AsDate := StrToDate(Dmar)
           	else
           	datamodule1.fdQuerMaj.ParamByName('Dmar').AsString := '0000-00-00';
           if (Ed2Maria.Text <>'') and (Ed2Maria.Text <>'NC') then
           	datamodule1.fdQuerMaj.ParamByName('Dmar2').AsDate := StrToDate(Dmar2)
           	else
           	datamodule1.fdQuerMaj.ParamByName('Dmar2').AsString := '0000-00-00';
           datamodule1.fdQuerMaj.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
           datamodule1.fdQuerMaj.ExecSQL;
            ShowMessage ('Données mises à jour dans la base');
         end;
//
     finally
      //ShowMessage ('Données mises à jour dans la base');
     end;
       for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
                if (Components[i] is TComboBox ) then
                     begin
                       TComboBox(Components[i]).itemindex:=0;
                     end;
                 if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name =  'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2') or (TLabel(Components[i]).Name =  'lbInd') )) then
                     begin
                       TLabel(Components[i]).Text:='0';
                     end;
               end;

         lbmaj.Text:='Mise à jour le : ';
         MemMaj.text :='';
     //end;
end;

procedure TFMaj.btSuppClick(Sender: TObject);
  //var
    //i:integer;
  begin
  //   datamodule1.fdQuerMajPlus.SQL.Clear;
  //   datamodule1.fdQuerMajPlus.SQL.Text := 'DELETE FROM personnes WHERE idperson = :idmer ';
  //   datamodule1.fdQuerMajPlus.ParamByName('idmer').AsString := NomMer;
  //   datamodule1.fdQuerMajPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
  //   datamodule1.fdQuerMajPlus.ExecSQL;
  end;

procedure TFMaj.cbNomChange(Sender: TObject);
var
  		i,IndPers: Integer;
      imer,iper,iepo,iepo2,indep,iddep,inpa,idpa:string;
begin
//  for i := 0 to Componentcount-1 do
//          	begin
//            		if Components[i] is TEdit  then
//                     begin
//                       TEdit(Components[i]).Text:='';
//                     end;
//
//                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name = 'lbInd') )) then
//                     begin
//                       TLabel(Components[i]).Text:='0';
//                     end;
//                     if (Components[i] is TLabel and ((TLabel(Components[i]).Name =  'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2') )) then
//                     begin
//                       TLabel(Components[i]).Text:='0';
//                     end;
//               end;
  Individu := CbNom.Text;

  if cbnom.text<>'' then
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
                  MemMaj.Text:=  datamodule1.fdQuerMaj.FieldByName('memo').AsString;
                  if (DateTimeToStr(datamodule1.fdQuerMaj.FieldByName('datmaj').AsDateTime)<>'31/12/1899') then
                  		lbMaj.Text:= 'Mise à jour le : ' +  DateTimeToStr(datamodule1.fdQuerMaj.FieldByName('datmaj').AsDateTime)
                  else
                  		lbMaj.Text:= 'Mise à jour le : 00/00/0000 ' ;
                    imer:=datamodule1.fdQuerMaj.FieldByName('idmer').AsString;
                    iper:=datamodule1.fdQuerMaj.FieldByName('idper').AsString;
                    iepo:=datamodule1.fdQuerMaj.FieldByName('idepou').AsString;
                    iepo2:=datamodule1.fdQuerMaj.FieldByName('idepoubis').AsString;
                    iddep:=datamodule1.fdQuerMaj.FieldByName('iddeptdec').AsString;
                    indep:=datamodule1.fdQuerMaj.FieldByName('iddeptnaiss').AsString;
                    inpa:=datamodule1.fdQuerMaj.FieldByName('idnatnaiss').AsString;
                    idpa:=datamodule1.fdQuerMaj.FieldByName('idnatdec').AsString;
                    datamodule1.fdQuerMajPlus.Close;
                  	datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idperson,nom,prenom FROM personnes where idperson = :idmer'  ;
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
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idperson,nom,prenom FROM personnes where idperson= :idper' ;
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
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idperson,nom,prenom FROM personnes where idperson= :idepo' ;
                    datamodule1.fdQuerMajPlus.ParamByName('idepo').AsString := iepo;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                 		  edNEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                 		  edPEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                      lbEpo.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;
                    datamodule1.fdQuerMajPlus.Close;
                    datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:='SELECT idperson,nom,prenom FROM personnes where idperson= :idepo2 ' ;
                    datamodule1.fdQuerMajPlus.ParamByName('idepo2').AsString := iepo2;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                   		edN2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                   		edP2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                      lbEpo2.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end
                    else
                     lbEpo2.Text:= '0';
                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT iddept,dept FROM departement where iddept= :idddep';
                    datamodule1.fdQuerMajplus.ParamByName('idddep').AsString := iddep ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then

                      CbDDec.ItemIndex:=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger
                      else
                      CbDDec.ItemIndex:=0;

                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT iddept,dept FROM departement where iddept= :idndep';
                    datamodule1.fdQuerMajplus.ParamByName('idndep').AsString := indep ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                 		     CbDNaiss.itemindex:=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger
                         else
                         CbDNaiss.itemindex:=0;
                    datamodule1.fdQuerMajPlus.Close;
                    datamodule1.fdQuerMajPlus.SQL.Clear;
                    datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idnation,nom FROM pays where idnation= :idnpa';
                    datamodule1.fdQuerMajplus.ParamByName('idnpa').AsString := inpa ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                 		     CbPNaiss.ItemIndex:=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger
                         else
                         CbPNaiss.ItemIndex:=0;
                    	   datamodule1.fdQuerMajPlus.Close;
                 		     datamodule1.fdQuerMajPlus.SQL.Clear;
                  		   datamodule1.fdQuerMajPlus.SQL.text:= 'SELECT idnation,nom FROM pays where idnation= :iddpa';
                         datamodule1.fdQuerMajplus.ParamByName('iddpa').AsString := idpa ;
                         datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                         CbPDec.ItemIndex:=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger
                         else
                         CbPDec.ItemIndex:=0;
                  datamodule1.fdQuerMajPlus.Close;
                  datamodule1.fdQuerMajPlus.SQL.Clear;
                  datamodule1.fdQuerMajPlus.SQL.text:='SELECT count(*) as nbe FROM personnes where idper=:idind or idmer=:idind '  ;
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
                                if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name =  'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2') or (TLabel(Components[i]).Name = 'lbInd') )) then
                                 begin
                                   TLabel(Components[i]).text:='0';
                                 end;
                              if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                                  begin
                                     lbMaj.Text:= 'Mise à jour le : ' ;
                                  end;
                        end;
               end;
end;


procedure TFMaj.FormClose(Sender: TObject; var Action: TCloseAction);
  var
    i:integer;
begin
   for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
                 if (Components[i] is TComboBox ) then
                     begin
                       TComboBox(Components[i]).itemindex:=0;
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name = 'lbEpo') )) then
                     begin
                       TLabel(Components[i]).Text.Empty;
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbEpo2')or (TLabel(Components[i]).Name = 'lbInd'))) then
                     begin
                       TLabel(Components[i]).Text.Empty;
                     end;
                     if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                       begin
                           lbMaj.Text:= 'Mise à jour le : ' ;
                        end;
            end;
end;

procedure TFMaj.FormCreate(Sender: TObject);
  var
    i:integer;
begin
  Datmaj := DateToStr(Date);

     datamodule1.fdQuerPays.open;
     CbPNaiss.Items.Clear();
     CbPNaiss.Items.Add('');
     CbPNaiss.ItemIndex := 0;
     CbPdec.Items.Clear();
     CbPdec.Items.Add('');
     CbPdec.ItemIndex := 0;
      datamodule1.fdQuerPays.first;
  	while not datamodule1.fdQuerPays.Eof do
       begin
           CbPNaiss.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
           CbPNaiss.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;
           CbPdec.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
           CbPdec.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;
           datamodule1.fdQuerPays.Next;
       end;

       datamodule1.fdQuerDept.close;
       datamodule1.fdQuerDept.open;
       CbDNaiss.Items.Clear();
       CbDNaiss.Items.Add('');
       CbDNaiss.ItemIndex := 0;
       CbDDec.Items.Clear();
       CbDDec.Items.Add('');
       CbDDec.ItemIndex := 0;
      datamodule1.fdQuerDept.first;
      while not datamodule1.fdQuerDept.Eof do
      begin
           CbDNaiss.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
           CbDNaiss.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
           CbDdec.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
           CbDdec.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
           datamodule1.fdQuerDept.Next;
      end;

    //datamodule1.fdQuerNomPren.close;
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
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMer') or (TLabel(Components[i]).Name = 'lbPer') or (TLabel(Components[i]).Name = 'lbEpo') )) then
                     begin
                       TLabel(Components[i]).Text.Empty;
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbEpo2')or (TLabel(Components[i]).Name = 'lbInd'))) then
                     begin
                       TLabel(Components[i]).Text.Empty;
                     end;
                     if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                       begin
                           lbMaj.Text:= 'Mise à jour le : ' ;
                        end;
            end;
end;




end.
