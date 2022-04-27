
unit ShowENTrafficGPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTrafficGPSController, ShowENTrptGPS2TrptReal , ENTrptGPS2TrptRealController ;


type
  TfrmENTrafficGPSShow = class(TChildForm)  
  HTTPRIOENTrafficGPS: THTTPRIO;
    ImageList1: TImageList;
    sgENTrafficGPS: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btnSprtransp: TToolButton;
    actSprtransp: TAction;
    HTTPRIOENTrptGPS2TrptReal: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTrafficGPSTopLeftChanged(Sender: TObject);
procedure sgENTrafficGPSDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSprtranspExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

 // var
//  ENTrafficGPSObj: ENTrafficGPS;

 // ENTrafficGPSFilterObj: ENTrafficGPSFilter;
  
  
implementation

uses Main, EditENTrafficGPS, EditENTrafficGPSFilter, GPSDataImport,
  EditENTrptGPS2TrptReal ;
// , ShowENTrafficGPS;


{$R *.dfm}

var
 // frmENTrafficGPSShow : TfrmENTrafficGPSShow;

  frmENTrptGPS2TrptRealShow: TfrmENTrptGPS2TrptRealShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTrafficGPSHeaders: array [1..5] of String =
        ( 'Код'
          ,'Транспорт'
          ,'Дата'
          ,'Значение километры в день'
          ,'Сумарный расход по километражу по норме расхода топлива '
        );
   

procedure TfrmENTrafficGPSShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTrafficGPSShow:=nil;
    inherited;
  end;


procedure TfrmENTrafficGPSShow.FormShow(Sender: TObject);
var
  TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
  i: Integer;
  ENTrafficGPSList: ENTrafficGPSShortList;
  begin
  SetGridHeaders(ENTrafficGPSHeaders, sgENTrafficGPS.ColumnHeaders);
  ColCount:=100;
  TempENTrafficGPS :=  HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTrafficGPSFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTrafficGPSList := TempENTrafficGPS.getScrollableFilteredList(ENTrafficGPSFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTrafficGPSList.list);

  if LastCount > -1 then
     sgENTrafficGPS.RowCount:=LastCount+2
  else
     sgENTrafficGPS.RowCount:=2;

   with sgENTrafficGPS do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTrafficGPSList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTrafficGPSList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTrafficGPSList.list[i].realTransportName  + ' (' + ENTrafficGPSList.list[i].realTransportGosNumber + ')'  ;
        if ENTrafficGPSList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTrafficGPSList.list[i].dateGen);
        if ENTrafficGPSList.list[i].sumKm = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENTrafficGPSList.list[i].sumKm.DecimalString;
        if ENTrafficGPSList.list[i].sumFuel = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTrafficGPSList.list[i].sumFuel.DecimalString;
        LastRow:=i+1;
        sgENTrafficGPS.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTrafficGPS.Row:=1;
end;

procedure TfrmENTrafficGPSShow.sgENTrafficGPSTopLeftChanged(Sender: TObject);
var
  TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
  i,CurrentRow: Integer;
  ENTrafficGPSList: ENTrafficGPSShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTrafficGPS.TopRow + sgENTrafficGPS.VisibleRowCount) = ColCount
  then
    begin
      TempENTrafficGPS :=  HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;
      CurrentRow:=sgENTrafficGPS.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTrafficGPSFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTrafficGPSList := TempENTrafficGPS.getScrollableFilteredList(ENTrafficGPSFilter(FilterObject),ColCount-1, 100);



  sgENTrafficGPS.RowCount:=sgENTrafficGPS.RowCount+100;
  LastCount:=High(ENTrafficGPSList.list);
  with sgENTrafficGPS do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTrafficGPSList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTrafficGPSList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTrafficGPSList.list[i].realTransportName  + ' (' + ENTrafficGPSList.list[i].realTransportGosNumber + ')'  ;
        if ENTrafficGPSList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENTrafficGPSList.list[i].dateGen);
        if ENTrafficGPSList.list[i].sumKm = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENTrafficGPSList.list[i].sumKm.DecimalString;
        if ENTrafficGPSList.list[i].sumFuel = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENTrafficGPSList.list[i].sumFuel.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTrafficGPS.Row:=CurrentRow-5;
   sgENTrafficGPS.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTrafficGPSShow.sgENTrafficGPSDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTrafficGPS,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTrafficGPSShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTrafficGPS.RowCount-1 do
   for j:=0 to sgENTrafficGPS.ColCount-1 do
     sgENTrafficGPS.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTrafficGPSShow.actViewExecute(Sender: TObject);
