unit Choix2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.ListBox,udbgenea, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFChoix = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btQuit: TButton;
    btValid: TButton;
    btNew: TButton;
    rdChoix: TRadioButton;
    cbDebArbre: TComboBox;
    edNiv: TEdit;
    sgChoix: TStringGrid;
    lbChoix: TLabel;
    lbMsg: TLabel;
    lbSelect: TLabel;
    lbArbr: TLabel;
    lbNiv: TLabel;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    lbNom: TLabel;
    lbPren: TLabel;
    procedure btQuitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btValidClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FChoix: TFChoix;

implementation

{$R *.fmx}
  uses
   arbre,saisie,maj;
 var
  IndPers,j:integer;
  idNom,Person,nom,prenom:string;
procedure TFChoix.btNewClick(Sender: TObject);
begin
  if lbChoix.Text='Saisie' then
	begin
    if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end;
       //Fchoix.close;
  end
     else
     if lbChoix.text='MAJ' then
     begin

      if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)' then
           begin
         		Fmaj.lbEpMaj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour le Père' then
           begin
         		Fmaj.lbPMaj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour la Mère' then
          begin
         		Fmaj.lbMMaj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)2' then
           begin
         		Fmaj.lbEp2Maj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end;


       //Fchoix.close;


     end;
end;

procedure TFChoix.btQuitClick(Sender: TObject);
begin
  Fchoix.Close;
end;

procedure TFChoix.btValidClick(Sender: TObject);
  var
    idnom:string;
begin
   if lbChoix.text='Saisie' then
   	begin
       // i:=sgChoix.Selection.Top ;
       i:=sgChoix.Row;
       idNom:=sgChoix.Cells[0,i];

       if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  idNom;
             Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo2.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end;


       //close;
     end
     else
     if lbChoix.text='MAJ' then
     begin
       //i:=sgChoix.Selection.Top ;
       i:=sgChoix.Row;

       idNom:=sgChoix.Cells[0,i];

       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)' then
           begin
         		Fmaj.lbEpMaj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour le Père' then
           begin
         		Fmaj.lbPMaj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour la Mère' then
          begin
            //ShowMessage ('IdNom :' + idNom);
         		Fmaj.lbMMaj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
        else
        if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)2' then
           begin
         		Fmaj.lbEp2Maj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end;



     end
     else
     if lbChoix.text='Arbre' then
     begin

              Person := cbDebArbre.Selected.Text;

              datamodule1.fdQuerChoixPlus.close;
              datamodule1.fdQuerChoixPlus.SQL.clear;
              datamodule1.fdQuerChoixPlus.SQL.add( 'SELECT idperson,nom,prenom '
                +' FROM personnes where (nom||" "||prenom||" -"||idperson) = :indiv') ;

              datamodule1.fdQuerChoixPlus.ParamByName('indiv').AsString := Person;
              datamodule1.fdQuerChoixPlus.Open;
              Farbre.edInd0.Text:= datamodule1.fdQuerChoixPlus.FieldByName('idperson').AsString;
             Fchoix.Close;
     end;
end;

procedure TFChoix.FormActivate(Sender: TObject);
//  var
//    k:integer;
  begin
