
unit ShowENPlanWorkReasonType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkReasonTypeController, AdvObj ;


type
  TfrmENPlanWorkReasonTypeShow = class(TChildForm)  
  HTTPRIOENPlanWorkReasonType: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkReasonType: TAdvStringGrid;
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
procedure sgENPlanWorkReasonTypeTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkReasonTypeDblClick(Sender: TObject);
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
 frmENPlanWorkReasonTypeShow : TfrmENPlanWorkReasonTypeShow;
 // ENPlanWorkReasonTypeObj: ENPlanWorkReasonType;
 // ENPlanWorkReasonTypeFilterObj: ENPlanWorkReasonTypeFilter;
  
  
implementation

uses Main, EditENPlanWorkReasonType, EditENPlanWorkReasonTypeFilter;


{$R *.dfm}

var
  //frmENPlanWorkReasonTypeShow : TfrmENPlanWorkReasonTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkReasonTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENPlanWorkReasonTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkReasonTypeShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkReasonTypeShow.FormShow(Sender: TObject);
var
  TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
  i: Integer;
  ENPlanWorkReasonTypeList: ENPlanWorkReasonTypeShortList;
  begin
  SetGridHeaders(ENPlanWorkReasonTypeHeaders, sgENPlanWorkReasonType.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkReasonType :=  HTTPRIOENPlanWorkReasonType as ENPlanWorkReasonTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkReasonTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkReasonTypeList := TempENPlanWorkReasonType.getScrollableFilteredList(ENPlanWorkReasonTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkReasonTypeList.list);

  if LastCount > -1 then
     sgENPlanWorkReasonType.RowCount:=LastCount+2
  else
     sgENPlanWorkReasonType.RowCount:=2;

   with sgENPlanWorkReasonType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkReasonTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkReasonTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanWorkReasonTypeList.list[i].name;
        LastRow:=i+1;
        sgENPlanWorkReasonType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkReasonType.Row:=1;
end;

procedure TfrmENPlanWorkReasonTypeShow.sgENPlanWorkReasonTypeTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkReasonTypeList: ENPlanWorkReasonTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkReasonType.TopRow + sgENPlanWorkReasonType.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkReasonType :=  HTTPRIOENPlanWorkReasonType as ENPlanWorkReasonTypeControllerSoapPort;
      CurrentRow:=sgENPlanWorkReasonType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkReasonTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkReasonTypeList := TempENPlanWorkReasonType.getScrollableFilteredList(ENPlanWorkReasonTypeFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkReasonType.RowCount:=sgENPlanWorkReasonType.RowCount+100;
  LastCount:=High(ENPlanWorkReasonTypeList.list);
  with sgENPlanWorkReasonType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkReasonTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkReasonTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanWorkReasonTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkReasonType.Row:=CurrentRow-5;
   sgENPlanWorkReasonType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkReasonTypeShow.sgENPlanWorkReasonTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkReasonType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkReasonTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkReasonType.RowCount-1 do
   for j:=0 to sgENPlanWorkReasonType.ColCount-1 do
     sgENPlanWorkReasonType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkReasonTypeShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
begin
 TempENPlanWorkReasonType := HTTPRIOENPlanWorkReasonType as ENPlanWorkReasonTypeControllerSoapPort;
   try
     ENPlanWorkReasonTypeObj := TempENPlanWorkReasonType.getObject(StrToInt(sgENPlanWorkReasonType.Cells[0,sgENPlanWorkReasonType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkReasonTypeEdit:=TfrmENPlanWorkReasonTypeEdit.Create(Application, dsView);
  try
    frmENPlanWorkReasonTypeEdit.ShowModal;
  finally
    frmENPlanWorkReasonTypeEdit.Free;
    frmENPlanWorkReasonTypeEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkReasonTypeShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
begin
 TempENPlanWorkReasonType := HTTPRIOENPlanWorkReasonType as ENPlanWorkReasonTypeControllerSoapPort;
   try
     ENPlanWorkReasonTypeObj := TempENPlanWorkReasonType.getObject(StrToInt(sgENPlanWorkReasonType.Cells[0,sgENPlanWorkReasonType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkReasonTypeEdit:=TfrmENPlanWorkReasonTypeEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkReasonTypeEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkReasonType.save(ENPlanWorkReasonTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkReasonTypeEdit.Free;
    frmENPlanWorkReasonTypeEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkReasonTypeShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkReasonType := HTTPRIOENPlanWorkReasonType as ENPlanWorkReasonTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkReasonType.Cells[0,sgENPlanWorkReasonType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип підстави) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkReasonType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkReasonTypeShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
begin
  TempENPlanWorkReasonType := HTTPRIOENPlanWorkReasonType as ENPlanWorkReasonTypeControllerSoapPort;
  ENPlanWorkReasonTypeObj:=ENPlanWorkReasonType.Create;



  try
    frmENPlanWorkReasonTypeEdit:=TfrmENPlanWorkReasonTypeEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkReasonTypeEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkReasonTypeObj<>nil then
            //TempENPlanWorkReasonType.add(ENPlanWorkReasonTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkReasonTypeEdit.Free;
      frmENPlanWorkReasonTypeEdit:=nil;
    end;
  finally
    ENPlanWorkReasonTypeObj.Free;
  end;
end;

procedure TfrmENPlanWorkReasonTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkReasonTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkReasonTypeFilterEdit:=TfrmENPlanWorkReasonTypeFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkReasonTypeFilterObj := ENPlanWorkReasonTypeFilter.Create;
    SetNullIntProps(ENPlanWorkReasonTypeFilterObj);
    SetNullXSProps(ENPlanWorkReasonTypeFilterObj);

    if frmENPlanWorkReasonTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWorkReasonTypeFilter.Create;
      FilterObject := ENPlanWorkReasonTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkReasonTypeFilterEdit.Free;
    frmENPlanWorkReasonTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkReasonTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.