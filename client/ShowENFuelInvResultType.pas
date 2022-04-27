
unit ShowENFuelInvResultType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuelInvResultTypeController ;


type
  TfrmENFuelInvResultTypeShow = class(TChildForm)  
  HTTPRIOENFuelInvResultType: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelInvResultType: TAdvStringGrid;
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
procedure sgENFuelInvResultTypeTopLeftChanged(Sender: TObject);
procedure sgENFuelInvResultTypeDblClick(Sender: TObject);
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
 // ENFuelInvResultTypeObj: ENFuelInvResultType;
 // ENFuelInvResultTypeFilterObj: ENFuelInvResultTypeFilter;
  
  
implementation

uses Main, EditENFuelInvResultType, EditENFuelInvResultTypeFilter;


{$R *.dfm}

var
  //frmENFuelInvResultTypeShow : TfrmENFuelInvResultTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelInvResultTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування типу'
        );
   

procedure TfrmENFuelInvResultTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuelInvResultTypeShow:=nil;
    inherited;
  end;


procedure TfrmENFuelInvResultTypeShow.FormShow(Sender: TObject);
var
  TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort;
  i: Integer;
  ENFuelInvResultTypeList: ENFuelInvResultTypeShortList;
  begin
  SetGridHeaders(ENFuelInvResultTypeHeaders, sgENFuelInvResultType.ColumnHeaders);
  ColCount:=100;
  TempENFuelInvResultType :=  HTTPRIOENFuelInvResultType as ENFuelInvResultTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInvResultTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInvResultTypeList := TempENFuelInvResultType.getScrollableFilteredList(ENFuelInvResultTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuelInvResultTypeList.list);

  if LastCount > -1 then
     sgENFuelInvResultType.RowCount:=LastCount+2
  else
     sgENFuelInvResultType.RowCount:=2;

   with sgENFuelInvResultType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInvResultTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelInvResultTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFuelInvResultTypeList.list[i].name;
        LastRow:=i+1;
        sgENFuelInvResultType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFuelInvResultType.Row:=1;
end;

procedure TfrmENFuelInvResultTypeShow.sgENFuelInvResultTypeTopLeftChanged(Sender: TObject);
var
  TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelInvResultTypeList: ENFuelInvResultTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelInvResultType.TopRow + sgENFuelInvResultType.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelInvResultType :=  HTTPRIOENFuelInvResultType as ENFuelInvResultTypeControllerSoapPort;
      CurrentRow:=sgENFuelInvResultType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInvResultTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInvResultTypeList := TempENFuelInvResultType.getScrollableFilteredList(ENFuelInvResultTypeFilter(FilterObject),ColCount-1, 100);



  sgENFuelInvResultType.RowCount:=sgENFuelInvResultType.RowCount+100;
  LastCount:=High(ENFuelInvResultTypeList.list);
  with sgENFuelInvResultType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInvResultTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelInvResultTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFuelInvResultTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelInvResultType.Row:=CurrentRow-5;
   sgENFuelInvResultType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelInvResultTypeShow.sgENFuelInvResultTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelInvResultType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuelInvResultTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuelInvResultType.RowCount-1 do
   for j:=0 to sgENFuelInvResultType.ColCount-1 do
     sgENFuelInvResultType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuelInvResultTypeShow.actViewExecute(Sender: TObject);
Var TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort;
begin
 TempENFuelInvResultType := HTTPRIOENFuelInvResultType as ENFuelInvResultTypeControllerSoapPort;
   try
     ENFuelInvResultTypeObj := TempENFuelInvResultType.getObject(StrToInt(sgENFuelInvResultType.Cells[0,sgENFuelInvResultType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInvResultTypeEdit:=TfrmENFuelInvResultTypeEdit.Create(Application, dsView);
  try
    frmENFuelInvResultTypeEdit.ShowModal;
  finally
    frmENFuelInvResultTypeEdit.Free;
    frmENFuelInvResultTypeEdit:=nil;
  end;
end;

procedure TfrmENFuelInvResultTypeShow.actEditExecute(Sender: TObject);
Var TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort;
begin
 TempENFuelInvResultType := HTTPRIOENFuelInvResultType as ENFuelInvResultTypeControllerSoapPort;
   try
     ENFuelInvResultTypeObj := TempENFuelInvResultType.getObject(StrToInt(sgENFuelInvResultType.Cells[0,sgENFuelInvResultType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInvResultTypeEdit:=TfrmENFuelInvResultTypeEdit.Create(Application, dsEdit);
  try
    if frmENFuelInvResultTypeEdit.ShowModal= mrOk then
      begin
        //TempENFuelInvResultType.save(ENFuelInvResultTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelInvResultTypeEdit.Free;
    frmENFuelInvResultTypeEdit:=nil;
  end;
end;

procedure TfrmENFuelInvResultTypeShow.actDeleteExecute(Sender: TObject);
Var TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelInvResultType := HTTPRIOENFuelInvResultType as ENFuelInvResultTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelInvResultType.Cells[0,sgENFuelInvResultType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип результату інвентарізації палива) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelInvResultType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelInvResultTypeShow.actInsertExecute(Sender: TObject);
// Var TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort; 
begin
  // TempENFuelInvResultType := HTTPRIOENFuelInvResultType as ENFuelInvResultTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelInvResultTypeObj:=ENFuelInvResultType.Create;



  try
    frmENFuelInvResultTypeEdit:=TfrmENFuelInvResultTypeEdit.Create(Application, dsInsert);
    try
      if frmENFuelInvResultTypeEdit.ShowModal = mrOk then
      begin
        if ENFuelInvResultTypeObj<>nil then
            //TempENFuelInvResultType.add(ENFuelInvResultTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelInvResultTypeEdit.Free;
      frmENFuelInvResultTypeEdit:=nil;
    end;
  finally
    ENFuelInvResultTypeObj.Free;
  end;
end;

procedure TfrmENFuelInvResultTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuelInvResultTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelInvResultTypeFilterEdit:=TfrmENFuelInvResultTypeFilterEdit.Create(Application, dsInsert);
  try
    ENFuelInvResultTypeFilterObj := ENFuelInvResultTypeFilter.Create;
    SetNullIntProps(ENFuelInvResultTypeFilterObj);
    SetNullXSProps(ENFuelInvResultTypeFilterObj);

    if frmENFuelInvResultTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuelInvResultTypeFilter.Create;
      FilterObject := ENFuelInvResultTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelInvResultTypeFilterEdit.Free;
    frmENFuelInvResultTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuelInvResultTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.