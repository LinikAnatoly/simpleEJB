
unit ShowENSubstationType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubstationTypeController, AdvObj ;


type
  TfrmENSubstationTypeShow = class(TChildForm)  
  HTTPRIOENSubstationType: THTTPRIO;
    ImageList1: TImageList;
    sgENSubstationType: TAdvStringGrid;
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
procedure sgENSubstationTypeTopLeftChanged(Sender: TObject);
procedure sgENSubstationTypeDblClick(Sender: TObject);
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
 frmENSubstationTypeShow : TfrmENSubstationTypeShow;
 // ENSubstationTypeObj: ENSubstationType;
 // ENSubstationTypeFilterObj: ENSubstationTypeFilter;
  
  
implementation

uses Main, EditENSubstationType, EditENSubstationTypeFilter;


{$R *.dfm}

var
  //frmENSubstationTypeShow : TfrmENSubstationTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubstationTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип підстанції'
        );
   

procedure TfrmENSubstationTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubstationTypeShow:=nil;
    inherited;
  end;


procedure TfrmENSubstationTypeShow.FormShow(Sender: TObject);
var
  TempENSubstationType: ENSubstationTypeControllerSoapPort;
  i: Integer;
  ENSubstationTypeList: ENSubstationTypeShortList;
  begin
  SetGridHeaders(ENSubstationTypeHeaders, sgENSubstationType.ColumnHeaders);
  ColCount:=100;
  TempENSubstationType :=  HTTPRIOENSubstationType as ENSubstationTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubstationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubstationTypeList := TempENSubstationType.getScrollableFilteredList(ENSubstationTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubstationTypeList.list);

  if LastCount > -1 then
     sgENSubstationType.RowCount:=LastCount+2
  else
     sgENSubstationType.RowCount:=2;

   with sgENSubstationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubstationTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubstationTypeList.list[i].name;
        LastRow:=i+1;
        sgENSubstationType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubstationType.Row:=1;
end;

procedure TfrmENSubstationTypeShow.sgENSubstationTypeTopLeftChanged(Sender: TObject);
var
  TempENSubstationType: ENSubstationTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubstationTypeList: ENSubstationTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubstationType.TopRow + sgENSubstationType.VisibleRowCount) = ColCount
  then
    begin
      TempENSubstationType :=  HTTPRIOENSubstationType as ENSubstationTypeControllerSoapPort;
      CurrentRow:=sgENSubstationType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubstationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubstationTypeList := TempENSubstationType.getScrollableFilteredList(ENSubstationTypeFilter(FilterObject),ColCount-1, 100);



  sgENSubstationType.RowCount:=sgENSubstationType.RowCount+100;
  LastCount:=High(ENSubstationTypeList.list);
  with sgENSubstationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubstationTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubstationTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubstationType.Row:=CurrentRow-5;
   sgENSubstationType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubstationTypeShow.sgENSubstationTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubstationType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubstationTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubstationType.RowCount-1 do
   for j:=0 to sgENSubstationType.ColCount-1 do
     sgENSubstationType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubstationTypeShow.actViewExecute(Sender: TObject);
Var TempENSubstationType: ENSubstationTypeControllerSoapPort;
begin
 TempENSubstationType := HTTPRIOENSubstationType as ENSubstationTypeControllerSoapPort;
   try
     ENSubstationTypeObj := TempENSubstationType.getObject(StrToInt(sgENSubstationType.Cells[0,sgENSubstationType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubstationTypeEdit:=TfrmENSubstationTypeEdit.Create(Application, dsView);
  try
    frmENSubstationTypeEdit.ShowModal;
  finally
    frmENSubstationTypeEdit.Free;
    frmENSubstationTypeEdit:=nil;
  end;
end;

procedure TfrmENSubstationTypeShow.actEditExecute(Sender: TObject);
Var TempENSubstationType: ENSubstationTypeControllerSoapPort;
begin
 TempENSubstationType := HTTPRIOENSubstationType as ENSubstationTypeControllerSoapPort;
   try
     ENSubstationTypeObj := TempENSubstationType.getObject(StrToInt(sgENSubstationType.Cells[0,sgENSubstationType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubstationTypeEdit:=TfrmENSubstationTypeEdit.Create(Application, dsEdit);
  try
    if frmENSubstationTypeEdit.ShowModal= mrOk then
      begin
        //TempENSubstationType.save(ENSubstationTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubstationTypeEdit.Free;
    frmENSubstationTypeEdit:=nil;
  end;
end;

procedure TfrmENSubstationTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSubstationType: ENSubstationTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubstationType := HTTPRIOENSubstationType as ENSubstationTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubstationType.Cells[0,sgENSubstationType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип підстанції) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubstationType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubstationTypeShow.actInsertExecute(Sender: TObject);
Var TempENSubstationType: ENSubstationTypeControllerSoapPort;
begin
  TempENSubstationType := HTTPRIOENSubstationType as ENSubstationTypeControllerSoapPort;
  ENSubstationTypeObj:=ENSubstationType.Create;



  try
    frmENSubstationTypeEdit:=TfrmENSubstationTypeEdit.Create(Application, dsInsert);
    try
      if frmENSubstationTypeEdit.ShowModal = mrOk then
      begin
        if ENSubstationTypeObj<>nil then
            //TempENSubstationType.add(ENSubstationTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubstationTypeEdit.Free;
      frmENSubstationTypeEdit:=nil;
    end;
  finally
    ENSubstationTypeObj.Free;
  end;
end;

procedure TfrmENSubstationTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubstationTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSubstationTypeFilterEdit:=TfrmENSubstationTypeFilterEdit.Create(Application, dsEdit);
  try
    if frmENSubstationTypeFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENSubstationTypeFilter.Create;
      FilterObject := ENSubstationTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubstationTypeFilterEdit.Free;
    frmENSubstationTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubstationTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.