
unit ShowFINDoc2FKOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINDoc2FKOrderController ;


type
  TfrmFINDoc2FKOrderShow = class(TChildForm)  
  HTTPRIOFINDoc2FKOrder: THTTPRIO;
    ImageList1: TImageList;
    sgFINDoc2FKOrder: TAdvStringGrid;
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
procedure sgFINDoc2FKOrderTopLeftChanged(Sender: TObject);
procedure sgFINDoc2FKOrderDblClick(Sender: TObject);
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
 // FINDoc2FKOrderObj: FINDoc2FKOrder;
 // FINDoc2FKOrderFilterObj: FINDoc2FKOrderFilter;
  
  
implementation

uses Main, EditFINDoc2FKOrder, EditFINDoc2FKOrderFilter;


{$R *.dfm}

var
  //frmFINDoc2FKOrderShow : TfrmFINDoc2FKOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINDoc2FKOrderHeaders: array [1..3] of String =
        ( 'Код'
          ,'код документа в ФК'
          ,'PK код Договора в ФК'
        );
   

procedure TfrmFINDoc2FKOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINDoc2FKOrderShow:=nil;
    inherited;
  end;


procedure TfrmFINDoc2FKOrderShow.FormShow(Sender: TObject);
var
  TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
  i: Integer;
  FINDoc2FKOrderList: FINDoc2FKOrderShortList;
  begin
  SetGridHeaders(FINDoc2FKOrderHeaders, sgFINDoc2FKOrder.ColumnHeaders);
  ColCount:=100;
  TempFINDoc2FKOrder :=  HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINDoc2FKOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINDoc2FKOrderList := TempFINDoc2FKOrder.getScrollableFilteredList(FINDoc2FKOrderFilter(FilterObject),0,ColCount);


  LastCount:=High(FINDoc2FKOrderList.list);

  if LastCount > -1 then
     sgFINDoc2FKOrder.RowCount:=LastCount+2
  else
     sgFINDoc2FKOrder.RowCount:=2;

   with sgFINDoc2FKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINDoc2FKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINDoc2FKOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        if FINDoc2FKOrderList.list[i].finDocCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(FINDoc2FKOrderList.list[i].finDocCode);
        if FINDoc2FKOrderList.list[i].finDocCodeContract = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(FINDoc2FKOrderList.list[i].finDocCodeContract);
        LastRow:=i+1;
        sgFINDoc2FKOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINDoc2FKOrder.Row:=1;
end;

procedure TfrmFINDoc2FKOrderShow.sgFINDoc2FKOrderTopLeftChanged(Sender: TObject);
var
  TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
  i,CurrentRow: Integer;
  FINDoc2FKOrderList: FINDoc2FKOrderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINDoc2FKOrder.TopRow + sgFINDoc2FKOrder.VisibleRowCount) = ColCount
  then
    begin
      TempFINDoc2FKOrder :=  HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
      CurrentRow:=sgFINDoc2FKOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINDoc2FKOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINDoc2FKOrderList := TempFINDoc2FKOrder.getScrollableFilteredList(FINDoc2FKOrderFilter(FilterObject),ColCount-1, 100);



  sgFINDoc2FKOrder.RowCount:=sgFINDoc2FKOrder.RowCount+100;
  LastCount:=High(FINDoc2FKOrderList.list);
  with sgFINDoc2FKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINDoc2FKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINDoc2FKOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if FINDoc2FKOrderList.list[i].finDocCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(FINDoc2FKOrderList.list[i].finDocCode);
        if FINDoc2FKOrderList.list[i].finDocCodeContract = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(FINDoc2FKOrderList.list[i].finDocCodeContract);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINDoc2FKOrder.Row:=CurrentRow-5;
   sgFINDoc2FKOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINDoc2FKOrderShow.sgFINDoc2FKOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINDoc2FKOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINDoc2FKOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINDoc2FKOrder.RowCount-1 do
   for j:=0 to sgFINDoc2FKOrder.ColCount-1 do
     sgFINDoc2FKOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINDoc2FKOrderShow.actViewExecute(Sender: TObject);
Var TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
begin
 TempFINDoc2FKOrder := HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
   try
     FINDoc2FKOrderObj := TempFINDoc2FKOrder.getObject(StrToInt(sgFINDoc2FKOrder.Cells[0,sgFINDoc2FKOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINDoc2FKOrderEdit:=TfrmFINDoc2FKOrderEdit.Create(Application, dsView);
  try
    frmFINDoc2FKOrderEdit.ShowModal;
  finally
    frmFINDoc2FKOrderEdit.Free;
    frmFINDoc2FKOrderEdit:=nil;
  end;
end;

procedure TfrmFINDoc2FKOrderShow.actEditExecute(Sender: TObject);
Var TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
begin
 TempFINDoc2FKOrder := HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
   try
     FINDoc2FKOrderObj := TempFINDoc2FKOrder.getObject(StrToInt(sgFINDoc2FKOrder.Cells[0,sgFINDoc2FKOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINDoc2FKOrderEdit:=TfrmFINDoc2FKOrderEdit.Create(Application, dsEdit);
  try
    if frmFINDoc2FKOrderEdit.ShowModal= mrOk then
      begin
        //TempFINDoc2FKOrder.save(FINDoc2FKOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINDoc2FKOrderEdit.Free;
    frmFINDoc2FKOrderEdit:=nil;
  end;
end;

procedure TfrmFINDoc2FKOrderShow.actDeleteExecute(Sender: TObject);
Var TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINDoc2FKOrder := HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINDoc2FKOrder.Cells[0,sgFINDoc2FKOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв"язок документів з ФК з Прибутк/видатк ордером) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINDoc2FKOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINDoc2FKOrderShow.actInsertExecute(Sender: TObject);
Var TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
begin
  TempFINDoc2FKOrder := HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
  FINDoc2FKOrderObj:=FINDoc2FKOrder.Create;



  try
    frmFINDoc2FKOrderEdit:=TfrmFINDoc2FKOrderEdit.Create(Application, dsInsert);
    try
      if frmFINDoc2FKOrderEdit.ShowModal = mrOk then
      begin
        if FINDoc2FKOrderObj<>nil then
            //TempFINDoc2FKOrder.add(FINDoc2FKOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINDoc2FKOrderEdit.Free;
      frmFINDoc2FKOrderEdit:=nil;
    end;
  finally
    FINDoc2FKOrderObj.Free;
  end;
end;

procedure TfrmFINDoc2FKOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINDoc2FKOrderShow.actFilterExecute(Sender: TObject);
begin
{frmFINDoc2FKOrderFilterEdit:=TfrmFINDoc2FKOrderFilterEdit.Create(Application, dsEdit);
  try
    FINDoc2FKOrderFilterObj := FINDoc2FKOrderFilter.Create;
    SetNullIntProps(FINDoc2FKOrderFilterObj);
    SetNullXSProps(FINDoc2FKOrderFilterObj);

    if frmFINDoc2FKOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINDoc2FKOrderFilter.Create;
      FilterObject := FINDoc2FKOrderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINDoc2FKOrderFilterEdit.Free;
    frmFINDoc2FKOrderFilterEdit:=nil;
  end;}
end;

procedure TfrmFINDoc2FKOrderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.