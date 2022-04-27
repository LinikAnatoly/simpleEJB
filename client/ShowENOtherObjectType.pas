
unit ShowENOtherObjectType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENOtherObjectTypeController ;


type
  TfrmENOtherObjectTypeShow = class(TChildForm)  
  HTTPRIOENOtherObjectType: THTTPRIO;
    ImageList1: TImageList;
    sgENOtherObjectType: TAdvStringGrid;
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
procedure sgENOtherObjectTypeTopLeftChanged(Sender: TObject);
procedure sgENOtherObjectTypeDblClick(Sender: TObject);
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
 // ENOtherObjectTypeObj: ENOtherObjectType;
 // ENOtherObjectTypeFilterObj: ENOtherObjectTypeFilter;
  
  
implementation

uses Main, EditENOtherObjectType, EditENOtherObjectTypeFilter;


{$R *.dfm}

var
  //frmENOtherObjectTypeShow : TfrmENOtherObjectTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENOtherObjectTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENOtherObjectTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENOtherObjectTypeShow:=nil;
    inherited;
  end;


procedure TfrmENOtherObjectTypeShow.FormShow(Sender: TObject);
var
  TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
  i: Integer;
  ENOtherObjectTypeList: ENOtherObjectTypeShortList;
  begin
  SetGridHeaders(ENOtherObjectTypeHeaders, sgENOtherObjectType.ColumnHeaders);
  ColCount:=100;
  TempENOtherObjectType :=  HTTPRIOENOtherObjectType as ENOtherObjectTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENOtherObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENOtherObjectTypeList := TempENOtherObjectType.getScrollableFilteredList(ENOtherObjectTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENOtherObjectTypeList.list);

  if LastCount > -1 then
     sgENOtherObjectType.RowCount:=LastCount+2
  else
     sgENOtherObjectType.RowCount:=2;

   with sgENOtherObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENOtherObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENOtherObjectTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENOtherObjectTypeList.list[i].name;
        LastRow:=i+1;
        sgENOtherObjectType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENOtherObjectType.Row:=1;
end;

procedure TfrmENOtherObjectTypeShow.sgENOtherObjectTypeTopLeftChanged(Sender: TObject);
var
  TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENOtherObjectTypeList: ENOtherObjectTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENOtherObjectType.TopRow + sgENOtherObjectType.VisibleRowCount) = ColCount
  then
    begin
      TempENOtherObjectType :=  HTTPRIOENOtherObjectType as ENOtherObjectTypeControllerSoapPort;
      CurrentRow:=sgENOtherObjectType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENOtherObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENOtherObjectTypeList := TempENOtherObjectType.getScrollableFilteredList(ENOtherObjectTypeFilter(FilterObject),ColCount-1, 100);



  sgENOtherObjectType.RowCount:=sgENOtherObjectType.RowCount+100;
  LastCount:=High(ENOtherObjectTypeList.list);
  with sgENOtherObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENOtherObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENOtherObjectTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENOtherObjectTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENOtherObjectType.Row:=CurrentRow-5;
   sgENOtherObjectType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENOtherObjectTypeShow.sgENOtherObjectTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENOtherObjectType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENOtherObjectTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENOtherObjectType.RowCount-1 do
   for j:=0 to sgENOtherObjectType.ColCount-1 do
     sgENOtherObjectType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENOtherObjectTypeShow.actViewExecute(Sender: TObject);
Var TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
begin
 TempENOtherObjectType := HTTPRIOENOtherObjectType as ENOtherObjectTypeControllerSoapPort;
   try
     ENOtherObjectTypeObj := TempENOtherObjectType.getObject(StrToInt(sgENOtherObjectType.Cells[0,sgENOtherObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOtherObjectTypeEdit:=TfrmENOtherObjectTypeEdit.Create(Application, dsView);
  try
    frmENOtherObjectTypeEdit.ShowModal;
  finally
    frmENOtherObjectTypeEdit.Free;
    frmENOtherObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENOtherObjectTypeShow.actEditExecute(Sender: TObject);
Var TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
begin
 TempENOtherObjectType := HTTPRIOENOtherObjectType as ENOtherObjectTypeControllerSoapPort;
   try
     ENOtherObjectTypeObj := TempENOtherObjectType.getObject(StrToInt(sgENOtherObjectType.Cells[0,sgENOtherObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOtherObjectTypeEdit:=TfrmENOtherObjectTypeEdit.Create(Application, dsEdit);
  try
    if frmENOtherObjectTypeEdit.ShowModal= mrOk then
      begin
        //TempENOtherObjectType.save(ENOtherObjectTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENOtherObjectTypeEdit.Free;
    frmENOtherObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENOtherObjectTypeShow.actDeleteExecute(Sender: TObject);
Var TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENOtherObjectType := HTTPRIOENOtherObjectType as ENOtherObjectTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENOtherObjectType.Cells[0,sgENOtherObjectType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи інші обьєктів з Інв. номером) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENOtherObjectType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENOtherObjectTypeShow.actInsertExecute(Sender: TObject);
Var TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
begin
  TempENOtherObjectType := HTTPRIOENOtherObjectType as ENOtherObjectTypeControllerSoapPort;
  ENOtherObjectTypeObj:=ENOtherObjectType.Create;



  try
    frmENOtherObjectTypeEdit:=TfrmENOtherObjectTypeEdit.Create(Application, dsInsert);
    try
      if frmENOtherObjectTypeEdit.ShowModal = mrOk then
      begin
        if ENOtherObjectTypeObj<>nil then
            //TempENOtherObjectType.add(ENOtherObjectTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENOtherObjectTypeEdit.Free;
      frmENOtherObjectTypeEdit:=nil;
    end;
  finally
    ENOtherObjectTypeObj.Free;
  end;
end;

procedure TfrmENOtherObjectTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENOtherObjectTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENOtherObjectTypeFilterEdit:=TfrmENOtherObjectTypeFilterEdit.Create(Application, dsEdit);
  try
    ENOtherObjectTypeFilterObj := ENOtherObjectTypeFilter.Create;
    SetNullIntProps(ENOtherObjectTypeFilterObj);
    SetNullXSProps(ENOtherObjectTypeFilterObj);

    if frmENOtherObjectTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENOtherObjectTypeFilter.Create;
      FilterObject := ENOtherObjectTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENOtherObjectTypeFilterEdit.Free;
    frmENOtherObjectTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENOtherObjectTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.