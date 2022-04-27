
unit ShowENWiresType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWiresTypeController ;


type
  TfrmENWiresTypeShow = class(TChildForm)  
  HTTPRIOENWiresType: THTTPRIO;
    ImageList1: TImageList;
    sgENWiresType: TAdvStringGrid;
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
procedure sgENWiresTypeTopLeftChanged(Sender: TObject);
procedure sgENWiresTypeDblClick(Sender: TObject);
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
 // ENWiresTypeObj: ENWiresType;
 // ENWiresTypeFilterObj: ENWiresTypeFilter;
  
  
implementation

uses Main, EditENWiresType, EditENWiresTypeFilter;


{$R *.dfm}

var
  //frmENWiresTypeShow : TfrmENWiresTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWiresTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Марка проводу'
          ,'Кабель/провод (1,0)'
        );
   

procedure TfrmENWiresTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWiresTypeShow:=nil;
    inherited;
  end;


procedure TfrmENWiresTypeShow.FormShow(Sender: TObject);
var
  TempENWiresType: ENWiresTypeControllerSoapPort;
  i: Integer;
  ENWiresTypeList: ENWiresTypeShortList;
  begin
  SetGridHeaders(ENWiresTypeHeaders, sgENWiresType.ColumnHeaders);
  ColCount:=100;
  TempENWiresType :=  HTTPRIOENWiresType as ENWiresTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresTypeList := TempENWiresType.getScrollableFilteredList(ENWiresTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWiresTypeList.list);

  if LastCount > -1 then
     sgENWiresType.RowCount:=LastCount+2
  else
     sgENWiresType.RowCount:=2;

   with sgENWiresType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWiresTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWiresTypeList.list[i].name;
        if ENWiresTypeList.list[i].isCabel = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENWiresTypeList.list[i].isCabel);
        LastRow:=i+1;
        sgENWiresType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWiresType.Row:=1;
end;

procedure TfrmENWiresTypeShow.sgENWiresTypeTopLeftChanged(Sender: TObject);
var
  TempENWiresType: ENWiresTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENWiresTypeList: ENWiresTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWiresType.TopRow + sgENWiresType.VisibleRowCount) = ColCount
  then
    begin
      TempENWiresType :=  HTTPRIOENWiresType as ENWiresTypeControllerSoapPort;
      CurrentRow:=sgENWiresType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresTypeList := TempENWiresType.getScrollableFilteredList(ENWiresTypeFilter(FilterObject),ColCount-1, 100);



  sgENWiresType.RowCount:=sgENWiresType.RowCount+100;
  LastCount:=High(ENWiresTypeList.list);
  with sgENWiresType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWiresTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWiresTypeList.list[i].name;
        if ENWiresTypeList.list[i].isCabel = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENWiresTypeList.list[i].isCabel);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWiresType.Row:=CurrentRow-5;
   sgENWiresType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWiresTypeShow.sgENWiresTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWiresType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWiresTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWiresType.RowCount-1 do
   for j:=0 to sgENWiresType.ColCount-1 do
     sgENWiresType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWiresTypeShow.actViewExecute(Sender: TObject);
Var TempENWiresType: ENWiresTypeControllerSoapPort;
begin
 TempENWiresType := HTTPRIOENWiresType as ENWiresTypeControllerSoapPort;
   try
     ENWiresTypeObj := TempENWiresType.getObject(StrToInt(sgENWiresType.Cells[0,sgENWiresType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresTypeEdit:=TfrmENWiresTypeEdit.Create(Application, dsView);
  try
    frmENWiresTypeEdit.ShowModal;
  finally
    frmENWiresTypeEdit.Free;
    frmENWiresTypeEdit:=nil;
  end;
end;

procedure TfrmENWiresTypeShow.actEditExecute(Sender: TObject);
Var TempENWiresType: ENWiresTypeControllerSoapPort;
begin
 TempENWiresType := HTTPRIOENWiresType as ENWiresTypeControllerSoapPort;
   try
     ENWiresTypeObj := TempENWiresType.getObject(StrToInt(sgENWiresType.Cells[0,sgENWiresType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresTypeEdit:=TfrmENWiresTypeEdit.Create(Application, dsEdit);
  try
    if frmENWiresTypeEdit.ShowModal= mrOk then
      begin
        //TempENWiresType.save(ENWiresTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWiresTypeEdit.Free;
    frmENWiresTypeEdit:=nil;
  end;
end;

procedure TfrmENWiresTypeShow.actDeleteExecute(Sender: TObject);
Var TempENWiresType: ENWiresTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWiresType := HTTPRIOENWiresType as ENWiresTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWiresType.Cells[0,sgENWiresType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Марки проводу) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWiresType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWiresTypeShow.actInsertExecute(Sender: TObject);
// Var TempENWiresType: ENWiresTypeControllerSoapPort; 
begin
  // TempENWiresType := HTTPRIOENWiresType as ENWiresTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWiresTypeObj:=ENWiresType.Create;



  try
    frmENWiresTypeEdit:=TfrmENWiresTypeEdit.Create(Application, dsInsert);
    try
      if frmENWiresTypeEdit.ShowModal = mrOk then
      begin
        if ENWiresTypeObj<>nil then
            //TempENWiresType.add(ENWiresTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWiresTypeEdit.Free;
      frmENWiresTypeEdit:=nil;
    end;
  finally
    ENWiresTypeObj.Free;
  end;
end;

procedure TfrmENWiresTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWiresTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENWiresTypeFilterEdit:=TfrmENWiresTypeFilterEdit.Create(Application, dsInsert);
  try
    ENWiresTypeFilterObj := ENWiresTypeFilter.Create;
    SetNullIntProps(ENWiresTypeFilterObj);
    SetNullXSProps(ENWiresTypeFilterObj);

    if frmENWiresTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWiresTypeFilter.Create;
      FilterObject := ENWiresTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWiresTypeFilterEdit.Free;
    frmENWiresTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENWiresTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.