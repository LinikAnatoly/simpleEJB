unit GPSDataImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ChildFormUnit, StdCtrls, Buttons,DialogFormUnit,ComObj, Grids,
  BaseGrid, AdvGrid, ComCtrls , GridHeadersUnit , DateUtils, ActnList ,DMReportsUnit,
  ExtCtrls , ENTrafficGPSController, InvokeRegistry, Rio, SOAPHTTPClient  , XSBuiltIns , TKTransportRealController , TKTransportMarkController,
  AdvProgr;

type
  TfrmGPSDataImport = class(TDialogForm)
    dlgOpen: TOpenDialog;
    btnFile: TSpeedButton;
    edtFileName: TEdit;
    lbl1: TLabel;
    sgTransportItem: TAdvStringGrid;
    lbl2: TLabel;
    dtpDateStart: TDateTimePicker;
    dtpDateFinal: TDateTimePicker;
    lbl3: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    actlst1: TActionList;
    actInsert: TAction;
    pnlLegend: TPanel;
    shp1: TShape;
    lbl4: TLabel;
    HTTPRIOENTrafficGPS: THTTPRIO;
    lblCount: TLabel;
    advprgrs1: TAdvProgress;
    procedure btnFileClick(Sender: TObject);
    procedure addStrGrid(Const objectString: String; Const objectKod: String;Const objectName: String;Const objectDate: String;Const objectKm: String);
    procedure ClearGrid(Const Grid : TStringGrid);
    procedure actInsertExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
  countbadobject : Integer;
  end;

var
  frmGPSDataImport: TfrmGPSDataImport;
  ENTrafficGPSObjEdit: ENTrafficGPS;


   sgTransportItemHeaders: array [1..4] of String =
        (  'Назва транспорту'
          ,'Код транспорту'
          ,'Дата '
          ,'Показники пробігу'
        );

implementation

uses Math;

{$R *.dfm}

procedure TfrmGPSDataImport.btnFileClick(Sender: TObject);
var
        Excel: variant;
         i, j: word;
            S: string;
begin
    if dlgOpen.Execute then
    edtFileName.Text := dlgOpen.FileName;

     Excel := CreateOleObject('Excel.Application');
     Excel.Visible:=False;
     Excel.Workbooks.Open(edtFileName.Text);
     Excel.Cells.Select;
     Excel.Cells.EntireColumn.AutoFit;
     ClearGrid(sgTransportItem);
     SetGridHeaders(sgTransportItemHeaders, sgTransportItem.ColumnHeaders);
//     for i := 1 to 65536 do
        countbadobject:= 0;
       for i := 1 to 60000 do
        begin
          S := Excel.Sheets[1].Cells[i,1].Text;
          if  ( ( trim(Excel.Sheets[1].Cells[i,1].text) <> '' )
            or ( trim(Excel.Sheets[1].Cells[i,2].Text) <> '' )
            or ( trim(Excel.Sheets[1].Cells[i,4].Text) <> '' )
            or ( trim(Excel.Sheets[1].Cells[i,5].Text) <> '' )  ) then
          addStrGrid( Excel.Sheets[1].Cells[i,1].text  + ' | ' +
                      Excel.Sheets[1].Cells[i,2].Text + ' | ' +
                      Excel.Sheets[1].Cells[i,3].Text + ' | ' +
                      Excel.Sheets[1].Cells[i,4].Text + ' | ' +
                      Excel.Sheets[1].Cells[i,5].Text
           ,
           Excel.Sheets[1].Cells[i,2].Text , Excel.Sheets[1].Cells[i,4].Text , Excel.Sheets[1].Cells[i,1].Text  , Excel.Sheets[1].Cells[i,5].Text );
          if trim(Excel.Sheets[1].Cells[i,1].Text) = 'Всего' then
          break;
        end;

     if countbadobject <> 0 then
     begin
      pnlLegend.Visible:= True;
      lblCount.Caption:= 'Кількість невідомого одиниць транспорту : ' + intToStr(countbadobject);
     end;

    // Excel.Workbooks.Close(false, '', False, LCID);
    // Excel.Quit;
    // Excel.Workbooks.free;

    Excel.DisplayAlerts := False; 
    Excel.Quit;
    Excel:=Unassigned;




