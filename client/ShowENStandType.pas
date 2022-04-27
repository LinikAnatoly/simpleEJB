
unit ShowENStandType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENStandTypeController, AdvObj ;


type
  TfrmENStandTypeShow = class(TChildForm)  
  HTTPRIOENStandType: THTTPRIO;
    ImageList1: TImageList;
    sgENStandType: TAdvStringGrid;
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
procedure sgENStandTypeTopLeftChanged(Sender: TObject);
procedure sgENStandTypeDblClick(Sender: TObject);
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
 frmENStandTypeShow : TfrmENStandTypeShow;
 // ENStandTypeObj: ENStandType;
 // ENStandTypeFilterObj: ENStandTypeFilter;
  
  
implementation

uses Main, EditENStandType, EditENStandTypeFilter;


{$R *.dfm}

var
  //frmENStandTypeShow : TfrmENStandTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENStandTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип стойки опори'
        );
   

procedure TfrmENStandTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENStandTypeShow:=nil;
    inherited;
  end;


procedure TfrmENStandTypeShow.FormShow(Sender: TObject);
var
  TempENStandType: ENStandTypeControllerSoapPort;
  i: Integer;
  ENStandTypeList: ENStandTypeShortList;
  begin
  SetGridHeaders(ENStandTypeHeaders, sgENStandType.ColumnHeaders);
  ColCount:=100;
  TempENStandType :=  HTTPRIOENStandType as ENStandTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENStandTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandTypeList := TempENStandType.getScrollableFilteredList(ENStandTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENStandTypeList.list);

  if LastCount > -1 then
     sgENStandType.RowCount:=LastCount+2
  else
     sgENStandType.RowCount:=2;

   with sgENStandType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENStandTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENStandTypeList.list[i].name;
        LastRow:=i+1;
        sgENStandType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENStandType.Row:=1;
end;

procedure TfrmENStandTypeShow.sgENStandTypeTopLeftChanged(Sender: TObject);
var
  TempENStandType: ENStandTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENStandTypeList: ENStandTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENStandType.TopRow + sgENStandType.VisibleRowCount) = ColCount
  then
    begin
      TempENStandType :=  HTTPRIOENStandType as ENStandTypeControllerSoapPort;
      CurrentRow:=sgENStandType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENStandTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENStandTypeList := TempENStandType.getScrollableFilteredList(ENStandTypeFilter(FilterObject),ColCount-1, 100);



  sgENStandType.RowCount:=sgENStandType.RowCount+100;
  LastCount:=High(ENStandTypeList.list);
  with sgENStandType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENStandTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENStandTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENStandType.Row:=CurrentRow-5;
   sgENStandType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENStandTypeShow.sgENStandTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENStandType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENStandTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENStandType.RowCount-1 do
   for j:=0 to sgENStandType.ColCount-1 do
     sgENStandType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENStandTypeShow.actViewExecute(Sender: TObject);
Var TempENStandType: ENStandTypeControllerSoapPort;
begin
 TempENStandType := HTTPRIOENStandType as ENStandTypeControllerSoapPort;
   try
     ENStandTypeObj := TempENStandType.getObject(StrToInt(sgENStandType.Cells[0,sgENStandType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandTypeEdit:=TfrmENStandTypeEdit.Create(Application, dsView);
  try
    frmENStandTypeEdit.ShowModal;
  finally
    frmENStandTypeEdit.Free;
    frmENStandTypeEdit:=nil;
  end;
end;

procedure TfrmENStandTypeShow.actEditExecute(Sender: TObject);
Var TempENStandType: ENStandTypeControllerSoapPort;
begin
 TempENStandType := HTTPRIOENStandType as ENStandTypeControllerSoapPort;
   try
     ENStandTypeObj := TempENStandType.getObject(StrToInt(sgENStandType.Cells[0,sgENStandType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENStandTypeEdit:=TfrmENStandTypeEdit.Create(Application, dsEdit);
  try
    if frmENStandTypeEdit.ShowModal= mrOk then
      begin
        //TempENStandType.save(ENStandTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENStandTypeEdit.Free;
    frmENStandTypeEdit:=nil;
  end;
end;

procedure TfrmENStandTypeShow.actDeleteExecute(Sender: TObject);
Var TempENStandType: ENStandTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENStandType := HTTPRIOENStandType as ENStandTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENStandType.Cells[0,sgENStandType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи стійок опор) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENStandType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENStandTypeShow.actInsertExecute(Sender: TObject);
// Var TempENStandType: ENStandTypeControllerSoapPort; 
begin
  // TempENStandType := HTTPRIOENStandType as ENStandTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENStandTypeObj:=ENStandType.Create;



  try
    frmENStandTypeEdit:=TfrmENStandTypeEdit.Create(Application, dsInsert);
    try
      if frmENStandTypeEdit.ShowModal = mrOk then
      begin
        if ENStandTypeObj<>nil then
            //TempENStandType.add(ENStandTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENStandTypeEdit.Free;
      frmENStandTypeEdit:=nil;
    end;
  finally
    ENStandTypeObj.Free;
  end;
end;

procedure TfrmENStandTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENStandTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENStandTypeFilterEdit:=TfrmENStandTypeFilterEdit.Create(Application, dsInsert);
  try
    ENStandTypeFilterObj := ENStandTypeFilter.Create;
    SetNullIntProps(ENStandTypeFilterObj);
    SetNullXSProps(ENStandTypeFilterObj);

    if frmENStandTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENStandTypeFilter.Create;
      FilterObject := ENStandTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENStandTypeFilterEdit.Free;
    frmENStandTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENStandTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.