
unit ShowENRZAObjectType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENRZAObjectTypeController ;


type
  TfrmENRZAObjectTypeShow = class(TChildForm)  
  HTTPRIOENRZAObjectType: THTTPRIO;
    ImageList1: TImageList;
    sgENRZAObjectType: TAdvStringGrid;
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
procedure sgENRZAObjectTypeTopLeftChanged(Sender: TObject);
procedure sgENRZAObjectTypeDblClick(Sender: TObject);
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
 // ENRZAObjectTypeObj: ENRZAObjectType;
 // ENRZAObjectTypeFilterObj: ENRZAObjectTypeFilter;
  
  
implementation

uses Main, EditENRZAObjectType, EditENRZAObjectTypeFilter;


{$R *.dfm}

var
  //frmENRZAObjectTypeShow : TfrmENRZAObjectTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRZAObjectTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип обьекту РЗА'
        );
   

procedure TfrmENRZAObjectTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENRZAObjectTypeShow:=nil;
    inherited;
  end;


procedure TfrmENRZAObjectTypeShow.FormShow(Sender: TObject);
var
  TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
  i: Integer;
  ENRZAObjectTypeList: ENRZAObjectTypeShortList;
  begin
  SetGridHeaders(ENRZAObjectTypeHeaders, sgENRZAObjectType.ColumnHeaders);
  ColCount:=100;
  TempENRZAObjectType :=  HTTPRIOENRZAObjectType as ENRZAObjectTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRZAObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRZAObjectTypeList := TempENRZAObjectType.getScrollableFilteredList(ENRZAObjectTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENRZAObjectTypeList.list);

  if LastCount > -1 then
     sgENRZAObjectType.RowCount:=LastCount+2
  else
     sgENRZAObjectType.RowCount:=2;

   with sgENRZAObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRZAObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRZAObjectTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRZAObjectTypeList.list[i].name;
        LastRow:=i+1;
        sgENRZAObjectType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENRZAObjectType.Row:=1;
end;

procedure TfrmENRZAObjectTypeShow.sgENRZAObjectTypeTopLeftChanged(Sender: TObject);
var
  TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENRZAObjectTypeList: ENRZAObjectTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRZAObjectType.TopRow + sgENRZAObjectType.VisibleRowCount) = ColCount
  then
    begin
      TempENRZAObjectType :=  HTTPRIOENRZAObjectType as ENRZAObjectTypeControllerSoapPort;
      CurrentRow:=sgENRZAObjectType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRZAObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRZAObjectTypeList := TempENRZAObjectType.getScrollableFilteredList(ENRZAObjectTypeFilter(FilterObject),ColCount-1, 100);



  sgENRZAObjectType.RowCount:=sgENRZAObjectType.RowCount+100;
  LastCount:=High(ENRZAObjectTypeList.list);
  with sgENRZAObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRZAObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRZAObjectTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRZAObjectTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRZAObjectType.Row:=CurrentRow-5;
   sgENRZAObjectType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRZAObjectTypeShow.sgENRZAObjectTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRZAObjectType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENRZAObjectTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENRZAObjectType.RowCount-1 do
   for j:=0 to sgENRZAObjectType.ColCount-1 do
     sgENRZAObjectType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENRZAObjectTypeShow.actViewExecute(Sender: TObject);
Var TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
begin
 TempENRZAObjectType := HTTPRIOENRZAObjectType as ENRZAObjectTypeControllerSoapPort;
   try
     ENRZAObjectTypeObj := TempENRZAObjectType.getObject(StrToInt(sgENRZAObjectType.Cells[0,sgENRZAObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRZAObjectTypeEdit:=TfrmENRZAObjectTypeEdit.Create(Application, dsView);
  try
    frmENRZAObjectTypeEdit.ShowModal;
  finally
    frmENRZAObjectTypeEdit.Free;
    frmENRZAObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENRZAObjectTypeShow.actEditExecute(Sender: TObject);
Var TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
begin
 TempENRZAObjectType := HTTPRIOENRZAObjectType as ENRZAObjectTypeControllerSoapPort;
   try
     ENRZAObjectTypeObj := TempENRZAObjectType.getObject(StrToInt(sgENRZAObjectType.Cells[0,sgENRZAObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRZAObjectTypeEdit:=TfrmENRZAObjectTypeEdit.Create(Application, dsEdit);
  try
    if frmENRZAObjectTypeEdit.ShowModal= mrOk then
      begin
        //TempENRZAObjectType.save(ENRZAObjectTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRZAObjectTypeEdit.Free;
    frmENRZAObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENRZAObjectTypeShow.actDeleteExecute(Sender: TObject);
Var TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRZAObjectType := HTTPRIOENRZAObjectType as ENRZAObjectTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRZAObjectType.Cells[0,sgENRZAObjectType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип обьекту РЗА) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRZAObjectType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRZAObjectTypeShow.actInsertExecute(Sender: TObject);
Var TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
begin
  TempENRZAObjectType := HTTPRIOENRZAObjectType as ENRZAObjectTypeControllerSoapPort;
  ENRZAObjectTypeObj:=ENRZAObjectType.Create;



  try
    frmENRZAObjectTypeEdit:=TfrmENRZAObjectTypeEdit.Create(Application, dsInsert);
    try
      if frmENRZAObjectTypeEdit.ShowModal = mrOk then
      begin
        if ENRZAObjectTypeObj<>nil then
            //TempENRZAObjectType.add(ENRZAObjectTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRZAObjectTypeEdit.Free;
      frmENRZAObjectTypeEdit:=nil;
    end;
  finally
    ENRZAObjectTypeObj.Free;
  end;
end;

procedure TfrmENRZAObjectTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENRZAObjectTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENRZAObjectTypeFilterEdit:=TfrmENRZAObjectTypeFilterEdit.Create(Application, dsEdit);
  try
    ENRZAObjectTypeFilterObj := ENRZAObjectTypeFilter.Create;
    SetNullIntProps(ENRZAObjectTypeFilterObj);
    SetNullXSProps(ENRZAObjectTypeFilterObj);

    if frmENRZAObjectTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENRZAObjectTypeFilter.Create;
      FilterObject := ENRZAObjectTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRZAObjectTypeFilterEdit.Free;
    frmENRZAObjectTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENRZAObjectTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.