Var TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
begin
 TempENTrafficGPS := HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;
   try
    ENTrafficGPSObj:= TempENTrafficGPS.getObject(StrToInt(sgENTrafficGPS.Cells[0,sgENTrafficGPS.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTrafficGPSEdit:=TfrmENTrafficGPSEdit.Create(Application, dsView);
  try
    frmENTrafficGPSEdit.ShowModal;
  finally
    frmENTrafficGPSEdit.Free;
    frmENTrafficGPSEdit:=nil;
  end;
end;

procedure TfrmENTrafficGPSShow.actEditExecute(Sender: TObject);
Var TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
begin
 TempENTrafficGPS := HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;
   try
     ENTrafficGPSObj := TempENTrafficGPS.getObject(StrToInt(sgENTrafficGPS.Cells[0,sgENTrafficGPS.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTrafficGPSEdit:=TfrmENTrafficGPSEdit.Create(Application, dsView);
  try
    if frmENTrafficGPSEdit.ShowModal= mrOk then
      begin
        //TempENTrafficGPS.save(ENTrafficGPSObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTrafficGPSEdit.Free;
    frmENTrafficGPSEdit:=nil;
  end;
end;

procedure TfrmENTrafficGPSShow.actDeleteExecute(Sender: TObject);
Var TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTrafficGPS := HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTrafficGPS.Cells[0,sgENTrafficGPS.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Движение машин по GPS по дням ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTrafficGPS.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTrafficGPSShow.actInsertExecute(Sender: TObject);
Var TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
begin
  {TempENTrafficGPS := HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;
  ENTrafficGPSObj:=ENTrafficGPS.Create;

   //ENTrafficGPSObj.dateGen:= TXSDate.Create;
   //ENTrafficGPSObj.sumKm:= TXSDecimal.Create;
   //ENTrafficGPSObj.sumFuel:= TXSDecimal.Create;


  try
    frmENTrafficGPSEdit:=TfrmENTrafficGPSEdit.Create(Application, dsInsert);
    try
      if frmENTrafficGPSEdit.ShowModal = mrOk then
      begin
        if ENTrafficGPSObj<>nil then
            //TempENTrafficGPS.add(ENTrafficGPSObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTrafficGPSEdit.Free;
      frmENTrafficGPSEdit:=nil;
    end;
  finally
    ENTrafficGPSObj.Free;
  end;  }

  try
    frmGPSDataImport := TfrmGPSDataImport.Create(Application,dsInsert);
     try if frmGPSDataImport.ShowModal = mrOk then
     begin
           if ENTrafficGPSObjEdit<>nil then
              UpdateGrid(Sender);
     end;
     finally
      frmGPSDataImport.Free;
      frmGPSDataImport:=nil;
     end;
   finally
    ENTrafficGPSObjEdit.Free;
  end;
end;

procedure TfrmENTrafficGPSShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTrafficGPSShow.actFilterExecute(Sender: TObject);
begin
frmENTrafficGPSFilterEdit:=TfrmENTrafficGPSFilterEdit.Create(Application, dsInsert);
  try
    ENTrafficGPSFilterObj := ENTrafficGPSFilter.Create;
    SetNullIntProps(ENTrafficGPSFilterObj);
    SetNullXSProps(ENTrafficGPSFilterObj);

    if frmENTrafficGPSFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTrafficGPSFilter.Create;
      FilterObject := ENTrafficGPSFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTrafficGPSFilterEdit.Free;
    frmENTrafficGPSFilterEdit:=nil;
  end;
end;

procedure TfrmENTrafficGPSShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENTrafficGPSShow.actSprtranspExecute(Sender: TObject);
begin
 // if not Assigned(frmENTrptGPS2TrptRealShow) then
       frmENTrptGPS2TrptRealShow := TfrmENTrptGPS2TrptRealShow.Create(Application,fmChild);
       frmENTrptGPS2TrptRealShow.Show;
 end; 

end.
