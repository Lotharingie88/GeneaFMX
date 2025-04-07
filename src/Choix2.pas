unit Choix2;

interface

uses
  Winapi.Windows, Winapi.Messages,System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.ListBox,udbgenea,firedac.stan.Param, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt,data.DB, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
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
    lbNom: TLabel;
    lbPren: TLabel;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btQuitClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btValidClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgChoixSelectCell(Sender: TObject; const ACol, ARow: Integer;
      var CanSelect: Boolean);
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
  idNom,Person:string;
procedure TFChoix.btNewClick(Sender: TObject);
begin
  if lbChoix.Text='Saisie' then
	begin
    if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  '-1';
            lbSelect.text:='-1';
            lbnom.Text:='';
            lbpren.Text:='';
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
         		Fmaj.lbEpo.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour le Père' then
           begin
         		Fmaj.lbPer.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour la Mère' then
          begin
         		Fmaj.lbMer.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)2' then
           begin
         		Fmaj.lbEpo2.text :=  '-1';
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
    t:integer;
begin
   if lbChoix.text='Saisie' then
   	begin
       // i:=sgChoix.Selection.Top ;
       //i:=sgChoix.Row;
       idNom:=sgChoix.selected.ToString();
       t:=sgChoix.Cells[0,idnom.ToInteger()].ToInteger();
       //ShowMessage ('IdNom :' + t.ToString );
       if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  t.ToString;
            //ShowMessage ('etape :' + '7' );
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  t.ToString;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  t.ToString;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  t.ToString;
             Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo2.text :=  t.ToString;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end;


       //close;
     end
     else
     if lbChoix.text='MAJ' then
     begin
       //i:=sgChoix.Selection.Top ;
       idNom:=sgChoix.selected.ToString();
       t:=sgChoix.Cells[0,idnom.ToInteger()].ToInteger();
       ShowMessage ('IdNom :' + t.ToString );
       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)' then
           begin
         		Fmaj.lbEpo.text :=  t.ToString;
            ShowMessage ('test :' + t.ToString );
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour le Père' then
           begin
         		Fmaj.lbPer.text :=  t.ToString;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour la Mère' then
          begin
            //ShowMessage ('IdNom :' + idNom);
         		Fmaj.lbMer.text :=  t.ToString;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
        else
        if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)2' then
           begin
         		Fmaj.lbEpo2.text :=  t.ToString;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end;



     end
     else
     if lbChoix.text='Arbre' then
     begin
             if edNiv.Text <>'' then
              begin
              farbre.edNivo.text:=edniv.text;
              Person := cbDebArbre.Selected.Text;

              datamodule1.fdQuerChoixPlus.close;
              datamodule1.fdQuerChoixPlus.SQL.clear;
              datamodule1.fdQuerChoixPlus.SQL.add( 'SELECT idperson,nom,prenom '
                +' FROM personnes where (nom||" "||prenom||" -"||idperson) = :indiv') ;

              datamodule1.fdQuerChoixPlus.ParamByName('indiv').AsString := Person;
              datamodule1.fdQuerChoixPlus.Open;
              indpers:=datamodule1.fdQuerChoixPlus.FieldByName('idperson').AsInteger;
              Farbre.edInd0.Text:= indpers.ToString;

              //t:=fchoix.edniv.Text.ToInteger();
              //Farbre.lbNiv.text:=t.ToString;
              Fchoix.Close;
              end
              else
              edniv.SetFocus;
     end;
     //fchoix.Close;
end;

procedure TFChoix.FormShow(Sender: TObject);
var
    k:integer;
begin
  if Fchoix.lbChoix.Text='Saisie' then
    begin
        sgChoix.Visible:=True;
        datamodule1.fdQuerChoix.close;
        datamodule1.fdQuerChoix.SQL.clear;
        datamodule1.fdQuerChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "NC",datnaiss) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
        datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
        datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
        datamodule1.fdQuerChoix.Open;
      if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
             datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
             datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
             datamodule1.fdQuerChoix.Open;
             datamodule1.fdQuerChoix.first;

             with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;

                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;

               sgChoix.Columns[0].Width:=40;
               sgChoix.Columns[1].Width:=120;
               sgChoix.Columns[2].Width:=120;
               sgChoix.Columns[3].Width:=80;


                 //MessageDlg ('il y a déjà des individus avec cette identité',mtInformation,[mbOK],0);

          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin

            datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
            datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
            datamodule1.fdQuerChoix.Open;
            datamodule1.fdQuerChoix.first;
            with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      //MessageDlg ('il y a déjà des individus avec cette identité',mtInformation,[mbOK],0);
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;

                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;

          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
                datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
                datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.text;
                datamodule1.fdQuerChoix.Open;
                datamodule1.fdQuerChoix.first;
                with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;

                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin

            datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
            datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
            datamodule1.fdQuerChoix.Open;
            datamodule1.fdQuerChoix.first;
            with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;

                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;

                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;



          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin

            datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
            datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
            datamodule1.fdQuerChoix.Open;
            datamodule1.fdQuerChoix.first;
            with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;

                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;
              
           end;
    end;
    if Fchoix.lbChoix.Text='MAJ' then
    begin
        sgChoix.Visible:=True;
        datamodule1.fdQuerChoix.close;
        datamodule1.fdQuerChoix.SQL.clear;
        datamodule1.fdQuerChoix.SQL.text:= 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "NC",datnaiss) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom';
        datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
        datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
        datamodule1.fdQuerChoix.Open;

        if Fchoix.Caption = 'MAJ-Homonymie de la Personne' then
       	begin
         		Fmaj.lbInd.text:=  idNom;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)' then
           begin

              datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
              datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
              datamodule1.fdQuerChoix.Open;
              datamodule1.fdQuerChoix.first;
              with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      ShowMessage ('r:' + rowcount.ToString);
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;
                            ShowMessage ('r2:' + rowcount.ToString);
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;

          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour le Père' then
           begin

            datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
            datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
            datamodule1.fdQuerChoix.Open;
            datamodule1.fdQuerChoix.first;
            with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      ShowMessage ('r3:' + rowcount.ToString);
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;
                            ShowMessage ('r4:' + rowcount.ToString);
                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;


          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour la Mère' then
          begin

            datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
            datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
            datamodule1.fdQuerChoix.Open;
            datamodule1.fdQuerChoix.first;
            with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;

                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;

          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)2' then
           begin

            datamodule1.fdQuerChoix.ParamByName('Nom').AsString := lbNom.Text;
            datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := lbPren.Text;
            datamodule1.fdQuerChoix.Open;
            datamodule1.fdQuerChoix.first;
            with sgChoix do
                  begin
                      j:=0;
                      rowcount:=datamodule1.fdQuerChoix.RecordCount;
                      while not datamodule1.fdQuerChoix.Eof do
                      begin
                        k:=0;

                            cells[k,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
                            cells[k+1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
                            cells[k+2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
                            cells[k+3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
                            datamodule1.fdQuerChoix.Next;
                            inc(j);
                      end;
                  end;

                               Fchoix.sgChoix.Visible:=True;
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
        	cbDebArbre.ItemIndex:=0;
          datamodule1.fdQuerChoix.close;
    end;
end;

procedure TFChoix.sgChoixSelectCell(Sender: TObject; const ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
    //idNom:=sgChoix.Selected.ToString;

end;

end.
