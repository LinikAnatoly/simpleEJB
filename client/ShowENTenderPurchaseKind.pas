
unit ShowENTenderPurchaseKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTenderPurchaseKindController, AdvObj ;


type
  TfrmENTenderPurchaseKindShow = class(TChildForm)  
  HTTPRIOENTenderPurchaseKind: THTTPRIO;
    ImageList1: TImageList;
    sgENTenderPurchaseKind: TAdvStringGrid;
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
procedure sgENTenderPurchaseKindTopLeftChanged(Sender: TObject);
procedure sgENTenderPurchaseKindDblClick(Sender: TObject);
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
 // ENTenderPurchaseKindObj: ENTenderPurchaseKind;
 // ENTenderPurchaseKindFilterObj: ENTenderPurchaseKindFilter;
  
  
implementation



{$R *.dfm}

var
  //frmENTenderPurchaseKindShow : TfrmENTenderPurchaseKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTenderPurchaseKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування виду закупівлі'
        );
   

procedure TfrmENTenderPurchaseKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      Self:=nil;
    inherited;
  end;


procedure TfrmENTenderPurchaseKindShow.FormShow(Sender: TObject);
var
  TempENTenderPurchaseKind: ENTenderPurchaseKindControllerSoapPort;
  i: Integer;
  ENTenderPurchaseKindList: ENTenderPurchaseKindShortList;
  begin
  SetGridHeaders(ENTenderPurchaseKindHeaders, sgENTenderPurchaseKind.ColumnHeaders);
  ColCount:=100;
  TempENTenderPurchaseKind :=  HTTPRIOENTenderPurchaseKind as ENTenderPurchaseKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTenderPurchaseKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTenderPurchaseKindList := TempENTenderPurchaseKind.getScrollableFilteredList(ENTenderPurchaseKindFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTenderPurchaseKindList.list);

  if LastCount > -1 then
     sgENTenderPurchaseKind.RowCount:=LastCount+2
  else
     sgENTenderPurchaseKind.RowCount:=2;

   with sgENTenderPurchaseKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTenderPurchaseKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTenderPurchaseKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTenderPurchaseKindList.list[i].name;
        LastRow:=i+1;
        sgENTenderPurchaseKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTenderPurchaseKind.Row:=1;
end;

procedure TfrmENTenderPurchaseKindShow.sgENTenderPurchaseKindTopLeftChanged(Sender: TObject);
var
  TempENTenderPurchaseKind: ENTenderPurchaseKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENTenderPurchaseKindList: ENTenderPurchaseKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTenderPurchaseKind.TopRow + sgENTenderPurchaseKind.VisibleRowCount) = ColCount
  then
    begin
      TempENTenderPurchaseKind :=  HTTPRIOENTenderPurchaseKind as ENTenderPurchaseKindControllerSoapPort;
      CurrentRow:=sgENTenderPurchaseKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTenderPurchaseKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTenderPurchaseKindList := TempENTenderPurchaseKind.getScrollableFilteredList(ENTenderPurchaseKindFilter(FilterObject),ColCount-1, 100);



  sgENTenderPurchaseKind.RowCount:=sgENTenderPurchaseKind.RowCount+100;
  LastCount:=High(ENTenderPurchaseKindList.list);
  with sgENTenderPurchaseKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTenderPurchaseKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTenderPurchaseKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTenderPurchaseKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTenderPurchaseKind.Row:=CurrentRow-5;
   sgENTenderPurchaseKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTenderPurchaseKindShow.sgENTenderPurchaseKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTenderPurchaseKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTenderPurchaseKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTenderPurchaseKind.RowCount-1 do
   for j:=0 to sgENTenderPurchaseKind.ColCount-1 do
     sgENTenderPurchaseKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTenderPurchaseKindShow.actViewExecute(Sender: TObject);
