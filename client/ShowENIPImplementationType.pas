
unit ShowENIPImplementationType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENIPImplementationTypeController, AdvObj ;


type
  TfrmENIPImplementationTypeShow = class(TChildForm)  
  HTTPRIOENIPImplementationType: THTTPRIO;
    ImageList1: TImageList;
    sgENIPImplementationType: TAdvStringGrid;
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
procedure sgENIPImplementationTypeTopLeftChanged(Sender: TObject);
procedure sgENIPImplementationTypeDblClick(Sender: TObject);
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
 frmENIPImplementationTypeShow : TfrmENIPImplementationTypeShow;
 // ENIPImplementationTypeObj: ENIPImplementationType;
 // ENIPImplementationTypeFilterObj: ENIPImplementationTypeFilter;
  
  
implementation

uses Main, EditENIPImplementationType, EditENIPImplementationTypeFilter;


{$R *.dfm}

var
  //frmENIPImplementationTypeShow : TfrmENIPImplementationTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENIPImplementationTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENIPImplementationTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENIPImplementationTypeShow:=nil;
    inherited;
  end;


procedure TfrmENIPImplementationTypeShow.FormShow(Sender: TObject);
var
  TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
  i: Integer;
  ENIPImplementationTypeList: ENIPImplementationTypeShortList;
  begin
  SetGridHeaders(ENIPImplementationTypeHeaders, sgENIPImplementationType.ColumnHeaders);
  ColCount:=100;
  TempENIPImplementationType :=  HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENIPImplementationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPImplementationTypeList := TempENIPImplementationType.getScrollableFilteredList(ENIPImplementationTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENIPImplementationTypeList.list);

  if LastCount > -1 then
     sgENIPImplementationType.RowCount:=LastCount+2
  else
     sgENIPImplementationType.RowCount:=2;

   with sgENIPImplementationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPImplementationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIPImplementationTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENIPImplementationTypeList.list[i].name;
        LastRow:=i+1;
        sgENIPImplementationType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENIPImplementationType.Row:=1;
end;

procedure TfrmENIPImplementationTypeShow.sgENIPImplementationTypeTopLeftChanged(Sender: TObject);
var
  TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENIPImplementationTypeList: ENIPImplementationTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENIPImplementationType.TopRow + sgENIPImplementationType.VisibleRowCount) = ColCount
  then
    begin
      TempENIPImplementationType :=  HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;
      CurrentRow:=sgENIPImplementationType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENIPImplementationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPImplementationTypeList := TempENIPImplementationType.getScrollableFilteredList(ENIPImplementationTypeFilter(FilterObject),ColCount-1, 100);



  sgENIPImplementationType.RowCount:=sgENIPImplementationType.RowCount+100;
  LastCount:=High(ENIPImplementationTypeList.list);
  with sgENIPImplementationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPImplementationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENIPImplementationTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENIPImplementationTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENIPImplementationType.Row:=CurrentRow-5;
   sgENIPImplementationType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENIPImplementationTypeShow.sgENIPImplementationTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENIPImplementationType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENIPImplementationTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENIPImplementationType.RowCount-1 do
   for j:=0 to sgENIPImplementationType.ColCount-1 do
     sgENIPImplementationType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENIPImplementationTypeShow.actViewExecute(Sender: TObject);
Var TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
begin
 TempENIPImplementationType := HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;
   try
     ENIPImplementationTypeObj := TempENIPImplementationType.getObject(StrToInt(sgENIPImplementationType.Cells[0,sgENIPImplementationType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPImplementationTypeEdit:=TfrmENIPImplementationTypeEdit.Create(Application, dsView);
  try
    frmENIPImplementationTypeEdit.ShowModal;
  finally
    frmENIPImplementationTypeEdit.Free;
    frmENIPImplementationTypeEdit:=nil;
  end;
end;

procedure TfrmENIPImplementationTypeShow.actEditExecute(Sender: TObject);
Var TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
begin
 TempENIPImplementationType := HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;
   try
     ENIPImplementationTypeObj := TempENIPImplementationType.getObject(StrToInt(sgENIPImplementationType.Cells[0,sgENIPImplementationType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPImplementationTypeEdit:=TfrmENIPImplementationTypeEdit.Create(Application, dsEdit);
  try
    if frmENIPImplementationTypeEdit.ShowModal= mrOk then
      begin
        //TempENIPImplementationType.save(ENIPImplementationTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENIPImplementationTypeEdit.Free;
    frmENIPImplementationTypeEdit:=nil;
  end;
end;

procedure TfrmENIPImplementationTypeShow.actDeleteExecute(Sender: TObject);
Var TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIPImplementationType := HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIPImplementationType.Cells[0,sgENIPImplementationType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип освоєння Інвестпрограми) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIPImplementationType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPImplementationTypeShow.actInsertExecute(Sender: TObject);
// Var TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort; 
begin
  // TempENIPImplementationType := HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENIPImplementationTypeObj:=ENIPImplementationType.Create;



  try
    frmENIPImplementationTypeEdit:=TfrmENIPImplementationTypeEdit.Create(Application, dsInsert);
    try
      if frmENIPImplementationTypeEdit.ShowModal = mrOk then
      begin
        if ENIPImplementationTypeObj<>nil then
            //TempENIPImplementationType.add(ENIPImplementationTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENIPImplementationTypeEdit.Free;
      frmENIPImplementationTypeEdit:=nil;
    end;
  finally
    ENIPImplementationTypeObj.Free;
  end;
end;

procedure TfrmENIPImplementationTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENIPImplementationTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENIPImplementationTypeFilterEdit:=TfrmENIPImplementationTypeFilterEdit.Create(Application, dsInsert);
  try
    ENIPImplementationTypeFilterObj := ENIPImplementationTypeFilter.Create;
    SetNullIntProps(ENIPImplementationTypeFilterObj);
    SetNullXSProps(ENIPImplementationTypeFilterObj);

    if frmENIPImplementationTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENIPImplementationTypeFilter.Create;
      FilterObject := ENIPImplementationTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIPImplementationTypeFilterEdit.Free;
    frmENIPImplementationTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENIPImplementationTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.