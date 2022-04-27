
unit ShowENTraversType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTraversTypeController, AdvObj ;


type
  TfrmENTraversTypeShow = class(TChildForm)  
  HTTPRIOENTraversType: THTTPRIO;
    ImageList1: TImageList;
    sgENTraversType: TAdvStringGrid;
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
procedure sgENTraversTypeTopLeftChanged(Sender: TObject);
procedure sgENTraversTypeDblClick(Sender: TObject);
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
 frmENTraversTypeShow : TfrmENTraversTypeShow;
 // ENTraversTypeObj: ENTraversType;
 // ENTraversTypeFilterObj: ENTraversTypeFilter;
  
  
implementation

uses Main, EditENTraversType, EditENTraversTypeFilter;


{$R *.dfm}

var
  //frmENTraversTypeShow : TfrmENTraversTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTraversTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип траверсу'
        );
   

procedure TfrmENTraversTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTraversTypeShow:=nil;
    inherited;
  end;


procedure TfrmENTraversTypeShow.FormShow(Sender: TObject);
var
  TempENTraversType: ENTraversTypeControllerSoapPort;
  i: Integer;
  ENTraversTypeList: ENTraversTypeShortList;
  begin
  SetGridHeaders(ENTraversTypeHeaders, sgENTraversType.ColumnHeaders);
  ColCount:=100;
  TempENTraversType :=  HTTPRIOENTraversType as ENTraversTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTraversTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTraversTypeList := TempENTraversType.getScrollableFilteredList(ENTraversTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTraversTypeList.list);

  if LastCount > -1 then
     sgENTraversType.RowCount:=LastCount+2
  else
     sgENTraversType.RowCount:=2;

   with sgENTraversType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTraversTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTraversTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTraversTypeList.list[i].name;
        LastRow:=i+1;
        sgENTraversType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTraversType.Row:=1;
end;

procedure TfrmENTraversTypeShow.sgENTraversTypeTopLeftChanged(Sender: TObject);
var
  TempENTraversType: ENTraversTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENTraversTypeList: ENTraversTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTraversType.TopRow + sgENTraversType.VisibleRowCount) = ColCount
  then
    begin
      TempENTraversType :=  HTTPRIOENTraversType as ENTraversTypeControllerSoapPort;
      CurrentRow:=sgENTraversType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTraversTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTraversTypeList := TempENTraversType.getScrollableFilteredList(ENTraversTypeFilter(FilterObject),ColCount-1, 100);



  sgENTraversType.RowCount:=sgENTraversType.RowCount+100;
  LastCount:=High(ENTraversTypeList.list);
  with sgENTraversType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTraversTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTraversTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTraversTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTraversType.Row:=CurrentRow-5;
   sgENTraversType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTraversTypeShow.sgENTraversTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTraversType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTraversTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTraversType.RowCount-1 do
   for j:=0 to sgENTraversType.ColCount-1 do
     sgENTraversType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTraversTypeShow.actViewExecute(Sender: TObject);
Var TempENTraversType: ENTraversTypeControllerSoapPort;
begin
 TempENTraversType := HTTPRIOENTraversType as ENTraversTypeControllerSoapPort;
   try
     ENTraversTypeObj := TempENTraversType.getObject(StrToInt(sgENTraversType.Cells[0,sgENTraversType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTraversTypeEdit:=TfrmENTraversTypeEdit.Create(Application, dsView);
  try
    frmENTraversTypeEdit.ShowModal;
  finally
    frmENTraversTypeEdit.Free;
    frmENTraversTypeEdit:=nil;
  end;
end;

procedure TfrmENTraversTypeShow.actEditExecute(Sender: TObject);
Var TempENTraversType: ENTraversTypeControllerSoapPort;
begin
 TempENTraversType := HTTPRIOENTraversType as ENTraversTypeControllerSoapPort;
   try
     ENTraversTypeObj := TempENTraversType.getObject(StrToInt(sgENTraversType.Cells[0,sgENTraversType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTraversTypeEdit:=TfrmENTraversTypeEdit.Create(Application, dsEdit);
  try
    if frmENTraversTypeEdit.ShowModal= mrOk then
      begin
        //TempENTraversType.save(ENTraversTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTraversTypeEdit.Free;
    frmENTraversTypeEdit:=nil;
  end;
end;

procedure TfrmENTraversTypeShow.actDeleteExecute(Sender: TObject);
Var TempENTraversType: ENTraversTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTraversType := HTTPRIOENTraversType as ENTraversTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTraversType.Cells[0,sgENTraversType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип траверсу) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTraversType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTraversTypeShow.actInsertExecute(Sender: TObject);
// Var TempENTraversType: ENTraversTypeControllerSoapPort; 
begin
  // TempENTraversType := HTTPRIOENTraversType as ENTraversTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTraversTypeObj:=ENTraversType.Create;



  try
    frmENTraversTypeEdit:=TfrmENTraversTypeEdit.Create(Application, dsInsert);
    try
      if frmENTraversTypeEdit.ShowModal = mrOk then
      begin
        if ENTraversTypeObj<>nil then
            //TempENTraversType.add(ENTraversTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTraversTypeEdit.Free;
      frmENTraversTypeEdit:=nil;
    end;
  finally
    ENTraversTypeObj.Free;
  end;
end;

procedure TfrmENTraversTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTraversTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENTraversTypeFilterEdit:=TfrmENTraversTypeFilterEdit.Create(Application, dsInsert);
  try
    ENTraversTypeFilterObj := ENTraversTypeFilter.Create;
    SetNullIntProps(ENTraversTypeFilterObj);
    SetNullXSProps(ENTraversTypeFilterObj);

    if frmENTraversTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTraversTypeFilter.Create;
      FilterObject := ENTraversTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTraversTypeFilterEdit.Free;
    frmENTraversTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENTraversTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.