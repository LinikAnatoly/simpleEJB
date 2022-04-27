
unit ShowENTransportTemperature;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportTemperatureController, AdvObj ;


type
  TfrmENTransportTemperatureShow = class(TChildForm)  
  HTTPRIOENTransportTemperature: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportTemperature: TAdvStringGrid;
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

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTransportTemperatureTopLeftChanged(Sender: TObject);
procedure sgENTransportTemperatureDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENTransportTemperatureObj: ENTransportTemperature;
 // ENTransportTemperatureFilterObj: ENTransportTemperatureFilter;
  
  
implementation

uses Main, EditENTransportTemperature, EditENTransportTemperatureFilter;


{$R *.dfm}

var
  //frmENTransportTemperatureShow : TfrmENTransportTemperatureShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportTemperatureHeaders: array [1..6] of String =
        ( 'Код'
          ,'Транспортний підрозділ'
          ,'Середньодобове значення температури'
          ,'Дата'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENTransportTemperatureShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportTemperatureShow:=nil;
    inherited;
  end;


procedure TfrmENTransportTemperatureShow.FormShow(Sender: TObject);
var
  TempENTransportTemperature: ENTransportTemperatureControllerSoapPort;
  i: Integer;
  ENTransportTemperatureList: ENTransportTemperatureShortList;
  begin
  SetGridHeaders(ENTransportTemperatureHeaders, sgENTransportTemperature.ColumnHeaders);
  ColCount:=100;
  TempENTransportTemperature :=  HTTPRIOENTransportTemperature as ENTransportTemperatureControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportTemperatureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportTemperatureFilter(FilterObject).orderBySQL := 'entransporttemperature.dategen desc';

  ENTransportTemperatureList := TempENTransportTemperature.getScrollableFilteredList(ENTransportTemperatureFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportTemperatureList.list);

  if LastCount > -1 then
     sgENTransportTemperature.RowCount:=LastCount+2
  else
     sgENTransportTemperature.RowCount:=2;

   with sgENTransportTemperature do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportTemperatureList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportTemperatureList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENTransportTemperatureList.list[i].transportDepartmentRefName;

        if ENTransportTemperatureList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENTransportTemperatureList.list[i].countGen.DecimalString;
        if ENTransportTemperatureList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENTransportTemperatureList.list[i].dateGen);
        Cells[4,i+1] := ENTransportTemperatureList.list[i].userGen;
        if ENTransportTemperatureList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENTransportTemperatureList.list[i].dateEdit);
        LastRow:=i+1;
        sgENTransportTemperature.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportTemperature.Row:=1;
end;

procedure TfrmENTransportTemperatureShow.sgENTransportTemperatureTopLeftChanged(Sender: TObject);
var
  TempENTransportTemperature: ENTransportTemperatureControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportTemperatureList: ENTransportTemperatureShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportTemperature.TopRow + sgENTransportTemperature.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportTemperature :=  HTTPRIOENTransportTemperature as ENTransportTemperatureControllerSoapPort;
      CurrentRow:=sgENTransportTemperature.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportTemperatureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportTemperatureList := TempENTransportTemperature.getScrollableFilteredList(ENTransportTemperatureFilter(FilterObject),ColCount-1, 100);



  sgENTransportTemperature.RowCount:=sgENTransportTemperature.RowCount+100;
  LastCount:=High(ENTransportTemperatureList.list);
  with sgENTransportTemperature do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportTemperatureList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportTemperatureList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENTransportTemperatureList.list[i].transportDepartmentRefName;

        if ENTransportTemperatureList.list[i].countGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENTransportTemperatureList.list[i].countGen.DecimalString;
        if ENTransportTemperatureList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENTransportTemperatureList.list[i].dateGen);
        Cells[4,i+CurrentRow] := ENTransportTemperatureList.list[i].userGen;
        if ENTransportTemperatureList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENTransportTemperatureList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportTemperature.Row:=CurrentRow-5;
   sgENTransportTemperature.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportTemperatureShow.sgENTransportTemperatureDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportTemperature,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportTemperatureShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportTemperature.RowCount-1 do
   for j:=0 to sgENTransportTemperature.ColCount-1 do
     sgENTransportTemperature.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportTemperatureShow.actViewExecute(Sender: TObject);
