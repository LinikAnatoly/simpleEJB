
unit ShowENSDTUObjectType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSDTUObjectTypeController ;


type
  TfrmENSDTUObjectTypeShow = class(TChildForm)  
  HTTPRIOENSDTUObjectType: THTTPRIO;
    ImageList1: TImageList;
    sgENSDTUObjectType: TAdvStringGrid;
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
procedure sgENSDTUObjectTypeTopLeftChanged(Sender: TObject);
procedure sgENSDTUObjectTypeDblClick(Sender: TObject);
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
 // ENSDTUObjectTypeObj: ENSDTUObjectType;
 // ENSDTUObjectTypeFilterObj: ENSDTUObjectTypeFilter;
  
  
implementation

uses Main, EditENSDTUObjectType, EditENSDTUObjectTypeFilter;


{$R *.dfm}

var
  //frmENSDTUObjectTypeShow : TfrmENSDTUObjectTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSDTUObjectTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип обьекту СДТУ'
        );
   

procedure TfrmENSDTUObjectTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSDTUObjectTypeShow:=nil;
    inherited;
  end;


procedure TfrmENSDTUObjectTypeShow.FormShow(Sender: TObject);
var
  TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
  i: Integer;
  ENSDTUObjectTypeList: ENSDTUObjectTypeShortList;
  begin
  SetGridHeaders(ENSDTUObjectTypeHeaders, sgENSDTUObjectType.ColumnHeaders);
  ColCount:=100;
  TempENSDTUObjectType :=  HTTPRIOENSDTUObjectType as ENSDTUObjectTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSDTUObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSDTUObjectTypeList := TempENSDTUObjectType.getScrollableFilteredList(ENSDTUObjectTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSDTUObjectTypeList.list);

  if LastCount > -1 then
     sgENSDTUObjectType.RowCount:=LastCount+2
  else
     sgENSDTUObjectType.RowCount:=2;

   with sgENSDTUObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSDTUObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSDTUObjectTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSDTUObjectTypeList.list[i].name;
        LastRow:=i+1;
        sgENSDTUObjectType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSDTUObjectType.Row:=1;
end;

procedure TfrmENSDTUObjectTypeShow.sgENSDTUObjectTypeTopLeftChanged(Sender: TObject);
var
  TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSDTUObjectTypeList: ENSDTUObjectTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSDTUObjectType.TopRow + sgENSDTUObjectType.VisibleRowCount) = ColCount
  then
    begin
      TempENSDTUObjectType :=  HTTPRIOENSDTUObjectType as ENSDTUObjectTypeControllerSoapPort;
      CurrentRow:=sgENSDTUObjectType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSDTUObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSDTUObjectTypeList := TempENSDTUObjectType.getScrollableFilteredList(ENSDTUObjectTypeFilter(FilterObject),ColCount-1, 100);



  sgENSDTUObjectType.RowCount:=sgENSDTUObjectType.RowCount+100;
  LastCount:=High(ENSDTUObjectTypeList.list);
  with sgENSDTUObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSDTUObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSDTUObjectTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSDTUObjectTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSDTUObjectType.Row:=CurrentRow-5;
   sgENSDTUObjectType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSDTUObjectTypeShow.sgENSDTUObjectTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSDTUObjectType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSDTUObjectTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSDTUObjectType.RowCount-1 do
   for j:=0 to sgENSDTUObjectType.ColCount-1 do
     sgENSDTUObjectType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSDTUObjectTypeShow.actViewExecute(Sender: TObject);
Var TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
begin
 TempENSDTUObjectType := HTTPRIOENSDTUObjectType as ENSDTUObjectTypeControllerSoapPort;
   try
     ENSDTUObjectTypeObj := TempENSDTUObjectType.getObject(StrToInt(sgENSDTUObjectType.Cells[0,sgENSDTUObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSDTUObjectTypeEdit:=TfrmENSDTUObjectTypeEdit.Create(Application, dsView);
  try
    frmENSDTUObjectTypeEdit.ShowModal;
  finally
    frmENSDTUObjectTypeEdit.Free;
    frmENSDTUObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENSDTUObjectTypeShow.actEditExecute(Sender: TObject);
Var TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
begin
 TempENSDTUObjectType := HTTPRIOENSDTUObjectType as ENSDTUObjectTypeControllerSoapPort;
   try
     ENSDTUObjectTypeObj := TempENSDTUObjectType.getObject(StrToInt(sgENSDTUObjectType.Cells[0,sgENSDTUObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSDTUObjectTypeEdit:=TfrmENSDTUObjectTypeEdit.Create(Application, dsEdit);
  try
    if frmENSDTUObjectTypeEdit.ShowModal= mrOk then
      begin
        //TempENSDTUObjectType.save(ENSDTUObjectTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSDTUObjectTypeEdit.Free;
    frmENSDTUObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENSDTUObjectTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSDTUObjectType := HTTPRIOENSDTUObjectType as ENSDTUObjectTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSDTUObjectType.Cells[0,sgENSDTUObjectType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип обьекту СДТУ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSDTUObjectType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSDTUObjectTypeShow.actInsertExecute(Sender: TObject);
Var TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
begin
  TempENSDTUObjectType := HTTPRIOENSDTUObjectType as ENSDTUObjectTypeControllerSoapPort;
  ENSDTUObjectTypeObj:=ENSDTUObjectType.Create;



  try
    frmENSDTUObjectTypeEdit:=TfrmENSDTUObjectTypeEdit.Create(Application, dsInsert);
    try
      if frmENSDTUObjectTypeEdit.ShowModal = mrOk then
      begin
        if ENSDTUObjectTypeObj<>nil then
            //TempENSDTUObjectType.add(ENSDTUObjectTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSDTUObjectTypeEdit.Free;
      frmENSDTUObjectTypeEdit:=nil;
    end;
  finally
    ENSDTUObjectTypeObj.Free;
  end;
end;

procedure TfrmENSDTUObjectTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSDTUObjectTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSDTUObjectTypeFilterEdit:=TfrmENSDTUObjectTypeFilterEdit.Create(Application, dsEdit);
  try
    ENSDTUObjectTypeFilterObj := ENSDTUObjectTypeFilter.Create;
    SetNullIntProps(ENSDTUObjectTypeFilterObj);
    SetNullXSProps(ENSDTUObjectTypeFilterObj);

    if frmENSDTUObjectTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSDTUObjectTypeFilter.Create;
      FilterObject := ENSDTUObjectTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSDTUObjectTypeFilterEdit.Free;
    frmENSDTUObjectTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENSDTUObjectTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.