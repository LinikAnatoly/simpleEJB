
unit ShowENServicesObject2PaymentSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesObject2PaymentScheduleController ;


type
  TfrmENServicesObject2PaymentScheduleShow = class(TChildForm)  
  HTTPRIOENServicesObject2PaymentSchedule: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesObject2PaymentSchedule: TAdvStringGrid;
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
procedure sgENServicesObject2PaymentScheduleTopLeftChanged(Sender: TObject);
procedure sgENServicesObject2PaymentScheduleDblClick(Sender: TObject);
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
 // ENServicesObject2PaymentScheduleObj: ENServicesObject2PaymentSchedule;
 // ENServicesObject2PaymentScheduleFilterObj: ENServicesObject2PaymentScheduleFilter;
  
  
implementation

uses Main, EditENServicesObject2PaymentSchedule, EditENServicesObject2PaymentScheduleFilter;


{$R *.dfm}

var
  //frmENServicesObject2PaymentScheduleShow : TfrmENServicesObject2PaymentScheduleShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesObject2PaymentScheduleHeaders: array [1..4] of String =
        ( 'Код'
          ,'оплата з'
          ,'оплата з'
          ,'сума оплати'
        );
   

procedure TfrmENServicesObject2PaymentScheduleShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENServicesObject2PaymentScheduleShow:=nil;
    inherited;
  end;


procedure TfrmENServicesObject2PaymentScheduleShow.FormShow(Sender: TObject);
var
  TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
  i: Integer;
  ENServicesObject2PaymentScheduleList: ENServicesObject2PaymentScheduleShortList;
  begin
  SetGridHeaders(ENServicesObject2PaymentScheduleHeaders, sgENServicesObject2PaymentSchedule.ColumnHeaders);
  ColCount:=100;
  TempENServicesObject2PaymentSchedule :=  HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObject2PaymentScheduleFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesObject2PaymentScheduleList := TempENServicesObject2PaymentSchedule.getScrollableFilteredList(ENServicesObject2PaymentScheduleFilter(FilterObject),0,ColCount);


  LastCount:=High(ENServicesObject2PaymentScheduleList.list);

  if LastCount > -1 then
     sgENServicesObject2PaymentSchedule.RowCount:=LastCount+2
  else
     sgENServicesObject2PaymentSchedule.RowCount:=2;

   with sgENServicesObject2PaymentSchedule do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObject2PaymentScheduleList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObject2PaymentScheduleList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENServicesObject2PaymentScheduleList.list[i].startDate = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENServicesObject2PaymentScheduleList.list[i].startDate);
        if ENServicesObject2PaymentScheduleList.list[i].endDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObject2PaymentScheduleList.list[i].endDate);
        if ENServicesObject2PaymentScheduleList.list[i].paySum = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENServicesObject2PaymentScheduleList.list[i].paySum.DecimalString;
        LastRow:=i+1;
        sgENServicesObject2PaymentSchedule.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesObject2PaymentSchedule.Row:=1;
end;

procedure TfrmENServicesObject2PaymentScheduleShow.sgENServicesObject2PaymentScheduleTopLeftChanged(Sender: TObject);
var
  TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesObject2PaymentScheduleList: ENServicesObject2PaymentScheduleShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServicesObject2PaymentSchedule.TopRow + sgENServicesObject2PaymentSchedule.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesObject2PaymentSchedule :=  HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
      CurrentRow:=sgENServicesObject2PaymentSchedule.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObject2PaymentScheduleFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesObject2PaymentScheduleList := TempENServicesObject2PaymentSchedule.getScrollableFilteredList(ENServicesObject2PaymentScheduleFilter(FilterObject),ColCount-1, 100);



  sgENServicesObject2PaymentSchedule.RowCount:=sgENServicesObject2PaymentSchedule.RowCount+100;
  LastCount:=High(ENServicesObject2PaymentScheduleList.list);
  with sgENServicesObject2PaymentSchedule do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObject2PaymentScheduleList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesObject2PaymentScheduleList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENServicesObject2PaymentScheduleList.list[i].startDate = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENServicesObject2PaymentScheduleList.list[i].startDate);
        if ENServicesObject2PaymentScheduleList.list[i].endDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObject2PaymentScheduleList.list[i].endDate);
        if ENServicesObject2PaymentScheduleList.list[i].paySum = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENServicesObject2PaymentScheduleList.list[i].paySum.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesObject2PaymentSchedule.Row:=CurrentRow-5;
   sgENServicesObject2PaymentSchedule.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesObject2PaymentScheduleShow.sgENServicesObject2PaymentScheduleDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServicesObject2PaymentSchedule,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENServicesObject2PaymentScheduleShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesObject2PaymentSchedule.RowCount-1 do
   for j:=0 to sgENServicesObject2PaymentSchedule.ColCount-1 do
     sgENServicesObject2PaymentSchedule.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesObject2PaymentScheduleShow.actViewExecute(Sender: TObject);