Var TempENTransportTemperature: ENTransportTemperatureControllerSoapPort;
begin
 TempENTransportTemperature := HTTPRIOENTransportTemperature as ENTransportTemperatureControllerSoapPort;
   try
     ENTransportTemperatureObj := TempENTransportTemperature.getObject(StrToInt(sgENTransportTemperature.Cells[0,sgENTransportTemperature.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportTemperatureEdit:=TfrmENTransportTemperatureEdit.Create(Application, dsView);
  try
    frmENTransportTemperatureEdit.ShowModal;
  finally
    frmENTransportTemperatureEdit.Free;
    frmENTransportTemperatureEdit:=nil;
  end;
end;

procedure TfrmENTransportTemperatureShow.actEditExecute(Sender: TObject);
Var TempENTransportTemperature: ENTransportTemperatureControllerSoapPort;
begin
 TempENTransportTemperature := HTTPRIOENTransportTemperature as ENTransportTemperatureControllerSoapPort;
   try
     ENTransportTemperatureObj := TempENTransportTemperature.getObject(StrToInt(sgENTransportTemperature.Cells[0,sgENTransportTemperature.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportTemperatureEdit:=TfrmENTransportTemperatureEdit.Create(Application, dsEdit);
  try
    if frmENTransportTemperatureEdit.ShowModal= mrOk then
      begin
        //TempENTransportTemperature.save(ENTransportTemperatureObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportTemperatureEdit.Free;
    frmENTransportTemperatureEdit:=nil;
  end;
end;

procedure TfrmENTransportTemperatureShow.actDeleteExecute(Sender: TObject);
Var TempENTransportTemperature: ENTransportTemperatureControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportTemperature := HTTPRIOENTransportTemperature as ENTransportTemperatureControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportTemperature.Cells[0,sgENTransportTemperature.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Середньоденна температура в транспортних підрозділах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportTemperature.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportTemperatureShow.actInsertExecute(Sender: TObject);
// Var TempENTransportTemperature: ENTransportTemperatureControllerSoapPort; 
begin
  // TempENTransportTemperature := HTTPRIOENTransportTemperature as ENTransportTemperatureControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTransportTemperatureObj:=ENTransportTemperature.Create;

   //ENTransportTemperatureObj.countGen:= TXSDecimal.Create;
   //ENTransportTemperatureObj.dateGen:= TXSDate.Create;
   //ENTransportTemperatureObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENTransportTemperatureEdit:=TfrmENTransportTemperatureEdit.Create(Application, dsInsert);
    try
      if frmENTransportTemperatureEdit.ShowModal = mrOk then
      begin
        if ENTransportTemperatureObj<>nil then
            //TempENTransportTemperature.add(ENTransportTemperatureObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportTemperatureEdit.Free;
      frmENTransportTemperatureEdit:=nil;
    end;
  finally
    ENTransportTemperatureObj.Free;
  end;
end;

procedure TfrmENTransportTemperatureShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportTemperatureShow.actFilterExecute(Sender: TObject);
begin
frmENTransportTemperatureFilterEdit:=TfrmENTransportTemperatureFilterEdit.Create(Application, dsInsert);
  try
    ENTransportTemperatureFilterObj := ENTransportTemperatureFilter.Create;
    SetNullIntProps(ENTransportTemperatureFilterObj);
    SetNullXSProps(ENTransportTemperatureFilterObj);

    if frmENTransportTemperatureFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENTransportTemperatureFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportTemperatureFilterEdit.Free;
    frmENTransportTemperatureFilterEdit:=nil;
  end;
end;

procedure TfrmENTransportTemperatureShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.