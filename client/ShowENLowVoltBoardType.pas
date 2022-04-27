
unit ShowENLowVoltBoardType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLowVoltBoardTypeController ;


type
  TfrmENLowVoltBoardTypeShow = class(TChildForm)  
  HTTPRIOENLowVoltBoardType: THTTPRIO;
    ImageList1: TImageList;
    sgENLowVoltBoardType: TAdvStringGrid;
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
procedure sgENLowVoltBoardTypeTopLeftChanged(Sender: TObject);
procedure sgENLowVoltBoardTypeDblClick(Sender: TObject);
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
 // ENLowVoltBoardTypeObj: ENLowVoltBoardType;
 // ENLowVoltBoardTypeFilterObj: ENLowVoltBoardTypeFilter;
  
  
implementation

uses Main, EditENLowVoltBoardType, EditENLowVoltBoardTypeFilter;


{$R *.dfm}

var
  //frmENLowVoltBoardTypeShow : TfrmENLowVoltBoardTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLowVoltBoardTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип панелей щита'
        );
   

procedure TfrmENLowVoltBoardTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLowVoltBoardTypeShow:=nil;
    inherited;
  end;


procedure TfrmENLowVoltBoardTypeShow.FormShow(Sender: TObject);
var
  TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
  i: Integer;
  ENLowVoltBoardTypeList: ENLowVoltBoardTypeShortList;
  begin
  SetGridHeaders(ENLowVoltBoardTypeHeaders, sgENLowVoltBoardType.ColumnHeaders);
  ColCount:=100;
  TempENLowVoltBoardType :=  HTTPRIOENLowVoltBoardType as ENLowVoltBoardTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLowVoltBoardTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLowVoltBoardTypeList := TempENLowVoltBoardType.getScrollableFilteredList(ENLowVoltBoardTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLowVoltBoardTypeList.list);

  if LastCount > -1 then
     sgENLowVoltBoardType.RowCount:=LastCount+2
  else
     sgENLowVoltBoardType.RowCount:=2;

   with sgENLowVoltBoardType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLowVoltBoardTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLowVoltBoardTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLowVoltBoardTypeList.list[i].name;
        LastRow:=i+1;
        sgENLowVoltBoardType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLowVoltBoardType.Row:=1;
end;

procedure TfrmENLowVoltBoardTypeShow.sgENLowVoltBoardTypeTopLeftChanged(Sender: TObject);
var
  TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENLowVoltBoardTypeList: ENLowVoltBoardTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLowVoltBoardType.TopRow + sgENLowVoltBoardType.VisibleRowCount) = ColCount
  then
    begin
      TempENLowVoltBoardType :=  HTTPRIOENLowVoltBoardType as ENLowVoltBoardTypeControllerSoapPort;
      CurrentRow:=sgENLowVoltBoardType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLowVoltBoardTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLowVoltBoardTypeList := TempENLowVoltBoardType.getScrollableFilteredList(ENLowVoltBoardTypeFilter(FilterObject),ColCount-1, 100);



  sgENLowVoltBoardType.RowCount:=sgENLowVoltBoardType.RowCount+100;
  LastCount:=High(ENLowVoltBoardTypeList.list);
  with sgENLowVoltBoardType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLowVoltBoardTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLowVoltBoardTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLowVoltBoardTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLowVoltBoardType.Row:=CurrentRow-5;
   sgENLowVoltBoardType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLowVoltBoardTypeShow.sgENLowVoltBoardTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLowVoltBoardType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLowVoltBoardTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLowVoltBoardType.RowCount-1 do
   for j:=0 to sgENLowVoltBoardType.ColCount-1 do
     sgENLowVoltBoardType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLowVoltBoardTypeShow.actViewExecute(Sender: TObject);
Var TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
begin
 TempENLowVoltBoardType := HTTPRIOENLowVoltBoardType as ENLowVoltBoardTypeControllerSoapPort;
   try
     ENLowVoltBoardTypeObj := TempENLowVoltBoardType.getObject(StrToInt(sgENLowVoltBoardType.Cells[0,sgENLowVoltBoardType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLowVoltBoardTypeEdit:=TfrmENLowVoltBoardTypeEdit.Create(Application, dsView);
  try
    frmENLowVoltBoardTypeEdit.ShowModal;
  finally
    frmENLowVoltBoardTypeEdit.Free;
    frmENLowVoltBoardTypeEdit:=nil;
  end;
end;

procedure TfrmENLowVoltBoardTypeShow.actEditExecute(Sender: TObject);
Var TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
begin
 TempENLowVoltBoardType := HTTPRIOENLowVoltBoardType as ENLowVoltBoardTypeControllerSoapPort;
   try
     ENLowVoltBoardTypeObj := TempENLowVoltBoardType.getObject(StrToInt(sgENLowVoltBoardType.Cells[0,sgENLowVoltBoardType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLowVoltBoardTypeEdit:=TfrmENLowVoltBoardTypeEdit.Create(Application, dsEdit);
  try
    if frmENLowVoltBoardTypeEdit.ShowModal= mrOk then
      begin
        //TempENLowVoltBoardType.save(ENLowVoltBoardTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLowVoltBoardTypeEdit.Free;
    frmENLowVoltBoardTypeEdit:=nil;
  end;
end;

procedure TfrmENLowVoltBoardTypeShow.actDeleteExecute(Sender: TObject);
Var TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLowVoltBoardType := HTTPRIOENLowVoltBoardType as ENLowVoltBoardTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLowVoltBoardType.Cells[0,sgENLowVoltBoardType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип низковольтного щита) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLowVoltBoardType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLowVoltBoardTypeShow.actInsertExecute(Sender: TObject);
Var TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
begin
  TempENLowVoltBoardType := HTTPRIOENLowVoltBoardType as ENLowVoltBoardTypeControllerSoapPort;
  ENLowVoltBoardTypeObj:=ENLowVoltBoardType.Create;



  try
    frmENLowVoltBoardTypeEdit:=TfrmENLowVoltBoardTypeEdit.Create(Application, dsInsert);
    try
      if frmENLowVoltBoardTypeEdit.ShowModal = mrOk then
      begin
        if ENLowVoltBoardTypeObj<>nil then
            //TempENLowVoltBoardType.add(ENLowVoltBoardTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLowVoltBoardTypeEdit.Free;
      frmENLowVoltBoardTypeEdit:=nil;
    end;
  finally
    ENLowVoltBoardTypeObj.Free;
  end;
end;

procedure TfrmENLowVoltBoardTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLowVoltBoardTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENLowVoltBoardTypeFilterEdit:=TfrmENLowVoltBoardTypeFilterEdit.Create(Application, dsInsert);
  try
    ENLowVoltBoardTypeFilterObj := ENLowVoltBoardTypeFilter.Create;
    SetNullIntProps(ENLowVoltBoardTypeFilterObj);
    SetNullXSProps(ENLowVoltBoardTypeFilterObj);

    if frmENLowVoltBoardTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLowVoltBoardTypeFilter.Create;
      FilterObject := ENLowVoltBoardTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLowVoltBoardTypeFilterEdit.Free;
    frmENLowVoltBoardTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENLowVoltBoardTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.