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
    lbNMaj: TLabel;
    lbEpMaj: TLabel;
    LbEp2Maj: TLabel;
    lbPMaj: TLabel;
    lbMMaj: TLabel;
    procedure btQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbNomChange(Sender: TObject);
    procedure btRecClick(Sender: TObject);
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

procedure TFMaj.btRecClick(Sender: TObject);
  var IndPers,NomPer,PrenomPer,NomMer,PrenomMer,LNaiss,LDec,Dnaiss,DDec,DMar,Prenom2,Prenom3,NEpou,PEpou,NEpou2,PEpou2,DMar2, Datmaj : string;
 		idInd,idPer,idMer,idEpo,idEpo2,DeptNaiss,DeptDec,NatDec,NatNaiss,i,j : Integer;
begin
//     NomPer :=Uppercase( EdPNmaj.Text);
//     PrenomPer := Uppercase(EdPPmaj.Text);
//     NomMer := Uppercase(EdMNmaj.Text);
//     PrenomMer := Uppercase(EdMPmaj.Text);
//     LDec := EdLDmaj.Text;
//     LNaiss := EdLNmaj.Text;
//     Dnaiss := EdDNmaj.Text;
//     Prenom2 := Uppercase(EdP2maj.Text);
//     Prenom3 := Uppercase(EdP3maj.Text);
//     DDec := EdDDmaj.Text;
//     Dmar := EdDMmaj.Text;
//     NEpou := Uppercase(EdNEpmaj.Text);
//     PEpou := Uppercase(EdPEpmaj.Text);
//     Dmar2 := EdDM2maj.Text;
//     NEpou2 := Uppercase(EdNEp2maj.Text);
//     PEpou2 := Uppercase(EdPEp2maj.Text);
//     if CbDeptNmaj.text<>'' then
//             DeptNaiss := Integer(CbDeptNmaj.Items.Objects[CbDeptNmaj.ItemIndex])
//            else
//            DeptNaiss:=0;
//     if CbDeptDmaj.text<>'' then
//           DeptDec := Integer(CbDeptDmaj.Items.Objects[CbDeptDmaj.ItemIndex])
//          else
//            DeptDec:=0;
//     if CbPaysNmaj.text<>'' then
//           NatNaiss := Integer(CbPaysNmaj.Items.Objects[CbPaysNmaj.ItemIndex])
//          else
//            NatNaiss:=0;
//     if CbPaysDmaj.text<>'' then
//               NatDec := Integer(CbPaysDmaj.Items.Objects[CbPaysDmaj.ItemIndex])
//          else
//            NatDec:=0;
//     Datmaj := DateToStr(Date);
//     idInd:=Integer(CbPerson.Items.Objects[CbPerson.ItemIndex]);
//     idEpo:=0;
//     idEpo2:=0;
//     idPer:=0;
//     idMer:=0;
//     lbEpMaj.Caption:=IntTostr(idEpo);
//     lbEp2Maj.Caption:=IntTostr(idEpo2);
//     lbPMaj.Caption:=IntTostr(idPer);
//     lbMMaj.Caption:=IntTostr(idMer);
//     lbIdInd.Caption:=IntTostr(idInd);
//
//     //controle des homonymie
//     //époux
//     if (NEpou<>'') then
//       begin
//
//          ReqMajPlus.close;
//          ReqMajPlus.SQL.Clear;
//          ReqMajPlus.SQL.Add( 'SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NEPou and prenom=:PEPou ') ;
//          ReqMajPlus.ParamByName('NEPou').AsString := UpperCase(NEpou);
//          ReqMajPlus.ParamByName('PEPou').AsString := UpperCase(PEpou);
//
//          ReqMajPlus.Open;
//
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger=0) or (lbEpMaj.Caption='-1') then
//                   begin
//                   	try
//
//                    	begin
//
//                       		ReqIns.SQL.Clear;
//                       		ReqIns.SQL.Text := 'INSERT INTO personnes (nom, prenom,idepou,datmaj) '+
//                        		'VALUES (:Nom, :Prenom,:idEp,:Datmaj)';
//                       		ReqIns.ParamByName('Nom').AsString := UpperCase(NEpou);
//                       		ReqIns.ParamByName('Prenom').AsString := UpperCase(PEpou);
//                       		ReqIns.ParamByName('idEp').AsInteger := idInd;
//                        		ReqIns.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
//
//                       		ReqIns.ExecSQL;
//
//                         end;
//
//                     except
//
//                    end;
//                   end
//              		else
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger>=1) then
//                   begin
//                             Fchoix.Caption:='MAJ-Homonymie pour l Epoux(se)';
//                             Fchoix.lbChoix.caption:='MAJ';
//                             Fchoix.RdChoix.Visible := False;
//                             Fchoix.cbDebArbre.Visible := false;
//                             Fchoix.Label1.Visible := False;
//                             Fchoix.btValid.Visible:=True;
//               			         Fchoix.btNew.visible:=True;
//               			         Fchoix.btQuit.Visible:=False;
//                             Fchoix.LbMsg.Caption :='il y a déjà des individus avec cette identité';
//                             Fchoix.ReqChoix.close;
//                             Fchoix.ReqChoix.SQL.clear;
//                             Fchoix.ReqChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "NC",DATE_FORMAT(datnaiss,"%d/%m/%Y")) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
//                             Fchoix.ReqChoix.ParamByName('Nom').AsString := UpperCase(Fmajo.EdNEpmaj.Text);
//                             Fchoix.ReqChoix.ParamByName('Prenom').AsString := UpperCase(Fmajo.EdPEpmaj.Text);
//                             Fchoix.ReqChoix.Open;
//
//                             Fchoix.ReqChoix.first;
//                             j:=0;
//
//                             while not Fchoix.ReqChoix.Eof do
//                                  begin
//
//                                  IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('idperson').AsString);
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('nom').AsString );
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('prenom').AsString);
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('Naissance').AsString);
//
//
//                                  j:=j+1;
//                                  Fchoix.ReqChoix.Next;
//                                  end;
//                               Fchoix.sgChoix.ColWidths[0] :=40;
//                               Fchoix.sgChoix.ColWidths[1]:=120;
//                               Fchoix.sgChoix.ColWidths[2]:=120;
//                               Fchoix.sgChoix.ColWidths[3]:=80;
//                               Fchoix.sgChoix.Visible:=True;
//                               Fchoix.edNiv.Visible:=False;
//                               Fchoix.lbNiv.Visible:=false;
//
//
//                               fchoix.height:=250;
//                               fchoix.Width:=500;
//                               Fchoix.ShowModal;
//                               //lbEpMaj.caption:= Fchoix.lbSelect.Caption ;
//
//                   end;
//                   ReqMajPlus.Active:=False;
//         end;
//       //	else
//         		//begin
//           //	idEpo:= StrToInt(lbEpMaj.Caption);
//         	 //	end;
//     //epoux2
//     if (NEpou2<>'') then
//       begin
//
//          ReqMajPlus.close;
//          ReqMajPlus.SQL.Clear;
//          ReqMajPlus.SQL.Add( 'SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NEPou2 and prenom=:PEPou2 ') ;
//          ReqMajPlus.ParamByName('NEPou2').AsString := UpperCase(NEpou2);
//          ReqMajPlus.ParamByName('PEPou2').AsString := UpperCase(PEpou2);
//
//          ReqMajPlus.Open;
//
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger=0) or (lbEp2Maj.Caption='-1') then
//                   begin
//                   	try
//
//                    	begin
//
//                       		ReqIns.SQL.Clear;
//                       		ReqIns.SQL.Text := 'INSERT INTO personnes (nom, prenom,idepoubis,datmaj) '+
//                        		'VALUES (:Nom, :Prenom,:idEp2,:Datmaj)';
//                       		ReqIns.ParamByName('Nom').AsString := UpperCase(NEpou2);
//                       		ReqIns.ParamByName('Prenom').AsString := UpperCase(PEpou2);
//                       		ReqIns.ParamByName('idEp2').AsInteger := idInd;
//                        		ReqIns.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
//
//                       		ReqIns.ExecSQL;
//
//                         end;
//
//                     except
//
//                    end;
//                   end
//              		else
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger>=1) then
//                   begin
//                         Fchoix.Caption:='MAJ-Homonymie pour l Epoux(se)2';
//                         Fchoix.lbChoix.caption:='MAJ';
//                         Fchoix.RdChoix.Visible := False;
//                         Fchoix.cbDebArbre.Visible := false;
//                         Fchoix.Label1.Visible := False;
//                         Fchoix.btValid.Visible:=True;
//                         Fchoix.btNew.visible:=True;
//                         Fchoix.btQuit.Visible:=False;
//                         Fchoix.LbMsg.Caption :='il y a déjà des individus avec cette identité';
//                         Fchoix.ReqChoix.close;
//                         Fchoix.ReqChoix.SQL.clear;
//                         Fchoix.ReqChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "NC",DATE_FORMAT(datnaiss,"%d/%m/%Y")) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
//                         Fchoix.ReqChoix.ParamByName('Nom').AsString := UpperCase(Fmajo.EdNEp2maj.Text);
//                         Fchoix.ReqChoix.ParamByName('Prenom').AsString := UpperCase(Fmajo.EdPEp2maj.Text);
//                         Fchoix.ReqChoix.Open;
//
//                         Fchoix.ReqChoix.first;
//                         j:=0;
//
//                             while not Fchoix.ReqChoix.Eof do
//                                  begin
//
//                                  IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('idperson').AsString);
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('nom').AsString );
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('prenom').AsString);
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('Naissance').AsString);
//
//                                  j:=j+1;
//                                  Fchoix.ReqChoix.Next;
//                                  end;
//                               Fchoix.sgChoix.ColWidths[0] :=40;
//                               Fchoix.sgChoix.ColWidths[1]:=120;
//                               Fchoix.sgChoix.ColWidths[2]:=120;
//                               Fchoix.sgChoix.ColWidths[3]:=80;
//                               Fchoix.sgChoix.Visible:=True;
//                               Fchoix.edNiv.Visible:=False;
//                               Fchoix.lbNiv.Visible:=false;
//
//                              //Fchoix.ReqChoix.Active:=False;
//                               fchoix.height:=250;
//                               fchoix.Width:=500;
//                               Fchoix.ShowModal;
//                               //lbEp2Maj.caption:= Fchoix.lbSelect.Caption ;
//
//                   end;
//
//         end ;
//       	//else
//         	 //	begin
//           //	idEpo2:= StrToInt(lbEp2Maj.Caption);
//         	//	end;
//
//     //père
//     if (NomPer<>'') then
//       begin
//          ReqMajPlus.close;
//          ReqMajPlus.SQL.Clear;
//          ReqMajPlus.SQL.Add( 'SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NomPer and prenom=:PrenomPer ') ;
//          ReqMajPlus.ParamByName('NomPer').AsString := UpperCase(NomPer);
//          ReqMajPlus.ParamByName('PrenomPer').AsString := UpperCase(PrenomPer);
//
//          ReqMajPlus.Open;
//
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger=0) or (lbPMaj.Caption='-1'  )then
//                   begin
//                   	try
//                       begin
//
//                         ReqIns.SQL.Clear;
//                         ReqIns.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
//                          'VALUES (:Nom, :Prenom,:Datmaj)';
//                         ReqIns.ParamByName('Nom').AsString := UpperCase(NomPer);
//                         ReqIns.ParamByName('Prenom').AsString := UpperCase(PrenomPer);
//                         //ReqIns.ParamByName('idEp').AsInteger := idInd;
//                         ReqIns.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
//
//                         ReqIns.ExecSQL;
//
//                       end;
//                       except
//
//                       end;
////
//                   end
//                   else
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger>=1) then
//                   begin
//
//
//                             Fchoix.Caption:='MAJ-Homonymie pour le Père';
//                             Fchoix.lbChoix.caption:='MAJ';
//                             Fchoix.RdChoix.Visible := False;
//                             Fchoix.cbDebArbre.Visible := false;
//                             Fchoix.Label1.Visible := False;
//                             Fchoix.btValid.Visible:=True;
//               			         Fchoix.btNew.visible:=True;
//               			         Fchoix.btQuit.Visible:=False;
//                             Fchoix.LbMsg.Caption :='il y a déjà des individus avec cette identité';
//                             Fchoix.ReqChoix.close;
//                             Fchoix.ReqChoix.SQL.clear;
//                             Fchoix.ReqChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "NC",DATE_FORMAT(datnaiss,"%d/%m/%Y")) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
//                             Fchoix.ReqChoix.ParamByName('Nom').AsString := UpperCase(Fmajo.EdPNmaj.Text);
//                             Fchoix.ReqChoix.ParamByName('Prenom').AsString := UpperCase(Fmajo.EdPPmaj.Text);
//                             Fchoix.ReqChoix.Open;
//
//                             Fchoix.ReqChoix.first;
//                             j:=0;
//                             while not Fchoix.ReqChoix.Eof do
//                                  begin
//
//                                       IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
//                                       Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('idperson').AsString);
//                                       Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('nom').AsString );
//                                       Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('prenom').AsString);
//                                       Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('Naissance').AsString);
//                                        j:=j+1;
//                                        Fchoix.ReqChoix.Next;
//                                  end;
//                              Fchoix.sgChoix.ColWidths[0] :=40;
//                               Fchoix.sgChoix.ColWidths[1]:=120;
//                               Fchoix.sgChoix.ColWidths[2]:=120;
//                               Fchoix.sgChoix.ColWidths[3]:=80;
//                               Fchoix.sgChoix.Visible:=True;
//                               //Fchoix.ReqChoix.Active:=False;
//                               fchoix.height:=250;
//                               fchoix.Width:=500;
//                               Fchoix.ShowModal;
//
//
//
//                   end;
//
//       end ;
//      // else
//       //  begin
//       //   idPer:=0;
//       //  end;
//
//     //mère
//     if (NomMer<>'') then
//       begin
//         ReqMajPlus.close;
//          ReqMajPlus.SQL.Clear;
//          ReqMajPlus.SQL.Add( 'SELECT count(*) as nbp,idperson,nom,prenom FROM personnes where nom=:NomMer and prenom=:PrenomMer ') ;
//          ReqMajPlus.ParamByName('NomMer').AsString := UpperCase(NomMer);
//          ReqMajPlus.ParamByName('PrenomMer').AsString := UpperCase(PrenomMer);
//
//          ReqMajPlus.Open;
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger=0) or(lbMMaj.Caption='-1') then
//                   begin
//                   	try
//                       begin
//
//                       ReqIns.SQL.Clear;
//                       ReqIns.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
//                        'VALUES (:Nom, :Prenom,:Datmaj)';
//                       ReqIns.ParamByName('Nom').AsString := UpperCase(NomMer);
//                       ReqIns.ParamByName('Prenom').AsString := UpperCase(PrenomMer);
//                       ReqIns.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
//
//                       ReqIns.ExecSQL;
//
//                       end;
//                    except
//
//                    end;
////
//
//                   end
//                   else
//                   if (ReqMajPlus.FieldByName('nbp').AsInteger>=1) then
//                   begin
//                             Fchoix.Caption:='MAJ-Homonymie pour la Mère';
//                             Fchoix.lbChoix.caption:='MAJ';
//                             Fchoix.RdChoix.Visible := False;
//                             Fchoix.cbDebArbre.Visible := false;
//                             Fchoix.Label1.Visible := False;
//                             Fchoix.btValid.Visible:=True;
//               			         Fchoix.btNew.visible:=True;
//               			         Fchoix.btQuit.Visible:=False;
//                             Fchoix.LbMsg.Caption :='il y a déjà des individus avec cette identité';
//                             Fchoix.ReqChoix.close;
//                             Fchoix.ReqChoix.SQL.clear;
//                             Fchoix.ReqChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "NC",DATE_FORMAT(datnaiss,"%d/%m/%Y")) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
//                             Fchoix.ReqChoix.ParamByName('Nom').AsString := UpperCase(Fmajo.EdMNmaj.Text);
//                             Fchoix.ReqChoix.ParamByName('Prenom').AsString := UpperCase(Fmajo.EdMPmaj.Text);
//                             Fchoix.ReqChoix.Open;
//
//                               Fchoix.ReqChoix.first;
//                               j:=0;
//                             while not Fchoix.ReqChoix.Eof do
//                                  begin
//
//                                  IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('idperson').AsString);
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('nom').AsString );
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('prenom').AsString);
//                                  Fchoix.sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('Naissance').AsString);
//                                  j:=j+1;
//                                  Fchoix.ReqChoix.Next;
//                                  end;
//                               Fchoix.sgChoix.ColWidths[0] :=40;
//                               Fchoix.sgChoix.ColWidths[1]:=120;
//                               Fchoix.sgChoix.ColWidths[2]:=120;
//                               Fchoix.sgChoix.ColWidths[3]:=80;
//                               Fchoix.sgChoix.Visible:=True;
//
//                               fchoix.height:=250;
//                               fchoix.Width:=500;
//                               Fchoix.ShowModal;
//
//                   end;
//
//       end;
//       //else
//        // begin
//           //idMer:=0;
//         //end;
//
//  //mise à jour des données
//
//
//  try
//        if (EdNEpmaj.Text <>'') and ((lbEpmaj.Caption='-1') or (lbEpmaj.Caption='0')) then
//                begin
//                  ReqMaj.close;
//
//                  ReqMaj.SQL.Clear;
//                  ReqMaj.SQL.add('SELECT idperson FROM personnes where nom= :NomEp and prenom= :PrenomEp');
//                   ReqMaj.ParamByName('NomEp').AsString :=UpperCase(NEpou);
//                  ReqMaj.ParamByName('PrenomEp').AsString :=UpperCase(PEpou);
//
//                   ReqMaj.Open;
//                  idEpo :=ReqMaj.FieldByName('idperson').AsInteger;
//
//
//                end
//               else
//              if (lbEpmaj.Caption<>'0') and (lbEpmaj.Caption<>'-1') then
//                 begin
//                 	idEpo := StrToInt(lbEpmaj.Caption) ;
//                 end
//                 else
//                 begin
//                	idEpo :=0;
//                 end;
//                if (EdNEp2maj.Text <>'') and ((lbEp2maj.Caption='-1') or (lbEp2maj.Caption='0')) then
//                begin
//                  ReqMaj.close;
//
//                  ReqMaj.SQL.Clear;
//                  ReqMaj.SQL.add('SELECT idperson FROM personnes where nom= :NomEp2 and prenom= :PrenomEp2');
//                  ReqMaj.ParamByName('NomEp2').AsString :=UpperCase(NEpou2);
//                  ReqMaj.ParamByName('PrenomEp2').AsString :=UpperCase(PEpou2);
//
//                  ReqMaj.Open;
//                  idEpo2 :=ReqMaj.FieldByName('idperson').AsInteger;
//
//
//                end
//               else
//              if (lbEp2maj.Caption<>'0') and (lbEp2maj.Caption<>'-1') then
//                 begin
//                 	idEpo2 := StrToInt(lbEp2maj.Caption) ;
//                 end
//                 else
//                 begin
//                	idEpo2 :=0;
//                 end;
//             if (EdPNMaj.Text <>'') and ((lbPMaj.Caption='-1') or (lbPMaj.Caption='0')) then
//                 begin
//                      ReqMaj.close;
//
//                      ReqMaj.SQL.Clear;
//                      ReqMaj.SQL.add('SELECT idperson FROM personnes where nom= :NomPer and prenom= :PrenomPer');
//                      ReqMaj.ParamByName('NomPer').AsString :=UpperCase(NomPer);
//                      ReqMaj.ParamByName('PrenomPer').AsString :=UpperCase(PrenomPer);
//
//                      ReqMaj.Open;
//                      idPer :=ReqMaj.FieldByName('idperson').AsInteger;
//                end
//                  else
//               if (lbPMaj.Caption<>'0') and (lbPMaj.Caption<>'-1') then
//                 begin
//                      idPer := StrToInt(lbPMaj.Caption) ;
//                 end
//              else
//                 begin
//               	      idPer :=0;
//                end;
//               if (EdMNmaj.Text <>'') and ((lbMMaj.Caption='-1') or (lbMMaj.Caption='0')) then
//                 begin
//                   ReqMaj.close;
//
//                   ReqMaj.SQL.Clear;
//                   ReqMaj.SQL.add('SELECT idperson FROM personnes where nom= :NomMer and prenom= :PrenomMer');
//                   ReqMaj.ParamByName('NomMer').AsString :=UpperCase(NomMer);
//                   ReqMaj.ParamByName('PrenomMer').AsString :=UpperCase(PrenomMer);
//
//                   ReqMaj.Open;
//                   IdMer :=ReqMaj.FieldByName('idperson').AsInteger;
//
//                end
//                 else
//               if (lbMMaj.Caption<>'0') and (lbMMaj.Caption<>'-1') then
//                begin
//                  IdMer := StrToInt(lbMMaj.Caption) ;
//                 end
//               else
//                 begin
//                 	IdMer :=0;
//                end;
//
//         begin
//
//           ReqMaj.SQL.Clear;
//           ReqMaj.SQL.Text := 'UPDATE  personnes SET lieunaiss=:LNaiss, lieudec=:LDec, prenom2=:Prenom2,'
//           	+' datnaiss=:DNaiss,datdec=:DDec , idper=:idPer,idmer=:idMer,datmaria=:Dmar,idepou=:idEpo,'
//               + 'datmarbis=:Dmar2,idepoubis=:idEpo2,idnatnaiss=:NatNaiss,idnatdec=:NatDec,iddeptnaiss=:DeptNaiss,iddeptdec=:DeptDec,prenom3=:Prenom3,memo=:Mmaj, datmaj=:Datmaj '+
//            'WHERE idperson=:idInd ' ;
//           ReqMaj.ParamByName('idInd').AsInteger := StrToInt(lbIdInd.Caption);
//           ReqMaj.ParamByName('Prenom2').AsString := UpperCase(Prenom2);
//           ReqMaj.ParamByName('Prenom3').AsString := UpperCase(Prenom3);
//           ReqMaj.ParamByName('LNaiss').AsString := UpperCase(LNaiss);
//           if  (MemMaj.Text<>'') then
//              ReqMaj.ParamByName('Mmaj').AsString := MemMaj.Text
//              else
//              ReqMaj.ParamByName('Mmaj').AsString := '';
//           if (EdDNmaj.Text <>'') and (EdDNmaj.Text <>'NC') then
//           	ReqMaj.ParamByName('Dnaiss').AsDate := StrToDate(Dnaiss)
//           	else
//           	ReqMaj.ParamByName('Dnaiss').AsString := '00/00/0000';
//           ReqMaj.ParamByName('LDec').AsString := UpperCase(LDec);
//           if (EdDDmaj.Text <>'') and (EdDDmaj.Text <>'NC') then
//           	ReqMaj.ParamByName('DDec').AsDate := StrToDate(DDec)
//           	else
//           	ReqMaj.ParamByName('DDec').AsString := '00/00/0000';
//           ReqMaj.ParamByName('idPer').AsInteger := idPer;
//           ReqMaj.ParamByName('idMer').AsInteger := idMer;
//           ReqMaj.ParamByName('idEpo').AsInteger := idEpo;
//           ReqMaj.ParamByName('idEpo2').AsInteger := idEpo2;
//           ReqMaj.ParamByName('NatNaiss').AsInteger := NatNaiss;
//           ReqMaj.ParamByName('DeptNaiss').AsInteger := DeptNaiss;
//           ReqMaj.ParamByName('NatDec').AsInteger := NatDec;
//           ReqMaj.ParamByName('DeptDec').AsInteger := DeptDec;
//           if (EdDMmaj.Text <>'') and (EdDMmaj.Text <>'NC') then
//           	ReqMaj.ParamByName('Dmar').AsDate := StrToDate(Dmar)
//           	else
//           	ReqMaj.ParamByName('Dmar').AsString := '00/00/0000';
//           if (EdDM2maj.Text <>'') and (EdDM2maj.Text <>'NC') then
//           	ReqMaj.ParamByName('Dmar2').AsDate := StrToDate(Dmar2)
//           	else
//           	ReqMaj.ParamByName('Dmar2').AsString := '00/00/0000';
//           ReqMaj.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
//
//           ReqMaj.ExecSQL;
//
//         end;
//
//     finally
//      ShowMessage ('Données mises à jour dans la base');
//       for i := 0 to Componentcount-1 do
//          	begin
//            		if Components[i] is TEdit  then
//                     begin
//                       TEdit(Components[i]).Text:='';
//                     end;
//               end;
//       for i := 0 to Componentcount-1 do
//          	begin
//            		if (Components[i] is TComboBox ) then
//                     begin
//                       TComboBox(Components[i]).Text:='';
//                     end;
//               end;
//          for i := 0 to Componentcount-1 do
//          	begin
//            		if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMMaj') or (TLabel(Components[i]).Name = 'lbPMaj') or (TLabel(Components[i]).Name =  'lbEpMaj') or (TLabel(Components[i]).Name =  'lbEp2Maj') or (TLabel(Components[i]).Name =  'lbIdInd') )) then
//                     begin
//                       TLabel(Components[i]).Caption:='';
//                     end;
//               end;
//         LabDatmaj.Caption:='Mise à jour le : ';
//         MemMaj.text :='';
//     end;
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
                  lbNMaj.Text :=  datamodule1.fdQuerMaj.FieldByName('idperson').AsString;
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
                    datamodule1.fdQuerMajPlus.Close;
                  	datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idmer').AsString ) ) ;
                    datamodule1.fdQuerMajPlus.Open;
                    if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                      begin
                 		    EdNMer.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                     		EdPmer.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                        lbMMaj.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;

                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idper').AsString ) ) ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                 		  edNPer.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                 		  edPPer.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                      lbPMaj.text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;
                   datamodule1.fdQuerMajPlus.Close;
                 	 datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idepou').AsString ) ) ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                 		  edNEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                 		  edPEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                      lbEpMaj.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;