Var TempENTenderPurchaseKind: ENTenderPurchaseKindControllerSoapPort;
begin
{ TempENTenderPurchaseKind := HTTPRIOENTenderPurchaseKind as ENTenderPurchaseKindControllerSoapPort;
   try
     ENTenderPurchaseKindObj := TempENTenderPurchaseKind.getObject(StrToInt(sgENTenderPurchaseKind.Cells[0,sgENTenderPurchaseKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTenderPurchaseKindEdit:=TfrmENTenderPurchaseKindEdit.Create(Application, dsView);
  try
    frmENTenderPurchaseKindEdit.ShowModal;
  finally
    frmENTenderPurchaseKindEdit.Free;
    frmENTenderPurchaseKindEdit:=nil;
  end; }
end;

procedure TfrmENTenderPurchaseKindShow.actEditExecute(Sender: TObject);
Var TempENTenderPurchaseKind: ENTenderPurchaseKindControllerSoapPort;
begin
 {TempENTenderPurchaseKind := HTTPRIOENTenderPurchaseKind as ENTenderPurchaseKindControllerSoapPort;
   try
     ENTenderPurchaseKindObj := TempENTenderPurchaseKind.getObject(StrToInt(sgENTenderPurchaseKind.Cells[0,sgENTenderPurchaseKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTenderPurchaseKindEdit:=TfrmENTenderPurchaseKindEdit.Create(Application, dsEdit);
  try
    if frmENTenderPurchaseKindEdit.ShowModal= mrOk then
      begin
        //TempENTenderPurchaseKind.save(ENTenderPurchaseKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTenderPurchaseKindEdit.Free;
    frmENTenderPurchaseKindEdit:=nil;
  end;}
end;

procedure TfrmENTenderPurchaseKindShow.actDeleteExecute(Sender: TObject);
Var TempENTenderPurchaseKind: ENTenderPurchaseKindControllerSoapPort;
  ObjCode: Integer;
begin
 {TempENTenderPurchaseKind := HTTPRIOENTenderPurchaseKind as ENTenderPurchaseKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTenderPurchaseKind.Cells[0,sgENTenderPurchaseKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид закупівлі) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTenderPurchaseKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;}
end;

procedure TfrmENTenderPurchaseKindShow.actInsertExecute(Sender: TObject);
// Var TempENTenderPurchaseKind: ENTenderPurchaseKindControllerSoapPort; 
begin
  // TempENTenderPurchaseKind := HTTPRIOENTenderPurchaseKind as ENTenderPurchaseKindControllerSoapPort;  /// Это здесь уже лишнее!!!
{  ENTenderPurchaseKindObj:=ENTenderPurchaseKind.Create;



  try
    frmENTenderPurchaseKindEdit:=TfrmENTenderPurchaseKindEdit.Create(Application, dsInsert);
    try
      if frmENTenderPurchaseKindEdit.ShowModal = mrOk then
      begin
        if ENTenderPurchaseKindObj<>nil then
            UpdateGrid(Sender);
      end;
    finally
      frmENTenderPurchaseKindEdit.Free;
      frmENTenderPurchaseKindEdit:=nil;
    end;
  finally
    ENTenderPurchaseKindObj.Free;
  end; }
end;

procedure TfrmENTenderPurchaseKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTenderPurchaseKindShow.actFilterExecute(Sender: TObject);
begin
{frmENTenderPurchaseKindFilterEdit:=TfrmENTenderPurchaseKindFilterEdit.Create(Application, dsInsert);
  try
    ENTenderPurchaseKindFilterObj := ENTenderPurchaseKindFilter.Create;
    SetNullIntProps(ENTenderPurchaseKindFilterObj);
    SetNullXSProps(ENTenderPurchaseKindFilterObj);

    if frmENTenderPurchaseKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTenderPurchaseKindFilter.Create;
      FilterObject := ENTenderPurchaseKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTenderPurchaseKindFilterEdit.Free;
    frmENTenderPurchaseKindFilterEdit:=nil;
  end;}
end;

procedure TfrmENTenderPurchaseKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.