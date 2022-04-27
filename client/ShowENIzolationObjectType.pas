
unit ShowENIzolationObjectType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENIzolationObjectTypeController ;


type
  TfrmENIzolationObjectTypeShow = class(TChildForm)  
  HTTPRIOENIzolationObjectType: THTTPRIO;
    ImageList1: TImageList;
    sgENIzolationObjectType: TAdvStringGrid;
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
procedure sgENIzolationObjectTypeTopLeftChanged(Sender: TObject);
procedure sgENIzolationObjectTypeDblClick(Sender: TObject);
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
 // ENIzolationObjectTypeObj: ENIzolationObjectType;
 // ENIzolationObjectTypeFilterObj: ENIzolationObjectTypeFilter;
  
  
implementation

uses Main, EditENIzolationObjectType, EditENIzolationObjectTypeFilter;


{$R *.dfm}

var
  //frmENIzolationObjectTypeShow : TfrmENIzolationObjectTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENIzolationObjectTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип обьекту Ізоляції'
        );
   

procedure TfrmENIzolationObjectTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENIzolationObjectTypeShow:=nil;
    inherited;
  end;


procedure TfrmENIzolationObjectTypeShow.FormShow(Sender: TObject);
var
  TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
  i: Integer;
  ENIzolationObjectTypeList: ENIzolationObjectTypeShortList;
  begin
  SetGridHeaders(ENIzolationObjectTypeHeaders, sgENIzolationObjectType.ColumnHeaders);
  ColCount:=100;
  TempENIzolationObjectType :=  HTTPRIOENIzolationObjectType as ENIzolationObjectTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENIzolationObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIzolationObjectTypeList := TempENIzolationObjectType.getScrollableFilteredList(ENIzolationObjectTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENIzolationObjectTypeList.list);

  if LastCount > -1 then
     sgENIzolationObjectType.RowCount:=LastCount+2
  else
     sgENIzolationObjectType.RowCount:=2;

   with sgENIzolationObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIzolationObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIzolationObjectTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENIzolationObjectTypeList.list[i].name;
        LastRow:=i+1;
        sgENIzolationObjectType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENIzolationObjectType.Row:=1;
end;

procedure TfrmENIzolationObjectTypeShow.sgENIzolationObjectTypeTopLeftChanged(Sender: TObject);
var
  TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENIzolationObjectTypeList: ENIzolationObjectTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENIzolationObjectType.TopRow + sgENIzolationObjectType.VisibleRowCount) = ColCount
  then
    begin
      TempENIzolationObjectType :=  HTTPRIOENIzolationObjectType as ENIzolationObjectTypeControllerSoapPort;
      CurrentRow:=sgENIzolationObjectType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENIzolationObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIzolationObjectTypeList := TempENIzolationObjectType.getScrollableFilteredList(ENIzolationObjectTypeFilter(FilterObject),ColCount-1, 100);



  sgENIzolationObjectType.RowCount:=sgENIzolationObjectType.RowCount+100;
  LastCount:=High(ENIzolationObjectTypeList.list);
  with sgENIzolationObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIzolationObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENIzolationObjectTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENIzolationObjectTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENIzolationObjectType.Row:=CurrentRow-5;
   sgENIzolationObjectType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENIzolationObjectTypeShow.sgENIzolationObjectTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENIzolationObjectType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENIzolationObjectTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENIzolationObjectType.RowCount-1 do
   for j:=0 to sgENIzolationObjectType.ColCount-1 do
     sgENIzolationObjectType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENIzolationObjectTypeShow.actViewExecute(Sender: TObject);
Var TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
begin
 TempENIzolationObjectType := HTTPRIOENIzolationObjectType as ENIzolationObjectTypeControllerSoapPort;
   try
     ENIzolationObjectTypeObj := TempENIzolationObjectType.getObject(StrToInt(sgENIzolationObjectType.Cells[0,sgENIzolationObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIzolationObjectTypeEdit:=TfrmENIzolationObjectTypeEdit.Create(Application, dsView);
  try
    frmENIzolationObjectTypeEdit.ShowModal;
  finally
    frmENIzolationObjectTypeEdit.Free;
    frmENIzolationObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENIzolationObjectTypeShow.actEditExecute(Sender: TObject);
Var TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
begin
 TempENIzolationObjectType := HTTPRIOENIzolationObjectType as ENIzolationObjectTypeControllerSoapPort;
   try
     ENIzolationObjectTypeObj := TempENIzolationObjectType.getObject(StrToInt(sgENIzolationObjectType.Cells[0,sgENIzolationObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIzolationObjectTypeEdit:=TfrmENIzolationObjectTypeEdit.Create(Application, dsEdit);
  try
    if frmENIzolationObjectTypeEdit.ShowModal= mrOk then
      begin
        //TempENIzolationObjectType.save(ENIzolationObjectTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENIzolationObjectTypeEdit.Free;
    frmENIzolationObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENIzolationObjectTypeShow.actDeleteExecute(Sender: TObject);
Var TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIzolationObjectType := HTTPRIOENIzolationObjectType as ENIzolationObjectTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIzolationObjectType.Cells[0,sgENIzolationObjectType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип обьекту Ізоляції) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIzolationObjectType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENIzolationObjectTypeShow.actInsertExecute(Sender: TObject);
Var TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
begin
  TempENIzolationObjectType := HTTPRIOENIzolationObjectType as ENIzolationObjectTypeControllerSoapPort;
  ENIzolationObjectTypeObj:=ENIzolationObjectType.Create;



  try
    frmENIzolationObjectTypeEdit:=TfrmENIzolationObjectTypeEdit.Create(Application, dsInsert);
    try
      if frmENIzolationObjectTypeEdit.ShowModal = mrOk then
      begin
        if ENIzolationObjectTypeObj<>nil then
            //TempENIzolationObjectType.add(ENIzolationObjectTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENIzolationObjectTypeEdit.Free;
      frmENIzolationObjectTypeEdit:=nil;
    end;
  finally
    ENIzolationObjectTypeObj.Free;
  end;
end;

procedure TfrmENIzolationObjectTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENIzolationObjectTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENIzolationObjectTypeFilterEdit:=TfrmENIzolationObjectTypeFilterEdit.Create(Application, dsEdit);
  try
    ENIzolationObjectTypeFilterObj := ENIzolationObjectTypeFilter.Create;
    SetNullIntProps(ENIzolationObjectTypeFilterObj);
    SetNullXSProps(ENIzolationObjectTypeFilterObj);

    if frmENIzolationObjectTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENIzolationObjectTypeFilter.Create;
      FilterObject := ENIzolationObjectTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIzolationObjectTypeFilterEdit.Free;
    frmENIzolationObjectTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENIzolationObjectTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.