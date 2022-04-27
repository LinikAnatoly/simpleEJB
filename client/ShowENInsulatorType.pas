
unit ShowENInsulatorType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENInsulatorTypeController, AdvObj ;


type
  TfrmENInsulatorTypeShow = class(TChildForm)  
  HTTPRIOENInsulatorType: THTTPRIO;
    ImageList1: TImageList;
    sgENInsulatorType: TAdvStringGrid;
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
procedure sgENInsulatorTypeTopLeftChanged(Sender: TObject);
procedure sgENInsulatorTypeDblClick(Sender: TObject);
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
 frmENInsulatorTypeShow : TfrmENInsulatorTypeShow;
 // ENInsulatorTypeObj: ENInsulatorType;
 // ENInsulatorTypeFilterObj: ENInsulatorTypeFilter;
  
  
implementation

uses Main, EditENInsulatorType, EditENInsulatorTypeFilter;


{$R *.dfm}

var
  //frmENInsulatorTypeShow : TfrmENInsulatorTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInsulatorTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип изолятора'
        );
   

procedure TfrmENInsulatorTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENInsulatorTypeShow:=nil;
    inherited;
  end;


procedure TfrmENInsulatorTypeShow.FormShow(Sender: TObject);
var
  TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
  i: Integer;
  ENInsulatorTypeList: ENInsulatorTypeShortList;
  begin
  SetGridHeaders(ENInsulatorTypeHeaders, sgENInsulatorType.ColumnHeaders);
  ColCount:=100;
  TempENInsulatorType :=  HTTPRIOENInsulatorType as ENInsulatorTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENInsulatorTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInsulatorTypeList := TempENInsulatorType.getScrollableFilteredList(ENInsulatorTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENInsulatorTypeList.list);

  if LastCount > -1 then
     sgENInsulatorType.RowCount:=LastCount+2
  else
     sgENInsulatorType.RowCount:=2;

   with sgENInsulatorType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInsulatorTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENInsulatorTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENInsulatorTypeList.list[i].name;
        LastRow:=i+1;
        sgENInsulatorType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENInsulatorType.Row:=1;
end;

procedure TfrmENInsulatorTypeShow.sgENInsulatorTypeTopLeftChanged(Sender: TObject);
var
  TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENInsulatorTypeList: ENInsulatorTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENInsulatorType.TopRow + sgENInsulatorType.VisibleRowCount) = ColCount
  then
    begin
      TempENInsulatorType :=  HTTPRIOENInsulatorType as ENInsulatorTypeControllerSoapPort;
      CurrentRow:=sgENInsulatorType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENInsulatorTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInsulatorTypeList := TempENInsulatorType.getScrollableFilteredList(ENInsulatorTypeFilter(FilterObject),ColCount-1, 100);



  sgENInsulatorType.RowCount:=sgENInsulatorType.RowCount+100;
  LastCount:=High(ENInsulatorTypeList.list);
  with sgENInsulatorType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInsulatorTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENInsulatorTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENInsulatorTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENInsulatorType.Row:=CurrentRow-5;
   sgENInsulatorType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENInsulatorTypeShow.sgENInsulatorTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENInsulatorType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENInsulatorTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENInsulatorType.RowCount-1 do
   for j:=0 to sgENInsulatorType.ColCount-1 do
     sgENInsulatorType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENInsulatorTypeShow.actViewExecute(Sender: TObject);
Var TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
begin
 TempENInsulatorType := HTTPRIOENInsulatorType as ENInsulatorTypeControllerSoapPort;
   try
     ENInsulatorTypeObj := TempENInsulatorType.getObject(StrToInt(sgENInsulatorType.Cells[0,sgENInsulatorType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInsulatorTypeEdit:=TfrmENInsulatorTypeEdit.Create(Application, dsView);
  try
    frmENInsulatorTypeEdit.ShowModal;
  finally
    frmENInsulatorTypeEdit.Free;
    frmENInsulatorTypeEdit:=nil;
  end;
end;

procedure TfrmENInsulatorTypeShow.actEditExecute(Sender: TObject);
Var TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
begin
 TempENInsulatorType := HTTPRIOENInsulatorType as ENInsulatorTypeControllerSoapPort;
   try
     ENInsulatorTypeObj := TempENInsulatorType.getObject(StrToInt(sgENInsulatorType.Cells[0,sgENInsulatorType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInsulatorTypeEdit:=TfrmENInsulatorTypeEdit.Create(Application, dsEdit);
  try
    if frmENInsulatorTypeEdit.ShowModal= mrOk then
      begin
        //TempENInsulatorType.save(ENInsulatorTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENInsulatorTypeEdit.Free;
    frmENInsulatorTypeEdit:=nil;
  end;
end;

procedure TfrmENInsulatorTypeShow.actDeleteExecute(Sender: TObject);
Var TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENInsulatorType := HTTPRIOENInsulatorType as ENInsulatorTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENInsulatorType.Cells[0,sgENInsulatorType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип изолятора) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENInsulatorType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENInsulatorTypeShow.actInsertExecute(Sender: TObject);
Var TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
begin
  TempENInsulatorType := HTTPRIOENInsulatorType as ENInsulatorTypeControllerSoapPort;
  ENInsulatorTypeObj:=ENInsulatorType.Create;



  try
    frmENInsulatorTypeEdit:=TfrmENInsulatorTypeEdit.Create(Application, dsInsert);
    try
      if frmENInsulatorTypeEdit.ShowModal = mrOk then
      begin
        if ENInsulatorTypeObj<>nil then
            //TempENInsulatorType.add(ENInsulatorTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENInsulatorTypeEdit.Free;
      frmENInsulatorTypeEdit:=nil;
    end;
  finally
    ENInsulatorTypeObj.Free;
  end;
end;

procedure TfrmENInsulatorTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENInsulatorTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENInsulatorTypeFilterEdit:=TfrmENInsulatorTypeFilterEdit.Create(Application, dsInsert);
  try
    ENInsulatorTypeFilterObj := ENInsulatorTypeFilter.Create;
    SetNullIntProps(ENInsulatorTypeFilterObj);
    SetNullXSProps(ENInsulatorTypeFilterObj);

    if frmENInsulatorTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENInsulatorTypeFilter.Create;
      FilterObject := ENInsulatorTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENInsulatorTypeFilterEdit.Free;
    frmENInsulatorTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENInsulatorTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.