//  if Fchoix.lbChoix.Text='Saisie' then
//    begin
//      if Fchoix.Caption = 'Homonymie de la Personne' then
//       	begin
//         		Fsaisie.lbInd.text:=  idNom;
//
//          end
//       else
//       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
//           begin
//         		Fsaisie.lbEpo.text :=  idNom;
//
//          end
//        else
//       if Fchoix.Caption = 'Homonymie pour le Père' then
//           begin
//                datamodule1.fdQuerChoix.close;
//                datamodule1.fdQuerChoix.SQL.clear;
//                datamodule1.fdQuerChoix.SQL.add( 'SELECT idperson,nom,prenom,datnaiss as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
//                datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
//                datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.text;
//                datamodule1.fdQuerChoix.Open;
//                datamodule1.fdQuerChoix.first;
//                with fchoix.sgChoix do
//                  begin
//                      //j:=0;
//                      while not datamodule1.fdQuerChoix.Eof do
//                      begin
//                        j:=0;
//                        for k :=0 to datamodule1.fdQuerChoix.FieldCount-1 do
//                           begin
//                            Fchoix.sgChoix.cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
//                            Fchoix.sgChoix.cells[k,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
//                            Fchoix.sgChoix.cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
//                            Fchoix.sgChoix.cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
//
//                            datamodule1.fdQuerChoix.Next;
//                           end;
//                           inc(j);
//                      end;
//                  end;
//
//          end
//       else
//       if Fchoix.Caption = 'Homonymie pour la Mère' then
//          begin
//         		Fsaisie.lbMer.text :=  idNom;
//
//          end
//        else
//       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
//           begin
//         		Fsaisie.lbEpo2.text :=  idNom;
//
//
//              datamodule1.fdQuerChoix.close;
//              datamodule1.fdQuerChoix.SQL.clear;
//              datamodule1.fdQuerChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "",datnaiss) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
//              datamodule1.fdQuerChoix.ParamByName('Nom').AsString := UpperCase(Fsaisie.EdN2Epo.Text);
//              datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := UpperCase(Fsaisie.EdP2Epo.Text);
//              datamodule1.fdQuerChoix.Open;
//              datamodule1.fdQuerChoix.first;
//              j:=1;
//              while not datamodule1.fdQuerChoix.Eof do
//              begin
//        //
//        //                     //IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
//                Fchoix.sgChoix.cells[0,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
//                Fchoix.sgChoix.cells[1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
//                Fchoix.sgChoix.cells[2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
//                Fchoix.sgChoix.cells[3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
//                j:=j+1;
//                datamodule1.fdQuerChoix.Next;
//              end;
//              //Fsaisie.lbEpo2.text :=  idNom;
//           end;
//    end;
//    if Fchoix.lbChoix.Text='Maj' then
//    begin
//        if Fchoix.Caption = 'Homonymie de la Personne' then
//       	begin
//         		Fsaisie.lbInd.text:=  idNom;
//            Fchoix.Close;
//            //lbSelect.Caption:=idnom;
//          end
//       else
//       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
//           begin
//         		Fsaisie.lbEpo.text :=  idNom;
//            Fchoix.Close;
//            //lbSelect.Caption:=idnom;
//          end
//        else
//       if Fchoix.Caption = 'Homonymie pour le Père' then
//           begin
//         		Fsaisie.lbPer.text :=  idNom;
//            Fchoix.Close;
//            //lbSelect.Caption:=idnom;
//          end
//       else
//       if Fchoix.Caption = 'Homonymie pour la Mère' then
//          begin
//         		Fsaisie.lbMer.text :=  idNom;
//             Fchoix.Close;
//            //lbSelect.Caption:=idnom;
//          end
//        else
//       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
//           begin
//         		Fsaisie.lbEpo2.text :=  idNom;
//            Fchoix.Close;
//            //lbSelect.Caption:=idnom;
//          end;
//    end;
//   if Fchoix.lbChoix.Text='Arbre' then
//    begin
//        datamodule1.fdQuerChoix.close;
//        datamodule1.fdQuerChoix.SQL.clear;
//        datamodule1.fdQuerChoix.SQL.Text:= 'SELECT idperson,nom,prenom,datnaiss FROM personnes order by nom,prenom';
//        datamodule1.fdQuerChoix.Open;
//
//        cbDebArbre.Items.Clear();
//
//        cbDebArbre.Items.Add('');
//        cbDebArbre.ItemIndex := 0;
//        datamodule1.fdQuerChoix.first;
//      	while not datamodule1.fdQuerChoix.Eof do
//          begin
//              cbDebArbre.Items.Add(datamodule1.fdQuerChoix.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerChoix.FieldByName('prenom').AsString + ' -'+datamodule1.fdQuerChoix.FieldByName('idperson').AsString);
//              cbDebArbre.ItemIndex := datamodule1.fdQuerChoix.FieldByName('idPerson').AsInteger;
//
//               datamodule1.fdQuerChoix.Next;
//       	  end;
//        	cbDebArbre.selected.Text:='';
//          datamodule1.fdQuerChoix.close;
//    end;
  end;

procedure TFChoix.FormShow(Sender: TObject);
var
    k:integer;
