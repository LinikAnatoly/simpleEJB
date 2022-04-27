
unit ShowSCOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCOrderController, AdvObj ;


type
  TfrmSCOrderShow = class(TChildForm)  
  HTTPRIOSCOrder: THTTPRIO;
    ImageList1: TImageList;
    sgSCOrder: TAdvStringGrid;
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
procedure sgSCOrderTopLeftChanged(Sender: TObject);
procedure sgSCOrderDblClick(Sender: TObject);
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

var
 frmSCOrderShow : TfrmSCOrderShow;
 // SCOrderObj: SCOrder;
 // SCOrderFilterObj: SCOrderFilter;
  
  
implementation

uses Main, EditSCOrder, EditSCOrderFilter;


{$R *.dfm}

var
  //frmSCOrderShow : TfrmSCOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCOrderHeaders: array [1..6] of String =
        ( 'Код'
          , 'Тип лічильника'
          ,'код МВО'
          ,'код Підрозділу'
          ,'кількість'
          ,'код з SC'
        );
   

procedure TfrmSCOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCOrderShow:=nil;
    inherited;
  end;


procedure TfrmSCOrderShow.FormShow(Sender: TObject);
var
  TempSCOrder: SCOrderControllerSoapPort;
  i: Integer;
  SCOrderList: SCOrderShortList;
  begin
  SetGridHeaders(SCOrderHeaders, sgSCOrder.ColumnHeaders);
  ColCount:=100;
  TempSCOrder :=  HTTPRIOSCOrder as SCOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCOrderList := TempSCOrder.getScrollableFilteredList(SCOrderFilter(FilterObject),0,ColCount);


  LastCount:=High(SCOrderList.list);

  if LastCount > -1 then
     sgSCOrder.RowCount:=LastCount+2
  else
     sgSCOrder.RowCount:=2;

   // !!!!!!!!!!!! менять поля аккуратно !!!!
   // юзаются данные из ГРИДа в TfrmMaterialsRQFKOrderOutSCCounterEdit
   with sgSCOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCOrderList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := SCOrderList.list[i].invoiceRefCounterType;

        Cells[2,i+1] := SCOrderList.list[i].molCode;
        Cells[3,i+1] := SCOrderList.list[i].podrCode;
        if SCOrderList.list[i].countGen = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(SCOrderList.list[i].countGen);
        if SCOrderList.list[i].scCode = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(SCOrderList.list[i].scCode);
        LastRow:=i+1;
        sgSCOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCOrder.Row:=1;
end;

procedure TfrmSCOrderShow.sgSCOrderTopLeftChanged(Sender: TObject);
var
  TempSCOrder: SCOrderControllerSoapPort;
  i,CurrentRow: Integer;
  SCOrderList: SCOrderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCOrder.TopRow + sgSCOrder.VisibleRowCount) = ColCount
  then
    begin
      TempSCOrder :=  HTTPRIOSCOrder as SCOrderControllerSoapPort;
      CurrentRow:=sgSCOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCOrderList := TempSCOrder.getScrollableFilteredList(SCOrderFilter(FilterObject),ColCount-1, 100);



  sgSCOrder.RowCount:=sgSCOrder.RowCount+100;
  LastCount:=High(SCOrderList.list);
  with sgSCOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := SCOrderList.list[i].invoiceRefCounterType;

        Cells[2,i+CurrentRow] := SCOrderList.list[i].molCode;
        Cells[3,i+CurrentRow] := SCOrderList.list[i].podrCode;
        if SCOrderList.list[i].countGen = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(SCOrderList.list[i].countGen);
        if SCOrderList.list[i].scCode = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(SCOrderList.list[i].scCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCOrder.Row:=CurrentRow-5;
   sgSCOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCOrderShow.sgSCOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCOrder.RowCount-1 do
   for j:=0 to sgSCOrder.ColCount-1 do
     sgSCOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCOrderShow.actViewExecute(Sender: TObject);
Var TempSCOrder: SCOrderControllerSoapPort;
begin
 TempSCOrder := HTTPRIOSCOrder as SCOrderControllerSoapPort;
   try
     SCOrderObj := TempSCOrder.getObject(StrToInt(sgSCOrder.Cells[0,sgSCOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCOrderEdit:=TfrmSCOrderEdit.Create(Application, dsView);
  try
    frmSCOrderEdit.ShowModal;
  finally
    frmSCOrderEdit.Free;
    frmSCOrderEdit:=nil;
  end;
end;

procedure TfrmSCOrderShow.actEditExecute(Sender: TObject);
Var TempSCOrder: SCOrderControllerSoapPort;
begin
 TempSCOrder := HTTPRIOSCOrder as SCOrderControllerSoapPort;
   try
     SCOrderObj := TempSCOrder.getObject(StrToInt(sgSCOrder.Cells[0,sgSCOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCOrderEdit:=TfrmSCOrderEdit.Create(Application, dsEdit);
  try
    if frmSCOrderEdit.ShowModal= mrOk then
      begin
        //TempSCOrder.save(SCOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCOrderEdit.Free;
    frmSCOrderEdit:=nil;
  end;
end;

procedure TfrmSCOrderShow.actDeleteExecute(Sender: TObject);
Var TempSCOrder: SCOrderControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCOrder := HTTPRIOSCOrder as SCOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCOrder.Cells[0,sgSCOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Рознарядка для ScanCounters) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCOrderShow.actInsertExecute(Sender: TObject);
Var TempSCOrder: SCOrderControllerSoapPort;
begin
  TempSCOrder := HTTPRIOSCOrder as SCOrderControllerSoapPort;
  SCOrderObj:=SCOrder.Create;



  try
    frmSCOrderEdit:=TfrmSCOrderEdit.Create(Application, dsInsert);
    try
      if frmSCOrderEdit.ShowModal = mrOk then
      begin
        if SCOrderObj<>nil then
            //TempSCOrder.add(SCOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCOrderEdit.Free;
      frmSCOrderEdit:=nil;
    end;
  finally
    SCOrderObj.Free;
  end;
end;

procedure TfrmSCOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCOrderShow.actFilterExecute(Sender: TObject);
begin
{frmSCOrderFilterEdit:=TfrmSCOrderFilterEdit.Create(Application, dsInsert);
  try
    SCOrderFilterObj := SCOrderFilter.Create;
    SetNullIntProps(SCOrderFilterObj);
    SetNullXSProps(SCOrderFilterObj);

    if frmSCOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCOrderFilter.Create;
      FilterObject := SCOrderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCOrderFilterEdit.Free;
    frmSCOrderFilterEdit:=nil;
  end;}
end;

procedure TfrmSCOrderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.