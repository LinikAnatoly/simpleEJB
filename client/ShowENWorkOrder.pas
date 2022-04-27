
unit ShowENWorkOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWorkOrderController ;


type
  TfrmENWorkOrderShow = class(TChildForm)  
  HTTPRIOENWorkOrder: THTTPRIO;
    ImageList1: TImageList;
    sgENWorkOrder: TAdvStringGrid;
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
procedure sgENWorkOrderTopLeftChanged(Sender: TObject);
procedure sgENWorkOrderDblClick(Sender: TObject);
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
 // ENWorkOrderObj: ENWorkOrder;
 // ENWorkOrderFilterObj: ENWorkOrderFilter;
  
  
implementation

uses Main, EditENWorkOrder, EditENWorkOrderFilter;


{$R *.dfm}

var
  //frmENWorkOrderShow : TfrmENWorkOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWorkOrderHeaders: array [1..7] of String =
        ( 'Код'
          ,'Номер наряд-завдання'
          ,'Дата наряд завдання'
          ,'ФИО мола с фин.кол.'
          ,'ФИО механіка с фін.кол.'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENWorkOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWorkOrderShow:=nil;
    inherited;
  end;


procedure TfrmENWorkOrderShow.FormShow(Sender: TObject);
var
  TempENWorkOrder: ENWorkOrderControllerSoapPort;
  i: Integer;
  ENWorkOrderList: ENWorkOrderShortList;
  begin
  SetGridHeaders(ENWorkOrderHeaders, sgENWorkOrder.ColumnHeaders);
  ColCount:=100;
  TempENWorkOrder :=  HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderList := TempENWorkOrder.getScrollableFilteredList(ENWorkOrderFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWorkOrderList.list);

  if LastCount > -1 then
     sgENWorkOrder.RowCount:=LastCount+2
  else
     sgENWorkOrder.RowCount:=2;

   with sgENWorkOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWorkOrderList.list[i].workOrderNumber;
        if ENWorkOrderList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENWorkOrderList.list[i].dateGen);
        Cells[3,i+1] := ENWorkOrderList.list[i].finMolName;
        Cells[4,i+1] := ENWorkOrderList.list[i].finMechanicName;
        Cells[5,i+1] := ENWorkOrderList.list[i].userGen;
        if ENWorkOrderList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENWorkOrderList.list[i].dateEdit);
        LastRow:=i+1;
        sgENWorkOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWorkOrder.Row:=1;
end;

procedure TfrmENWorkOrderShow.sgENWorkOrderTopLeftChanged(Sender: TObject);
var
  TempENWorkOrder: ENWorkOrderControllerSoapPort;
  i,CurrentRow: Integer;
  ENWorkOrderList: ENWorkOrderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWorkOrder.TopRow + sgENWorkOrder.VisibleRowCount) = ColCount
  then
    begin
      TempENWorkOrder :=  HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;
      CurrentRow:=sgENWorkOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderList := TempENWorkOrder.getScrollableFilteredList(ENWorkOrderFilter(FilterObject),ColCount-1, 100);



  sgENWorkOrder.RowCount:=sgENWorkOrder.RowCount+100;
  LastCount:=High(ENWorkOrderList.list);
  with sgENWorkOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWorkOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWorkOrderList.list[i].workOrderNumber;
        if ENWorkOrderList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENWorkOrderList.list[i].dateGen);
        Cells[3,i+CurrentRow] := ENWorkOrderList.list[i].finMolName;
        Cells[4,i+CurrentRow] := ENWorkOrderList.list[i].finMechanicName;
        Cells[5,i+CurrentRow] := ENWorkOrderList.list[i].userGen;
        if ENWorkOrderList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENWorkOrderList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWorkOrder.Row:=CurrentRow-5;
   sgENWorkOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWorkOrderShow.sgENWorkOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWorkOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWorkOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWorkOrder.RowCount-1 do
   for j:=0 to sgENWorkOrder.ColCount-1 do
     sgENWorkOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWorkOrderShow.actViewExecute(Sender: TObject);
Var TempENWorkOrder: ENWorkOrderControllerSoapPort;
begin
 TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;
   try
     ENWorkOrderObj := TempENWorkOrder.getObject(StrToInt(sgENWorkOrder.Cells[0,sgENWorkOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderEdit:=TfrmENWorkOrderEdit.Create(Application, dsView);
  try
    frmENWorkOrderEdit.ShowModal;
  finally
    frmENWorkOrderEdit.Free;
    frmENWorkOrderEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderShow.actEditExecute(Sender: TObject);
Var TempENWorkOrder: ENWorkOrderControllerSoapPort;
begin
 TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;
   try
     ENWorkOrderObj := TempENWorkOrder.getObject(StrToInt(sgENWorkOrder.Cells[0,sgENWorkOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderEdit:=TfrmENWorkOrderEdit.Create(Application, dsEdit);
  try
    if frmENWorkOrderEdit.ShowModal= mrOk then
      begin
        //TempENWorkOrder.save(ENWorkOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWorkOrderEdit.Free;
    frmENWorkOrderEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderShow.actDeleteExecute(Sender: TObject);
Var TempENWorkOrder: ENWorkOrderControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWorkOrder.Cells[0,sgENWorkOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Наряд-завдання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWorkOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWorkOrderShow.actInsertExecute(Sender: TObject);
Var TempENWorkOrder: ENWorkOrderControllerSoapPort;
begin
  TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;
  ENWorkOrderObj:=ENWorkOrder.Create;

   ENWorkOrderObj.dateGen:= TXSDate.Create;
   ENWorkOrderObj.dateEdit:= TXSDate.Create;


  try
    frmENWorkOrderEdit:=TfrmENWorkOrderEdit.Create(Application, dsInsert);
    try
      if frmENWorkOrderEdit.ShowModal = mrOk then
      begin
        if ENWorkOrderObj<>nil then
            //TempENWorkOrder.add(ENWorkOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWorkOrderEdit.Free;
      frmENWorkOrderEdit:=nil;
    end;
  finally
    ENWorkOrderObj.Free;
  end;
end;

procedure TfrmENWorkOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWorkOrderShow.actFilterExecute(Sender: TObject);
begin
{frmENWorkOrderFilterEdit:=TfrmENWorkOrderFilterEdit.Create(Application, dsEdit);
  try
    ENWorkOrderFilterObj := ENWorkOrderFilter.Create;
    SetNullIntProps(ENWorkOrderFilterObj);
    SetNullXSProps(ENWorkOrderFilterObj);

    if frmENWorkOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWorkOrderFilter.Create;
      FilterObject := ENWorkOrderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWorkOrderFilterEdit.Free;
    frmENWorkOrderFilterEdit:=nil;
  end;}
end;

procedure TfrmENWorkOrderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.