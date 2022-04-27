
unit ShowRQPurchaseItemType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPurchaseItemTypeController, AdvObj ;


type
  TfrmRQPurchaseItemTypeShow = class(TChildForm)
  HTTPRIORQPurchaseItemType: THTTPRIO;
    ImageList1: TImageList;
    sgRQPurchaseItemType: TAdvStringGrid;
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
procedure sgRQPurchaseItemTypeTopLeftChanged(Sender: TObject);
procedure sgRQPurchaseItemTypeDblClick(Sender: TObject);
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
 // RQPurchaseItemTypeObj: RQPurchaseItemType;
 // RQPurchaseItemTypeFilterObj: RQPurchaseItemTypeFilter;
  
  
implementation

uses Main, EditRQPurchaseItemType, EditRQPurchaseItemTypeFilter;


{$R *.dfm}

var
  //frmRQPurchaseItemTypeShow : TfrmRQPurchaseItemTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPurchaseItemTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmRQPurchaseItemTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPurchaseItemTypeShow:=nil;
    inherited;
  end;


procedure TfrmRQPurchaseItemTypeShow.FormShow(Sender: TObject);
var
  TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort;
  i: Integer;
  RQPurchaseItemTypeList: RQPurchaseItemTypeShortList;
  begin
  SetGridHeaders(RQPurchaseItemTypeHeaders, sgRQPurchaseItemType.ColumnHeaders);
  ColCount:=100;
  TempRQPurchaseItemType :=  HTTPRIORQPurchaseItemType as RQPurchaseItemTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemTypeList := TempRQPurchaseItemType.getScrollableFilteredList(RQPurchaseItemTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPurchaseItemTypeList.list);

  if LastCount > -1 then
     sgRQPurchaseItemType.RowCount:=LastCount+2
  else
     sgRQPurchaseItemType.RowCount:=2;

   with sgRQPurchaseItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPurchaseItemTypeList.list[i].name;
        LastRow:=i+1;
        sgRQPurchaseItemType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPurchaseItemType.Row:=1;
end;

procedure TfrmRQPurchaseItemTypeShow.sgRQPurchaseItemTypeTopLeftChanged(Sender: TObject);
var
  TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQPurchaseItemTypeList: RQPurchaseItemTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPurchaseItemType.TopRow + sgRQPurchaseItemType.VisibleRowCount) = ColCount
  then
    begin
      TempRQPurchaseItemType :=  HTTPRIORQPurchaseItemType as RQPurchaseItemTypeControllerSoapPort;
      CurrentRow:=sgRQPurchaseItemType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemTypeList := TempRQPurchaseItemType.getScrollableFilteredList(RQPurchaseItemTypeFilter(FilterObject),ColCount-1, 100);



  sgRQPurchaseItemType.RowCount:=sgRQPurchaseItemType.RowCount+100;
  LastCount:=High(RQPurchaseItemTypeList.list);
  with sgRQPurchaseItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPurchaseItemTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPurchaseItemTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPurchaseItemType.Row:=CurrentRow-5;
   sgRQPurchaseItemType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPurchaseItemTypeShow.sgRQPurchaseItemTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPurchaseItemType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPurchaseItemTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPurchaseItemType.RowCount-1 do
   for j:=0 to sgRQPurchaseItemType.ColCount-1 do
     sgRQPurchaseItemType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPurchaseItemTypeShow.actViewExecute(Sender: TObject);
Var TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort;
begin
 TempRQPurchaseItemType := HTTPRIORQPurchaseItemType as RQPurchaseItemTypeControllerSoapPort;
   try
     RQPurchaseItemTypeObj := TempRQPurchaseItemType.getObject(StrToInt(sgRQPurchaseItemType.Cells[0,sgRQPurchaseItemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemTypeEdit:=TfrmRQPurchaseItemTypeEdit.Create(Application, dsView);
  try
    frmRQPurchaseItemTypeEdit.ShowModal;
  finally
    frmRQPurchaseItemTypeEdit.Free;
    frmRQPurchaseItemTypeEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItemTypeShow.actEditExecute(Sender: TObject);
Var TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort;
begin
 TempRQPurchaseItemType := HTTPRIORQPurchaseItemType as RQPurchaseItemTypeControllerSoapPort;
   try
     RQPurchaseItemTypeObj := TempRQPurchaseItemType.getObject(StrToInt(sgRQPurchaseItemType.Cells[0,sgRQPurchaseItemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemTypeEdit:=TfrmRQPurchaseItemTypeEdit.Create(Application, dsEdit);
  try
    if frmRQPurchaseItemTypeEdit.ShowModal= mrOk then
      begin
        //TempRQPurchaseItemType.save(RQPurchaseItemTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPurchaseItemTypeEdit.Free;
    frmRQPurchaseItemTypeEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItemTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPurchaseItemType := HTTPRIORQPurchaseItemType as RQPurchaseItemTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPurchaseItemType.Cells[0,sgRQPurchaseItemType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип закупок(Материалы/услуги или Работы)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItemType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPurchaseItemTypeShow.actInsertExecute(Sender: TObject);
// Var TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort; 
begin
  // TempRQPurchaseItemType := HTTPRIORQPurchaseItemType as RQPurchaseItemTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPurchaseItemTypeObj:=RQPurchaseItemType.Create;



  try
    frmRQPurchaseItemTypeEdit:=TfrmRQPurchaseItemTypeEdit.Create(Application, dsInsert);
    try
      if frmRQPurchaseItemTypeEdit.ShowModal = mrOk then
      begin
        if RQPurchaseItemTypeObj<>nil then
            //TempRQPurchaseItemType.add(RQPurchaseItemTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPurchaseItemTypeEdit.Free;
      frmRQPurchaseItemTypeEdit:=nil;
    end;
  finally
    RQPurchaseItemTypeObj.Free;
  end;
end;

procedure TfrmRQPurchaseItemTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPurchaseItemTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQPurchaseItemTypeFilterEdit:=TfrmRQPurchaseItemTypeFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemTypeFilterObj := RQPurchaseItemTypeFilter.Create;
    SetNullIntProps(RQPurchaseItemTypeFilterObj);
    SetNullXSProps(RQPurchaseItemTypeFilterObj);

    if frmRQPurchaseItemTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPurchaseItemTypeFilter.Create;
      FilterObject := RQPurchaseItemTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPurchaseItemTypeFilterEdit.Free;
    frmRQPurchaseItemTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPurchaseItemTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.