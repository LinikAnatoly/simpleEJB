
unit ShowENDistanceType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDistanceTypeController ;


type
  TfrmENDistanceTypeShow = class(TChildForm)  
  HTTPRIOENDistanceType: THTTPRIO;
    ImageList1: TImageList;
    sgENDistanceType: TAdvStringGrid;
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
procedure sgENDistanceTypeTopLeftChanged(Sender: TObject);
procedure sgENDistanceTypeDblClick(Sender: TObject);
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
 // ENDistanceTypeObj: ENDistanceType;
 // ENDistanceTypeFilterObj: ENDistanceTypeFilter;
  
  
implementation

uses Main, EditENDistanceType, EditENDistanceTypeFilter;


{$R *.dfm}

var
  //frmENDistanceTypeShow : TfrmENDistanceTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDistanceTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип відстані (до, по, з об"екту)'
        );
   

procedure TfrmENDistanceTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDistanceTypeShow:=nil;
    inherited;
  end;


procedure TfrmENDistanceTypeShow.FormShow(Sender: TObject);
var
  TempENDistanceType: ENDistanceTypeControllerSoapPort;
  i: Integer;
  ENDistanceTypeList: ENDistanceTypeShortList;
  begin
  SetGridHeaders(ENDistanceTypeHeaders, sgENDistanceType.ColumnHeaders);
  ColCount:=100;
  TempENDistanceType :=  HTTPRIOENDistanceType as ENDistanceTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDistanceTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDistanceTypeList := TempENDistanceType.getScrollableFilteredList(ENDistanceTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDistanceTypeList.list);

  if LastCount > -1 then
     sgENDistanceType.RowCount:=LastCount+2
  else
     sgENDistanceType.RowCount:=2;

   with sgENDistanceType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDistanceTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDistanceTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDistanceTypeList.list[i].name;
        LastRow:=i+1;
        sgENDistanceType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDistanceType.Row:=1;
end;

procedure TfrmENDistanceTypeShow.sgENDistanceTypeTopLeftChanged(Sender: TObject);
var
  TempENDistanceType: ENDistanceTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDistanceTypeList: ENDistanceTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDistanceType.TopRow + sgENDistanceType.VisibleRowCount) = ColCount
  then
    begin
      TempENDistanceType :=  HTTPRIOENDistanceType as ENDistanceTypeControllerSoapPort;
      CurrentRow:=sgENDistanceType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDistanceTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDistanceTypeList := TempENDistanceType.getScrollableFilteredList(ENDistanceTypeFilter(FilterObject),ColCount-1, 100);



  sgENDistanceType.RowCount:=sgENDistanceType.RowCount+100;
  LastCount:=High(ENDistanceTypeList.list);
  with sgENDistanceType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDistanceTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDistanceTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDistanceTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDistanceType.Row:=CurrentRow-5;
   sgENDistanceType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDistanceTypeShow.sgENDistanceTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDistanceType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDistanceTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDistanceType.RowCount-1 do
   for j:=0 to sgENDistanceType.ColCount-1 do
     sgENDistanceType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDistanceTypeShow.actViewExecute(Sender: TObject);
Var TempENDistanceType: ENDistanceTypeControllerSoapPort;
begin
 TempENDistanceType := HTTPRIOENDistanceType as ENDistanceTypeControllerSoapPort;
   try
     ENDistanceTypeObj := TempENDistanceType.getObject(StrToInt(sgENDistanceType.Cells[0,sgENDistanceType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDistanceTypeEdit:=TfrmENDistanceTypeEdit.Create(Application, dsView);
  try
    frmENDistanceTypeEdit.ShowModal;
  finally
    frmENDistanceTypeEdit.Free;
    frmENDistanceTypeEdit:=nil;
  end;
end;

procedure TfrmENDistanceTypeShow.actEditExecute(Sender: TObject);
Var TempENDistanceType: ENDistanceTypeControllerSoapPort;
begin
 TempENDistanceType := HTTPRIOENDistanceType as ENDistanceTypeControllerSoapPort;
   try
     ENDistanceTypeObj := TempENDistanceType.getObject(StrToInt(sgENDistanceType.Cells[0,sgENDistanceType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDistanceTypeEdit:=TfrmENDistanceTypeEdit.Create(Application, dsEdit);
  try
    if frmENDistanceTypeEdit.ShowModal= mrOk then
      begin
        //TempENDistanceType.save(ENDistanceTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDistanceTypeEdit.Free;
    frmENDistanceTypeEdit:=nil;
  end;
end;

procedure TfrmENDistanceTypeShow.actDeleteExecute(Sender: TObject);
Var TempENDistanceType: ENDistanceTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDistanceType := HTTPRIOENDistanceType as ENDistanceTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDistanceType.Cells[0,sgENDistanceType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип відстані) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDistanceType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDistanceTypeShow.actInsertExecute(Sender: TObject);
Var TempENDistanceType: ENDistanceTypeControllerSoapPort;
begin
  TempENDistanceType := HTTPRIOENDistanceType as ENDistanceTypeControllerSoapPort;
  ENDistanceTypeObj:=ENDistanceType.Create;



  try
    frmENDistanceTypeEdit:=TfrmENDistanceTypeEdit.Create(Application, dsInsert);
    try
      if frmENDistanceTypeEdit.ShowModal = mrOk then
      begin
        if ENDistanceTypeObj<>nil then
            //TempENDistanceType.add(ENDistanceTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDistanceTypeEdit.Free;
      frmENDistanceTypeEdit:=nil;
    end;
  finally
    ENDistanceTypeObj.Free;
  end;
end;

procedure TfrmENDistanceTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDistanceTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENDistanceTypeFilterEdit:=TfrmENDistanceTypeFilterEdit.Create(Application, dsEdit);
  try
    ENDistanceTypeFilterObj := ENDistanceTypeFilter.Create;
    SetNullIntProps(ENDistanceTypeFilterObj);
    SetNullXSProps(ENDistanceTypeFilterObj);

    if frmENDistanceTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDistanceTypeFilter.Create;
      FilterObject := ENDistanceTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDistanceTypeFilterEdit.Free;
    frmENDistanceTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENDistanceTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.