begin
  if Fchoix.lbChoix.Text='Saisie' then
    begin
      if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		 datamodule1.fdQuerChoix.close;
             datamodule1.fdQuerChoix.SQL.clear;
             datamodule1.fdQuerChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "NC",datnaiss) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
             datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
             datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
             datamodule1.fdQuerChoix.Open;
             datamodule1.fdQuerChoix.first;
             with fchoix.sgChoix do
                  begin
                      //j:=0;
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        j:=0;
                        for k :=0 to datamodule1.fdQuerChoix.FieldCount-1 do
                           begin
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;

                            datamodule1.fdQuerChoix.Next;
                           end;
                           inc(j);
                      end;
                  end;
               datamodule1.fdQuerChoix.close;
               Fchoix.sgChoix.Columns[0].Width:=40;
               Fchoix.sgChoix.Columns[1].Width:=120;
               Fchoix.sgChoix.Columns[2].Width:=120;
               Fchoix.sgChoix.Columns[3].Width:=80;
               Fchoix.sgChoix.Visible:=True;
             // Fchoix.ReqChoix.Active:=False;
               Fchoix.lbNiv.Visible:=False;
               Fchoix.edNiv.Visible:=False;
               Fchoix.height:=250;
               Fchoix.Width:=500;
               Fchoix.ShowModal;
                 //MessageDlg ('il y a déjà des individus avec cette identité',mtInformation,[mbOK],0);

          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  idNom;

          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
                datamodule1.fdQuerChoix.close;
                datamodule1.fdQuerChoix.SQL.clear;
                datamodule1.fdQuerChoix.SQL.add( 'SELECT idperson,nom,prenom,datnaiss as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
                datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
                datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.text;
                datamodule1.fdQuerChoix.Open;
                datamodule1.fdQuerChoix.first;
                with fchoix.sgChoix do
                  begin
                      //j:=0;
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        j:=0;
                        for k :=0 to datamodule1.fdQuerChoix.FieldCount-1 do
                           begin
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;

                            datamodule1.fdQuerChoix.Next;
                           end;
                           inc(j);
                      end;
                  end;
               datamodule1.fdQuerChoix.close;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  idNom;

          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo2.text :=  idNom;


              datamodule1.fdQuerChoix.close;
              datamodule1.fdQuerChoix.SQL.clear;
              datamodule1.fdQuerChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "",datnaiss) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
              datamodule1.fdQuerChoix.ParamByName('Nom').AsString := UpperCase(Fsaisie.EdN2Epo.Text);
              datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := UpperCase(Fsaisie.EdP2Epo.Text);
              datamodule1.fdQuerChoix.Open;
              datamodule1.fdQuerChoix.first;
              j:=1;
              while not datamodule1.fdQuerChoix.Eof do
              begin
        //
        //                     //IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
                Fchoix.sgChoix.cells[0,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                Fchoix.sgChoix.cells[1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                Fchoix.sgChoix.cells[2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                Fchoix.sgChoix.cells[3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                j:=j+1;
                datamodule1.fdQuerChoix.Next;
              end;
              //Fsaisie.lbEpo2.text :=  idNom;
              datamodule1.fdQuerChoix.close;
           end;
    end;
    if Fchoix.lbChoix.Text='Maj' then
    begin
        if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  idNom;
             Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo2.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end;
    end;
   if Fchoix.lbChoix.Text='Arbre' then
    begin
        datamodule1.fdQuerChoix.close;
        datamodule1.fdQuerChoix.SQL.clear;
        datamodule1.fdQuerChoix.SQL.Text:= 'SELECT idperson,nom,prenom,datnaiss FROM personnes order by nom,prenom';
        datamodule1.fdQuerChoix.Open;

        cbDebArbre.Items.Clear();

        cbDebArbre.Items.Add('');
        cbDebArbre.ItemIndex := 0;
        datamodule1.fdQuerChoix.first;
      	while not datamodule1.fdQuerChoix.Eof do
          begin
              cbDebArbre.Items.Add(datamodule1.fdQuerChoix.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerChoix.FieldByName('prenom').AsString + ' -'+datamodule1.fdQuerChoix.FieldByName('idperson').AsString);
              cbDebArbre.ItemIndex := datamodule1.fdQuerChoix.FieldByName('idPerson').AsInteger;

               datamodule1.fdQuerChoix.Next;
       	  end;
        	cbDebArbre.selected.Text:='';
          datamodule1.fdQuerChoix.close;
    end;
end;

end.
