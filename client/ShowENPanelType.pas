
unit ShowENPanelType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPanelTypeController, AdvObj ;


type
  TfrmENPanelTypeShow = class(TChildForm)  
  HTTPRIOENPanelType: THTTPRIO;
    ImageList1: TImageList;
    sgENPanelType: TAdvStringGrid;
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
procedure sgENPanelTypeTopLeftChanged(Sender: TObject);
procedure sgENPanelTypeDblClick(Sender: TObject);
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
 frmENPanelTypeShow : TfrmENPanelTypeShow;
 // ENPanelTypeObj: ENPanelType;
 // ENPanelTypeFilterObj: ENPanelTypeFilter;
  
  
implementation

uses Main, EditENPanelType, EditENPanelTypeFilter;


{$R *.dfm}

var
  //frmENPanelTypeShow : TfrmENPanelTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPanelTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип панели'
        );
   

procedure TfrmENPanelTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPanelTypeShow:=nil;
    inherited;
  end;


procedure TfrmENPanelTypeShow.FormShow(Sender: TObject);
var
  TempENPanelType: ENPanelTypeControllerSoapPort;
  i: Integer;
  ENPanelTypeList: ENPanelTypeShortList;
  begin
  SetGridHeaders(ENPanelTypeHeaders, sgENPanelType.ColumnHeaders);
  ColCount:=100;
  TempENPanelType :=  HTTPRIOENPanelType as ENPanelTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPanelTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPanelTypeList := TempENPanelType.getScrollableFilteredList(ENPanelTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPanelTypeList.list);

  if LastCount > -1 then
     sgENPanelType.RowCount:=LastCount+2
  else
     sgENPanelType.RowCount:=2;

   with sgENPanelType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPanelTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPanelTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPanelTypeList.list[i].name;
        LastRow:=i+1;
        sgENPanelType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPanelType.Row:=1;
end;

procedure TfrmENPanelTypeShow.sgENPanelTypeTopLeftChanged(Sender: TObject);
var
  TempENPanelType: ENPanelTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENPanelTypeList: ENPanelTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPanelType.TopRow + sgENPanelType.VisibleRowCount) = ColCount
  then
    begin
      TempENPanelType :=  HTTPRIOENPanelType as ENPanelTypeControllerSoapPort;
      CurrentRow:=sgENPanelType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPanelTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPanelTypeList := TempENPanelType.getScrollableFilteredList(ENPanelTypeFilter(FilterObject),ColCount-1, 100);



  sgENPanelType.RowCount:=sgENPanelType.RowCount+100;
  LastCount:=High(ENPanelTypeList.list);
  with sgENPanelType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPanelTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPanelTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPanelTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPanelType.Row:=CurrentRow-5;
   sgENPanelType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPanelTypeShow.sgENPanelTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPanelType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPanelTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPanelType.RowCount-1 do
   for j:=0 to sgENPanelType.ColCount-1 do
     sgENPanelType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPanelTypeShow.actViewExecute(Sender: TObject);
Var TempENPanelType: ENPanelTypeControllerSoapPort;
begin
 TempENPanelType := HTTPRIOENPanelType as ENPanelTypeControllerSoapPort;
   try
     ENPanelTypeObj := TempENPanelType.getObject(StrToInt(sgENPanelType.Cells[0,sgENPanelType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPanelTypeEdit:=TfrmENPanelTypeEdit.Create(Application, dsView);
  try
    frmENPanelTypeEdit.ShowModal;
  finally
    frmENPanelTypeEdit.Free;
    frmENPanelTypeEdit:=nil;
  end;
end;

procedure TfrmENPanelTypeShow.actEditExecute(Sender: TObject);
Var TempENPanelType: ENPanelTypeControllerSoapPort;
begin
 TempENPanelType := HTTPRIOENPanelType as ENPanelTypeControllerSoapPort;
   try
     ENPanelTypeObj := TempENPanelType.getObject(StrToInt(sgENPanelType.Cells[0,sgENPanelType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPanelTypeEdit:=TfrmENPanelTypeEdit.Create(Application, dsEdit);
  try
    if frmENPanelTypeEdit.ShowModal= mrOk then
      begin
        //TempENPanelType.save(ENPanelTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPanelTypeEdit.Free;
    frmENPanelTypeEdit:=nil;
  end;
end;

procedure TfrmENPanelTypeShow.actDeleteExecute(Sender: TObject);
Var TempENPanelType: ENPanelTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPanelType := HTTPRIOENPanelType as ENPanelTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPanelType.Cells[0,sgENPanelType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типы панелей) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPanelType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPanelTypeShow.actInsertExecute(Sender: TObject);
Var TempENPanelType: ENPanelTypeControllerSoapPort;
begin
  TempENPanelType := HTTPRIOENPanelType as ENPanelTypeControllerSoapPort;
  ENPanelTypeObj:=ENPanelType.Create;



  try
    frmENPanelTypeEdit:=TfrmENPanelTypeEdit.Create(Application, dsInsert);
    try
      if frmENPanelTypeEdit.ShowModal = mrOk then
      begin
        if ENPanelTypeObj<>nil then
            //TempENPanelType.add(ENPanelTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPanelTypeEdit.Free;
      frmENPanelTypeEdit:=nil;
    end;
  finally
    ENPanelTypeObj.Free;
  end;
end;

procedure TfrmENPanelTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPanelTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENPanelTypeFilterEdit:=TfrmENPanelTypeFilterEdit.Create(Application, dsInsert);
  try
    ENPanelTypeFilterObj := ENPanelTypeFilter.Create;
    SetNullIntProps(ENPanelTypeFilterObj);
    SetNullXSProps(ENPanelTypeFilterObj);

    if frmENPanelTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPanelTypeFilter.Create;
      FilterObject := ENPanelTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPanelTypeFilterEdit.Free;
    frmENPanelTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENPanelTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.