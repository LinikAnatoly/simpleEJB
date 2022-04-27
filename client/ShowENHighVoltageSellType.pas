
unit ShowENHighVoltageSellType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENHighVoltageSellTypeController, AdvObj ;


type
  TfrmENHighVoltageSellTypeShow = class(TChildForm)  
  HTTPRIOENHighVoltageSellType: THTTPRIO;
    ImageList1: TImageList;
    sgENHighVoltageSellType: TAdvStringGrid;
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
procedure sgENHighVoltageSellTypeTopLeftChanged(Sender: TObject);
procedure sgENHighVoltageSellTypeDblClick(Sender: TObject);
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
 frmENHighVoltageSellTypeShow : TfrmENHighVoltageSellTypeShow;
 // ENHighVoltageSellTypeObj: ENHighVoltageSellType;
 // ENHighVoltageSellTypeFilterObj: ENHighVoltageSellTypeFilter;
  
  
implementation

uses Main, EditENHighVoltageSellType, EditENHighVoltageSellTypeFilter;


{$R *.dfm}

var
  //frmENHighVoltageSellTypeShow : TfrmENHighVoltageSellTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHighVoltageSellTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип высоковольтной ячейки'
        );
   

procedure TfrmENHighVoltageSellTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENHighVoltageSellTypeShow:=nil;
    inherited;
  end;


procedure TfrmENHighVoltageSellTypeShow.FormShow(Sender: TObject);
var
  TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
  i: Integer;
  ENHighVoltageSellTypeList: ENHighVoltageSellTypeShortList;
  begin
  SetGridHeaders(ENHighVoltageSellTypeHeaders, sgENHighVoltageSellType.ColumnHeaders);
  ColCount:=100;
  TempENHighVoltageSellType :=  HTTPRIOENHighVoltageSellType as ENHighVoltageSellTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHighVoltageSellTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHighVoltageSellTypeList := TempENHighVoltageSellType.getScrollableFilteredList(ENHighVoltageSellTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENHighVoltageSellTypeList.list);

  if LastCount > -1 then
     sgENHighVoltageSellType.RowCount:=LastCount+2
  else
     sgENHighVoltageSellType.RowCount:=2;

   with sgENHighVoltageSellType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltageSellTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHighVoltageSellTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENHighVoltageSellTypeList.list[i].name;
        LastRow:=i+1;
        sgENHighVoltageSellType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENHighVoltageSellType.Row:=1;
end;

procedure TfrmENHighVoltageSellTypeShow.sgENHighVoltageSellTypeTopLeftChanged(Sender: TObject);
var
  TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENHighVoltageSellTypeList: ENHighVoltageSellTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENHighVoltageSellType.TopRow + sgENHighVoltageSellType.VisibleRowCount) = ColCount
  then
    begin
      TempENHighVoltageSellType :=  HTTPRIOENHighVoltageSellType as ENHighVoltageSellTypeControllerSoapPort;
      CurrentRow:=sgENHighVoltageSellType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENHighVoltageSellTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHighVoltageSellTypeList := TempENHighVoltageSellType.getScrollableFilteredList(ENHighVoltageSellTypeFilter(FilterObject),ColCount-1, 100);



  sgENHighVoltageSellType.RowCount:=sgENHighVoltageSellType.RowCount+100;
  LastCount:=High(ENHighVoltageSellTypeList.list);
  with sgENHighVoltageSellType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltageSellTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHighVoltageSellTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENHighVoltageSellTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHighVoltageSellType.Row:=CurrentRow-5;
   sgENHighVoltageSellType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENHighVoltageSellTypeShow.sgENHighVoltageSellTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHighVoltageSellType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENHighVoltageSellTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENHighVoltageSellType.RowCount-1 do
   for j:=0 to sgENHighVoltageSellType.ColCount-1 do
     sgENHighVoltageSellType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENHighVoltageSellTypeShow.actViewExecute(Sender: TObject);
Var TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
begin
 TempENHighVoltageSellType := HTTPRIOENHighVoltageSellType as ENHighVoltageSellTypeControllerSoapPort;
   try
     ENHighVoltageSellTypeObj := TempENHighVoltageSellType.getObject(StrToInt(sgENHighVoltageSellType.Cells[0,sgENHighVoltageSellType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHighVoltageSellTypeEdit:=TfrmENHighVoltageSellTypeEdit.Create(Application, dsView);
  try
    frmENHighVoltageSellTypeEdit.ShowModal;
  finally
    frmENHighVoltageSellTypeEdit.Free;
    frmENHighVoltageSellTypeEdit:=nil;
  end;
end;

procedure TfrmENHighVoltageSellTypeShow.actEditExecute(Sender: TObject);
Var TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
begin
 TempENHighVoltageSellType := HTTPRIOENHighVoltageSellType as ENHighVoltageSellTypeControllerSoapPort;
   try
     ENHighVoltageSellTypeObj := TempENHighVoltageSellType.getObject(StrToInt(sgENHighVoltageSellType.Cells[0,sgENHighVoltageSellType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHighVoltageSellTypeEdit:=TfrmENHighVoltageSellTypeEdit.Create(Application, dsEdit);
  try
    if frmENHighVoltageSellTypeEdit.ShowModal= mrOk then
      begin
        //TempENHighVoltageSellType.save(ENHighVoltageSellTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHighVoltageSellTypeEdit.Free;
    frmENHighVoltageSellTypeEdit:=nil;
  end;
end;

procedure TfrmENHighVoltageSellTypeShow.actDeleteExecute(Sender: TObject);
Var TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENHighVoltageSellType := HTTPRIOENHighVoltageSellType as ENHighVoltageSellTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENHighVoltageSellType.Cells[0,sgENHighVoltageSellType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип высоковольтной ячейки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHighVoltageSellType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENHighVoltageSellTypeShow.actInsertExecute(Sender: TObject);
Var TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
begin
  TempENHighVoltageSellType := HTTPRIOENHighVoltageSellType as ENHighVoltageSellTypeControllerSoapPort;
  ENHighVoltageSellTypeObj:=ENHighVoltageSellType.Create;



  try
    frmENHighVoltageSellTypeEdit:=TfrmENHighVoltageSellTypeEdit.Create(Application, dsInsert);
    try
      if frmENHighVoltageSellTypeEdit.ShowModal = mrOk then
      begin
        if ENHighVoltageSellTypeObj<>nil then
            //TempENHighVoltageSellType.add(ENHighVoltageSellTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHighVoltageSellTypeEdit.Free;
      frmENHighVoltageSellTypeEdit:=nil;
    end;
  finally
    ENHighVoltageSellTypeObj.Free;
  end;
end;

procedure TfrmENHighVoltageSellTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENHighVoltageSellTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENHighVoltageSellTypeFilterEdit:=TfrmENHighVoltageSellTypeFilterEdit.Create(Application, dsInsert);
  try
    ENHighVoltageSellTypeFilterObj := ENHighVoltageSellTypeFilter.Create;
    SetNullIntProps(ENHighVoltageSellTypeFilterObj);
    SetNullXSProps(ENHighVoltageSellTypeFilterObj);

    if frmENHighVoltageSellTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHighVoltageSellTypeFilter.Create;
      FilterObject := ENHighVoltageSellTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHighVoltageSellTypeFilterEdit.Free;
    frmENHighVoltageSellTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENHighVoltageSellTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.