end;

 procedure TfrmGPSDataImport.addStrGrid(Const objectString: String; Const objectKod: String;Const objectName: String;Const objectDate: String;Const objectKm: String);
 var
   St: String;
   vobjDate : TDate;
  //  Location: PChar;
 begin
       // строка объекта
       if  StrPos( PChar(objectString) , PChar('Объект:') ) <>  nil then
       begin
          sgTransportItem.Cells[0,sgTransportItem.RowCount - 1 ]:=  objectName;
          // если нет сопоставления их кодов с нашим транспортом тогда обозначаем это
          if DMReports.searchAutoRealbyCodeAutoGPS(objectKod) > 0.00000001 then
          sgTransportItem.AddCheckBox(0, sgTransportItem.RowCount - 1, true, false)
          else
           begin
           sgTransportItem.RowColor[sgTransportItem.RowCount - 1] := clSilver;
           sgTransportItem.AddCheckBox(0, sgTransportItem.RowCount - 1, False, false);
           sgTransportItem.ReadOnly[0 , sgTransportItem.RowCount - 1 ]:= True;
           countbadobject := countbadobject + 1 
           end;




          sgTransportItem.Cells[1,sgTransportItem.RowCount - 1 ]:=  objectKod;
          sgTransportItem.RowCount:=sgTransportItem.RowCount + 1;
       end;
       // строка показаний на дату
         try
         vobjDate := StrToDate(objectDate);
         except;
         vobjDate:= 0;
         end;
       if vobjDate <> 0 then
        begin
         if ((vobjDate >= Trunc(dtpDateStart.Date)) and (vobjDate <= Trunc(dtpDateFinal.Date)))  then
         begin
            sgTransportItem.Cells[2,sgTransportItem.RowCount - 1 ]:=  objectDate;
            sgTransportItem.Cells[3,sgTransportItem.RowCount - 1 ]:=  objectKm;
            sgTransportItem.RowCount:=sgTransportItem.RowCount + 1;
         end;
        end;


 end;

 procedure TfrmGPSDataImport.ClearGrid(Const Grid : TStringGrid);
var
  i : Integer;
begin
  for i := Grid.FixedRows to Grid.RowCount - 1 do begin
    Grid.Rows[i].Clear;
  end;
  Grid.RowCount := Grid.FixedRows + 1;
end;

procedure TfrmGPSDataImport.actInsertExecute(Sender: TObject);
var
  str : string;
begin

   str:= 'sdf';


end;

procedure TfrmGPSDataImport.FormClose(Sender: TObject;
  var Action: TCloseAction);

