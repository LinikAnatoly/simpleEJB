
unit ShowENBuilderObjectType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBuilderObjectTypeController ;


type
  TfrmENBuilderObjectTypeShow = class(TChildForm)  
  HTTPRIOENBuilderObjectType: THTTPRIO;
    ImageList1: TImageList;
    sgENBuilderObjectType: TAdvStringGrid;
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
procedure sgENBuilderObjectTypeTopLeftChanged(Sender: TObject);
procedure sgENBuilderObjectTypeDblClick(Sender: TObject);
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
 // ENBuilderObjectTypeObj: ENBuilderObjectType;
 // ENBuilderObjectTypeFilterObj: ENBuilderObjectTypeFilter;
  
  
implementation

uses Main, EditENBuilderObjectType, EditENBuilderObjectTypeFilter;


{$R *.dfm}

var
  //frmENBuilderObjectTypeShow : TfrmENBuilderObjectTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuilderObjectTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип обьекту'
        );
   

procedure TfrmENBuilderObjectTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBuilderObjectTypeShow:=nil;
    inherited;
  end;


procedure TfrmENBuilderObjectTypeShow.FormShow(Sender: TObject);
var
  TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
  i: Integer;
  ENBuilderObjectTypeList: ENBuilderObjectTypeShortList;
  begin
  SetGridHeaders(ENBuilderObjectTypeHeaders, sgENBuilderObjectType.ColumnHeaders);
  ColCount:=100;
  TempENBuilderObjectType :=  HTTPRIOENBuilderObjectType as ENBuilderObjectTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilderObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilderObjectTypeList := TempENBuilderObjectType.getScrollableFilteredList(ENBuilderObjectTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBuilderObjectTypeList.list);

  if LastCount > -1 then
     sgENBuilderObjectType.RowCount:=LastCount+2
  else
     sgENBuilderObjectType.RowCount:=2;

   with sgENBuilderObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilderObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilderObjectTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuilderObjectTypeList.list[i].name;
        LastRow:=i+1;
        sgENBuilderObjectType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBuilderObjectType.Row:=1;
end;

procedure TfrmENBuilderObjectTypeShow.sgENBuilderObjectTypeTopLeftChanged(Sender: TObject);
var
  TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuilderObjectTypeList: ENBuilderObjectTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuilderObjectType.TopRow + sgENBuilderObjectType.VisibleRowCount) = ColCount
  then
    begin
      TempENBuilderObjectType :=  HTTPRIOENBuilderObjectType as ENBuilderObjectTypeControllerSoapPort;
      CurrentRow:=sgENBuilderObjectType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilderObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilderObjectTypeList := TempENBuilderObjectType.getScrollableFilteredList(ENBuilderObjectTypeFilter(FilterObject),ColCount-1, 100);



  sgENBuilderObjectType.RowCount:=sgENBuilderObjectType.RowCount+100;
  LastCount:=High(ENBuilderObjectTypeList.list);
  with sgENBuilderObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilderObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuilderObjectTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBuilderObjectTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuilderObjectType.Row:=CurrentRow-5;
   sgENBuilderObjectType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuilderObjectTypeShow.sgENBuilderObjectTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuilderObjectType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBuilderObjectTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBuilderObjectType.RowCount-1 do
   for j:=0 to sgENBuilderObjectType.ColCount-1 do
     sgENBuilderObjectType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBuilderObjectTypeShow.actViewExecute(Sender: TObject);
Var TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
begin
 TempENBuilderObjectType := HTTPRIOENBuilderObjectType as ENBuilderObjectTypeControllerSoapPort;
   try
     ENBuilderObjectTypeObj := TempENBuilderObjectType.getObject(StrToInt(sgENBuilderObjectType.Cells[0,sgENBuilderObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBuilderObjectTypeEdit:=TfrmENBuilderObjectTypeEdit.Create(Application, dsView);
  try
    frmENBuilderObjectTypeEdit.ShowModal;
  finally
    frmENBuilderObjectTypeEdit.Free;
    frmENBuilderObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENBuilderObjectTypeShow.actEditExecute(Sender: TObject);
Var TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
begin
 TempENBuilderObjectType := HTTPRIOENBuilderObjectType as ENBuilderObjectTypeControllerSoapPort;
   try
     ENBuilderObjectTypeObj := TempENBuilderObjectType.getObject(StrToInt(sgENBuilderObjectType.Cells[0,sgENBuilderObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBuilderObjectTypeEdit:=TfrmENBuilderObjectTypeEdit.Create(Application, dsEdit);
  try
    if frmENBuilderObjectTypeEdit.ShowModal= mrOk then
      begin
        //TempENBuilderObjectType.save(ENBuilderObjectTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuilderObjectTypeEdit.Free;
    frmENBuilderObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENBuilderObjectTypeShow.actDeleteExecute(Sender: TObject);
Var TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilderObjectType := HTTPRIOENBuilderObjectType as ENBuilderObjectTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilderObjectType.Cells[0,sgENBuilderObjectType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи обьектів будівельной служби) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilderObjectType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuilderObjectTypeShow.actInsertExecute(Sender: TObject);
Var TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
begin
  TempENBuilderObjectType := HTTPRIOENBuilderObjectType as ENBuilderObjectTypeControllerSoapPort;
  ENBuilderObjectTypeObj:=ENBuilderObjectType.Create;



  try
    frmENBuilderObjectTypeEdit:=TfrmENBuilderObjectTypeEdit.Create(Application, dsInsert);
    try
      if frmENBuilderObjectTypeEdit.ShowModal = mrOk then
      begin
        if ENBuilderObjectTypeObj<>nil then
            //TempENBuilderObjectType.add(ENBuilderObjectTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuilderObjectTypeEdit.Free;
      frmENBuilderObjectTypeEdit:=nil;
    end;
  finally
    ENBuilderObjectTypeObj.Free;
  end;
end;

procedure TfrmENBuilderObjectTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBuilderObjectTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENBuilderObjectTypeFilterEdit:=TfrmENBuilderObjectTypeFilterEdit.Create(Application, dsEdit);
  try
    ENBuilderObjectTypeFilterObj := ENBuilderObjectTypeFilter.Create;
    SetNullIntProps(ENBuilderObjectTypeFilterObj);
    SetNullXSProps(ENBuilderObjectTypeFilterObj);

    if frmENBuilderObjectTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBuilderObjectTypeFilter.Create;
      FilterObject := ENBuilderObjectTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuilderObjectTypeFilterEdit.Free;
    frmENBuilderObjectTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENBuilderObjectTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.