//
//                    datamodule1.fdQuerMajPlus.Close;
                    datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idepoubis').AsString ) ) ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                    begin
                 		edN2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                 		edP2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
                    lbEp2Maj.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
                    end;
                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT iddept,dept FROM departement where iddept='+ (datamodule1.fdQuerMaj.FieldByName('iddeptdec').AsString ) ) ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                         //CbDDec.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger;
                         CbDDec.selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('dept').AsString;
                    datamodule1.fdQuerMajPlus.Close;
                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT iddept,dept FROM departement where iddept='+ (datamodule1.fdQuerMaj.FieldByName('iddeptnaiss').AsString ) ) ;
                    datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                         //CbDNaiss.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger;
                 		     CbDNaiss.selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('dept').AsString;
                         datamodule1.fdQuerMajPlus.Close;
                         datamodule1.fdQuerMajPlus.SQL.Clear;
                         datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idnation,nom FROM pays where idnation='+ (datamodule1.fdQuerMaj.FieldByName('idnatnaiss').AsString ) ) ;
                         datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                         //CbPNaiss.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger;
                 		     CbPNaiss.Selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                    	   datamodule1.fdQuerMajPlus.Close;
                 		     datamodule1.fdQuerMajPlus.SQL.Clear;
                  		   datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idnation,nom FROM pays where idnation='+ (datamodule1.fdQuerMaj.FieldByName('idnatdec').AsString ) ) ;
                         datamodule1.fdQuerMajPlus.Open;
                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
                         //CbPDec.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger;
                         CbPDec.Selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
                  datamodule1.fdQuerMajPlus.SQL.Clear;
                  datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT count(*) as nbe FROM personnes where idper=:idind or idmer=:idind ' ) ;
                  datamodule1.fdQuerMajPlus.ParamByName('idind').AsInteger := IndPers;
                  datamodule1.fdQuerMajPlus.Open;
                  EdEnf.Text :=datamodule1.fdQuerMajPlus.FieldByName('nbe').AsString;
             end;
    end;