Var
TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
i , j : Integer;
transportrealcode  , pp : Integer;
isSel  , state_ : Boolean;
trafFilter : ENTrafficGPSFilter;
trafArr : ENTrafficGPSController.ArrayOfInteger;
tktransportmarkobj : tktransportmark;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin
    TempENTrafficGPS := HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;

      i:= 1;
    pp := sgTransportItem.RowCount ;
    while i <= {1000000} {to} sgTransportItem.RowCount  do
     begin
       advprgrs1.Position:= Round(100*i/pp);
       isSel := False;
      // если в ячейке чекнуто то присваиваем реал транспорт
       sgTransportItem.GetCheckBoxState(0,i,state_);
         if ((state_ ) and (trim(sgTransportItem.Cells[1, i]) <> '')) then
       begin
         isSel := true;
       end;
      if isSel = True then
         transportrealcode :=  DMReports.searchAutoRealbyCodeAutoGPS(sgTransportItem.Cells[1, i])
      else
         transportrealcode := 0;
      if transportrealcode > 0.00000001 then
         begin
           ENTrafficGPSObjEdit:=ENTrafficGPS.Create;
           // для транспорта вставить данные по пробегу по датам попавшим в импорт (первая строка)
              Inc(i);
              if trim(sgTransportItem.Cells[2, i]) <> '' then
               begin
                ENTrafficGPSObjEdit.realTransport := TKTransportReal.Create();
                ENTrafficGPSObjEdit.realTransport.code := transportrealcode;
                ENTrafficGPSObjEdit.dateGen:= TXSDate.Create;
                ENTrafficGPSObjEdit.dateGen.XSToNative(GetXSDate( StrToDate(sgTransportItem.Cells[2, i])));
                ENTrafficGPSObjEdit.sumKm:= TXSDecimal.Create;
                ENTrafficGPSObjEdit.sumKm.DecimalString := (sgTransportItem.cells[3,i]);
                ENTrafficGPSObjEdit.sumFuel:= TXSDecimal.Create;
                tktransportmarkobj := DMReports.getTransportmarkByrealtransportcode(transportrealcode);
                if ((tktransportmarkobj <> nil) and (ENTrafficGPSObjEdit.sumKm.DecimalString <> '0')) then
                ENTrafficGPSObjEdit.sumFuel.DecimalString:= FloatToStr( (StrToFloat(tktransportmarkobj.rashodProbeg.DecimalString) / 100 ) * strToFloat(ENTrafficGPSObjEdit.sumKm.DecimalString))
                else
                ENTrafficGPSObjEdit.sumFuel.DecimalString:= '0';
                // перед  вставкой выкосим запись если такая уже есть по реал транспорту и дате .
                 trafFilter :=  ENTrafficGPSFilter.Create;
                 SetNullIntProps(trafFilter);
                 SetNullXSProps(trafFilter);
                 trafFilter.dateGen := TXSDate.Create;
                 trafFilter.dateGen.XSToNative(GetXSDate( StrToDate(sgTransportItem.Cells[2, i])));
                 trafFilter.realTransport:= TKTransportReal.Create();
                 trafFilter.realTransport.code := transportrealcode;
                 trafArr :=  TempENTrafficGPS.getScrollableFilteredCodeArray(trafFilter, 0, -1);
                 if High(trafArr) > -1 then
                    TempENTrafficGPS.remove(trafArr[0]);
                TempENTrafficGPS.add(ENTrafficGPSObjEdit);
               end;
              Inc(i);
              j:= i;
              while j <= 100000 do  // инсерт последующих строк для выбраного транспорта
              begin
                if  ((sgTransportItem.Cells[0, j] = '') and (sgTransportItem.Cells[2, j] <> '')) then
                 begin
                  if trim(sgTransportItem.Cells[2, j]) <> '' then
                  begin
                    ENTrafficGPSObjEdit:=ENTrafficGPS.Create;
                    ENTrafficGPSObjEdit.realTransport := TKTransportReal.Create();
                    ENTrafficGPSObjEdit.realTransport.code := transportrealcode;
                    ENTrafficGPSObjEdit.dateGen:= TXSDate.Create;
                    ENTrafficGPSObjEdit.dateGen.XSToNative(GetXSDate( StrToDate(sgTransportItem.Cells[2, j])));
                    ENTrafficGPSObjEdit.sumKm:= TXSDecimal.Create;
                    ENTrafficGPSObjEdit.sumKm.DecimalString := (sgTransportItem.cells[3,j]);
                    ENTrafficGPSObjEdit.sumFuel:= TXSDecimal.Create;
                    tktransportmarkobj := DMReports.getTransportmarkByrealtransportcode(transportrealcode);
                    if ((tktransportmarkobj <> nil) and (ENTrafficGPSObjEdit.sumKm.DecimalString <> '0')) then
                    ENTrafficGPSObjEdit.sumFuel.DecimalString:= FloatToStr( (StrToFloat(tktransportmarkobj.rashodProbeg.DecimalString) / 100 ) * strToFloat(ENTrafficGPSObjEdit.sumKm.DecimalString))
                    else
                    ENTrafficGPSObjEdit.sumFuel.DecimalString:= '0';
                    // перед  вставкой выкосим запись если такая уже есть по реал транспорту и дате .
                     trafFilter :=  ENTrafficGPSFilter.Create;
                     SetNullIntProps(trafFilter);
                     SetNullXSProps(trafFilter);
                     trafFilter.dateGen := TXSDate.Create;
                     trafFilter.dateGen.XSToNative(GetXSDate( StrToDate(sgTransportItem.Cells[2, j])));
                     trafFilter.realTransport:= TKTransportReal.Create();
                     trafFilter.realTransport.code := transportrealcode;
                     trafArr :=  TempENTrafficGPS.getScrollableFilteredCodeArray(trafFilter, 0, -1);
                     if High(trafArr) > -1 then
                        TempENTrafficGPS.remove(trafArr[0]);

                    TempENTrafficGPS.add(ENTrafficGPSObjEdit);
                   end; 

                  if sgTransportItem.Cells[1, j] <> '' then
                   Break
                  else
                   begin
                    Inc(j);
                    Inc(i);
                   end;
                 end
                else j := 100001;
              end;

         end
        else
         Inc(i);

        if ((sgTransportItem.Cells[0, i] = '') and (sgTransportItem.Cells[1, i] = '') and (sgTransportItem.Cells[2, i] = '') and (sgTransportItem.Cells[3, i] = '') ) then
        i:=  1000000 + 1;
     end;




  end;
end;

end.
