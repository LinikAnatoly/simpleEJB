
unit ShowENEstimateItemKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENEstimateItemKindController ;


type
  TfrmENEstimateItemKindShow = class(TChildForm)  
  HTTPRIOENEstimateItemKind: THTTPRIO;
    ImageList1: TImageList;
    sgENEstimateItemKind: TAdvStringGrid;
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
procedure sgENEstimateItemKindTopLeftChanged(Sender: TObject);
procedure sgENEstimateItemKindDblClick(Sender: TObject);
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
 // ENEstimateItemKindObj: ENEstimateItemKind;
 // ENEstimateItemKindFilterObj: ENEstimateItemKindFilter;
  
  
implementation

uses Main, EditENEstimateItemKind, EditENEstimateItemKindFilter;


{$R *.dfm}

var
  //frmENEstimateItemKindShow : TfrmENEstimateItemKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENEstimateItemKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип строки кошторису'
        );
   

procedure TfrmENEstimateItemKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEstimateItemKindShow:=nil;
    inherited;
  end;


procedure TfrmENEstimateItemKindShow.FormShow(Sender: TObject);
var
  TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
  i: Integer;
  ENEstimateItemKindList: ENEstimateItemKindShortList;
  begin
  SetGridHeaders(ENEstimateItemKindHeaders, sgENEstimateItemKind.ColumnHeaders);
  ColCount:=100;
  TempENEstimateItemKind :=  HTTPRIOENEstimateItemKind as ENEstimateItemKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemKindList := TempENEstimateItemKind.getScrollableFilteredList(ENEstimateItemKindFilter(FilterObject),0,ColCount);


  LastCount:=High(ENEstimateItemKindList.list);

  if LastCount > -1 then
     sgENEstimateItemKind.RowCount:=LastCount+2
  else
     sgENEstimateItemKind.RowCount:=2;

   with sgENEstimateItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENEstimateItemKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENEstimateItemKindList.list[i].name;
        LastRow:=i+1;
        sgENEstimateItemKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENEstimateItemKind.Row:=1;
end;

procedure TfrmENEstimateItemKindShow.sgENEstimateItemKindTopLeftChanged(Sender: TObject);
var
  TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENEstimateItemKindList: ENEstimateItemKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENEstimateItemKind.TopRow + sgENEstimateItemKind.VisibleRowCount) = ColCount
  then
    begin
      TempENEstimateItemKind :=  HTTPRIOENEstimateItemKind as ENEstimateItemKindControllerSoapPort;
      CurrentRow:=sgENEstimateItemKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemKindList := TempENEstimateItemKind.getScrollableFilteredList(ENEstimateItemKindFilter(FilterObject),ColCount-1, 100);



  sgENEstimateItemKind.RowCount:=sgENEstimateItemKind.RowCount+100;
  LastCount:=High(ENEstimateItemKindList.list);
  with sgENEstimateItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENEstimateItemKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENEstimateItemKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENEstimateItemKind.Row:=CurrentRow-5;
   sgENEstimateItemKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEstimateItemKindShow.sgENEstimateItemKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENEstimateItemKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEstimateItemKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENEstimateItemKind.RowCount-1 do
   for j:=0 to sgENEstimateItemKind.ColCount-1 do
     sgENEstimateItemKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEstimateItemKindShow.actViewExecute(Sender: TObject);
Var TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
begin
 TempENEstimateItemKind := HTTPRIOENEstimateItemKind as ENEstimateItemKindControllerSoapPort;
   try
     ENEstimateItemKindObj := TempENEstimateItemKind.getObject(StrToInt(sgENEstimateItemKind.Cells[0,sgENEstimateItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemKindEdit:=TfrmENEstimateItemKindEdit.Create(Application, dsView);
  try
    frmENEstimateItemKindEdit.ShowModal;
  finally
    frmENEstimateItemKindEdit.Free;
    frmENEstimateItemKindEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemKindShow.actEditExecute(Sender: TObject);
Var TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
begin
 TempENEstimateItemKind := HTTPRIOENEstimateItemKind as ENEstimateItemKindControllerSoapPort;
   try
     ENEstimateItemKindObj := TempENEstimateItemKind.getObject(StrToInt(sgENEstimateItemKind.Cells[0,sgENEstimateItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemKindEdit:=TfrmENEstimateItemKindEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemKindEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItemKind.save(ENEstimateItemKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENEstimateItemKindEdit.Free;
    frmENEstimateItemKindEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemKindShow.actDeleteExecute(Sender: TObject);
Var TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENEstimateItemKind := HTTPRIOENEstimateItemKind as ENEstimateItemKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENEstimateItemKind.Cells[0,sgENEstimateItemKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид строки кошторису(матеріали, ПММ (ГСМ))) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENEstimateItemKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEstimateItemKindShow.actInsertExecute(Sender: TObject);
Var TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
begin
  TempENEstimateItemKind := HTTPRIOENEstimateItemKind as ENEstimateItemKindControllerSoapPort;
  ENEstimateItemKindObj:=ENEstimateItemKind.Create;



  try
    frmENEstimateItemKindEdit:=TfrmENEstimateItemKindEdit.Create(Application, dsInsert);
    try
      if frmENEstimateItemKindEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemKindObj<>nil then
            //TempENEstimateItemKind.add(ENEstimateItemKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemKindEdit.Free;
      frmENEstimateItemKindEdit:=nil;
    end;
  finally
    ENEstimateItemKindObj.Free;
  end;
end;

procedure TfrmENEstimateItemKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEstimateItemKindShow.actFilterExecute(Sender: TObject);
begin
{frmENEstimateItemKindFilterEdit:=TfrmENEstimateItemKindFilterEdit.Create(Application, dsEdit);
  try
    ENEstimateItemKindFilterObj := ENEstimateItemKindFilter.Create;
    SetNullIntProps(ENEstimateItemKindFilterObj);
    SetNullXSProps(ENEstimateItemKindFilterObj);

    if frmENEstimateItemKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENEstimateItemKindFilter.Create;
      FilterObject := ENEstimateItemKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENEstimateItemKindFilterEdit.Free;
    frmENEstimateItemKindFilterEdit:=nil;
  end;}
end;

procedure TfrmENEstimateItemKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.