Var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
begin
 TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
   try
     ENServicesObject2PaymentScheduleObj := TempENServicesObject2PaymentSchedule.getObject(StrToInt(sgENServicesObject2PaymentSchedule.Cells[0,sgENServicesObject2PaymentSchedule.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesObject2PaymentScheduleEdit:=TfrmENServicesObject2PaymentScheduleEdit.Create(Application, dsView);
  try
    frmENServicesObject2PaymentScheduleEdit.ShowModal;
  finally
    frmENServicesObject2PaymentScheduleEdit.Free;
    frmENServicesObject2PaymentScheduleEdit:=nil;
  end;
end;

procedure TfrmENServicesObject2PaymentScheduleShow.actEditExecute(Sender: TObject);
Var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
begin
 TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
   try
     ENServicesObject2PaymentScheduleObj := TempENServicesObject2PaymentSchedule.getObject(StrToInt(sgENServicesObject2PaymentSchedule.Cells[0,sgENServicesObject2PaymentSchedule.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesObject2PaymentScheduleEdit:=TfrmENServicesObject2PaymentScheduleEdit.Create(Application, dsEdit);
  try
    if frmENServicesObject2PaymentScheduleEdit.ShowModal= mrOk then
      begin
        //TempENServicesObject2PaymentSchedule.save(ENServicesObject2PaymentScheduleObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServicesObject2PaymentScheduleEdit.Free;
    frmENServicesObject2PaymentScheduleEdit:=nil;
  end;
end;

procedure TfrmENServicesObject2PaymentScheduleShow.actDeleteExecute(Sender: TObject);
Var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesObject2PaymentSchedule.Cells[0,sgENServicesObject2PaymentSchedule.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Графік платежів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesObject2PaymentSchedule.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesObject2PaymentScheduleShow.actInsertExecute(Sender: TObject);
// Var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort; 
begin
  // TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServicesObject2PaymentScheduleObj:=ENServicesObject2PaymentSchedule.Create;

   //ENServicesObject2PaymentScheduleObj.startDate:= TXSDate.Create;
   //ENServicesObject2PaymentScheduleObj.endDate:= TXSDate.Create;
   //ENServicesObject2PaymentScheduleObj.paySum:= TXSDecimal.Create;


  try
    frmENServicesObject2PaymentScheduleEdit:=TfrmENServicesObject2PaymentScheduleEdit.Create(Application, dsInsert);
    try
      if frmENServicesObject2PaymentScheduleEdit.ShowModal = mrOk then
      begin
        if ENServicesObject2PaymentScheduleObj<>nil then
            //TempENServicesObject2PaymentSchedule.add(ENServicesObject2PaymentScheduleObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServicesObject2PaymentScheduleEdit.Free;
      frmENServicesObject2PaymentScheduleEdit:=nil;
    end;
  finally
    ENServicesObject2PaymentScheduleObj.Free;
  end;
end;

procedure TfrmENServicesObject2PaymentScheduleShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesObject2PaymentScheduleShow.actFilterExecute(Sender: TObject);
begin
{frmENServicesObject2PaymentScheduleFilterEdit:=TfrmENServicesObject2PaymentScheduleFilterEdit.Create(Application, dsInsert);
  try
    ENServicesObject2PaymentScheduleFilterObj := ENServicesObject2PaymentScheduleFilter.Create;
    SetNullIntProps(ENServicesObject2PaymentScheduleFilterObj);
    SetNullXSProps(ENServicesObject2PaymentScheduleFilterObj);

    if frmENServicesObject2PaymentScheduleFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENServicesObject2PaymentScheduleFilter.Create;
      FilterObject := ENServicesObject2PaymentScheduleFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesObject2PaymentScheduleFilterEdit.Free;
    frmENServicesObject2PaymentScheduleFilterEdit:=nil;
  end;}
end;

procedure TfrmENServicesObject2PaymentScheduleShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.