end;
//  var
//  		i,idIndi,IndPers: Integer;
//begin
//  for i := 0 to Componentcount-1 do
//          	begin
//            		if Components[i] is TEdit  then
//                     begin
//                       TEdit(Components[i]).Text:='';
//                     end;
//                if (Components[i] is TComboBox and (TComboBox(Components[i]).Name <> 'CbNom')) then
//                     begin
//                       TComboBox(Components[i]).itemindex:=0;
//                     end;
//                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMMaj') or (TLabel(Components[i]).Name = 'lbPMaj') or (TLabel(Components[i]).Name = 'lbEpMaj'))) then
//                     begin
//                       TLabel(Components[i]).Text:='';
//                     end;
//                     if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbEp2Maj')or (TLabel(Components[i]).Name = 'lbNMaj'))) then
//                     begin
//                       TLabel(Components[i]).Text:='';
//                     end;
//               end;
//  Individu := CbNom.Text;
//
//  if cbnom.ItemIndex<>0 then
//    begin
//      datamodule1.fdQuerMaj.close;
//      datamodule1.fdQuerMaj.SQL.Clear;
//               datamodule1.fdQuerMaj.SQL.text := 'SELECT idperson,nom,prenom,if(datnaiss="0000-00-00", "NC",datnaiss) as Naissance,if(datdec="0000-00-00", "NC",datdec) as Deces,idper,'
//                               +'idmer,if(datmaria="0000-00-00", "NC",datmaria) as Mariage,idepou,'
//                               +'if(datmarbis="0000-00-00", "NC",datmarbis) as Mariage2,idepoubis,lieunaiss,lieudec,idnatnaiss,idnatdec,'
//                               +'iddeptnaiss,iddeptdec,prenom2,prenom3,memo,datmaj'
//                               +' FROM personnes as a  where (nom||" "||prenom||" -"||idperson) = :indiv' ;
//               datamodule1.fdQuerMaj.ParamByName('indiv').AsString := Individu;
//     datamodule1.fdQuerMaj.open;
//
//     if (datamodule1.fdQuerMaj.RecordCount =1) then
//           	begin
//                  IndPers := datamodule1.fdQuerMaj.FieldByName('idperson').AsInteger;
//                  lbNMaj.Text :=  datamodule1.fdQuerMaj.FieldByName('idperson').AsString;
//                 	EdNaiss.Text :=  datamodule1.fdQuerMaj.FieldByName('Naissance').AsString;
//                  EdDec.Text := datamodule1.fdQuerMaj.FieldByName('Deces').AsString;
//                  EdMaria.Text := datamodule1.fdQuerMaj.FieldByName('Mariage').AsString;
//                  Ed2Maria.Text :=  datamodule1.fdQuerMaj.FieldByName('Mariage2').AsString;
//                  EdLDec.Text := datamodule1.fdQuerMaj.FieldByName('lieudec').AsString;
//                  EdLNaiss.Text := datamodule1.fdQuerMaj.FieldByName('lieunaiss').AsString;
//                  edPren.Text := datamodule1.fdQuerMaj.FieldByName('prenom').AsString;
//                  edPren2.Text := datamodule1.fdQuerMaj.FieldByName('prenom2').AsString;
//                  edPren3.Text := datamodule1.fdQuerMaj.FieldByName('prenom3').AsString;
//                  MemMaj.Text:=  datamodule1.fdQuerMaj.FieldByName('memo').AsString;
//                  if (DateTimeToStr(datamodule1.fdQuerMaj.FieldByName('datmaj').AsDateTime)<>'31/12/1899') then
//                  		lbMaj.Text:= 'Mise à jour le : ' +  DateTimeToStr(datamodule1.fdQuerMaj.FieldByName('datmaj').AsDateTime)
//                  else
//                  		lbMaj.Text:= 'Mise à jour le : 00/00/0000 ' ;
//                    datamodule1.fdQuerMajPlus.Close;
//                  	datamodule1.fdQuerMajPlus.SQL.Clear;
//                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idmer').AsString ) ) ;
//                    datamodule1.fdQuerMajPlus.Open;
//                    if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                      begin
//                 		    EdNMer.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
//                     		EdPmer.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
//                        lbMMaj.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
//                    end;
//
//                    datamodule1.fdQuerMajPlus.Close;
//                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
//                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idper').AsString ) ) ;
//                    datamodule1.fdQuerMajPlus.Open;
//                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                    begin
//                 		  edNPer.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
//                 		  edPPer.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
//                      lbPMaj.text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
//                    end;
//                   datamodule1.fdQuerMajPlus.Close;
//                 	 datamodule1.fdQuerMajPlus.SQL.Clear;
//                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idepou').AsString ) ) ;
//                    datamodule1.fdQuerMajPlus.Open;
//                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                    begin
//                 		  edNEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
//                 		  edPEpo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
//                      lbEpMaj.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
//                    end;
//                    datamodule1.fdQuerMajPlus.Close;
//                    datamodule1.fdQuerMajPlus.SQL.Clear;
//                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idperson,nom,prenom FROM personnes where idperson='+ (datamodule1.fdQuerMaj.FieldByName('idepoubis').AsString ) ) ;
//                    datamodule1.fdQuerMajPlus.Open;
//                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                    begin
//                 		edN2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
//                 		edP2Epo.Text := datamodule1.fdQuerMajPlus.FieldByName('prenom').AsString;
//                    lbEp2Maj.Text:= datamodule1.fdQuerMajPlus.FieldByName('idperson').AsString;
//                    end;
//                    datamodule1.fdQuerMajPlus.Close;
//                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
//                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT iddept,dept FROM departement where iddept='+ (datamodule1.fdQuerMaj.FieldByName('iddeptdec').AsString ) ) ;
//                    datamodule1.fdQuerMajPlus.Open;
//                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                         //CbDDec.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger;
//                         CbDDec.selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('dept').AsString;
//                    datamodule1.fdQuerMajPlus.Close;
//                 	  datamodule1.fdQuerMajPlus.SQL.Clear;
//                  	datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT iddept,dept FROM departement where iddept='+ (datamodule1.fdQuerMaj.FieldByName('iddeptnaiss').AsString ) ) ;
//                    datamodule1.fdQuerMajPlus.Open;
//                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                         //CbDNaiss.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('iddept').AsInteger;
//                 		     CbDNaiss.selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('dept').AsString;
//                         datamodule1.fdQuerMajPlus.Close;
//                         datamodule1.fdQuerMajPlus.SQL.Clear;
//                         datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idnation,nom FROM pays where idnation='+ (datamodule1.fdQuerMaj.FieldByName('idnatnaiss').AsString ) ) ;
//                         datamodule1.fdQuerMajPlus.Open;
//                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                         //CbPNaiss.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger;
//                 		     CbPNaiss.Selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
//                    	   datamodule1.fdQuerMajPlus.Close;
//                 		     datamodule1.fdQuerMajPlus.SQL.Clear;
//                  		   datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT idnation,nom FROM pays where idnation='+ (datamodule1.fdQuerMaj.FieldByName('idnatdec').AsString ) ) ;
//                         datamodule1.fdQuerMajPlus.Open;
//                  if (datamodule1.fdQuerMajPlus.RecordCount =1) then
//                         //CbPDec.ItemIndex :=datamodule1.fdQuerMajPlus.FieldByName('idnation').AsInteger;
//                         CbPDec.Selected.Text:=datamodule1.fdQuerMajPlus.FieldByName('nom').AsString;
//                  datamodule1.fdQuerMajPlus.SQL.Clear;
//                  datamodule1.fdQuerMajPlus.SQL.Add( 'SELECT count(*) as nbe FROM personnes where idper=:idind or idmer=:idind ' ) ;
//                  datamodule1.fdQuerMajPlus.ParamByName('idind').AsInteger := IndPers;
//                  datamodule1.fdQuerMajPlus.Open;
//                  EdEnf.Text :=datamodule1.fdQuerMajPlus.FieldByName('nbe').AsString;
//             end;
//    end;
//end;

procedure TFMaj.FormActivate(Sender: TObject);
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
         for i := 0 to Componentcount-1 do
          	begin
            		if Components[i] is TEdit  then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
                 if (Components[i] is TComboBox and (TComboBox(Components[i]).Name <> 'CbNom')) then
                     begin
                       TComboBox(Components[i]).Selected.Text:='';
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMMaj') or (TLabel(Components[i]).Name = 'lbPMaj') or (TLabel(Components[i]).Name = 'lbEpMaj') )) then
                     begin
                       TLabel(Components[i]).Text:='';
                     end;
                    if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbEp2Maj')or (TLabel(Components[i]).Name = 'lbNMaj'))) then
                     begin
                       TLabel(Components[i]).Text:='';
                     end;
            end;
end;

procedure TFMaj.FormCreate(Sender: TObject);

begin
  Datmaj := DateToStr(Date);

end;

end.
