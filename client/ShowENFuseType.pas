
unit ShowENFuseType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuseTypeController, AdvObj ;


type
  TfrmENFuseTypeShow = class(TChildForm)  
  HTTPRIOENFuseType: THTTPRIO;
    ImageList1: TImageList;
    sgENFuseType: TAdvStringGrid;
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
procedure sgENFuseTypeTopLeftChanged(Sender: TObject);
procedure sgENFuseTypeDblClick(Sender: TObject);
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
 frmENFuseTypeShow : TfrmENFuseTypeShow;
 // ENFuseTypeObj: ENFuseType;
 // ENFuseTypeFilterObj: ENFuseTypeFilter;
  
  
implementation

uses Main, EditENFuseType, EditENFuseTypeFilter;


{$R *.dfm}

var
  //frmENFuseTypeShow : TfrmENFuseTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuseTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип предохранителя'
        );
   

procedure TfrmENFuseTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuseTypeShow:=nil;
    inherited;
  end;


procedure TfrmENFuseTypeShow.FormShow(Sender: TObject);
var
  TempENFuseType: ENFuseTypeControllerSoapPort;
  i: Integer;
  ENFuseTypeList: ENFuseTypeShortList;
  begin
  SetGridHeaders(ENFuseTypeHeaders, sgENFuseType.ColumnHeaders);
  ColCount:=100;
  TempENFuseType :=  HTTPRIOENFuseType as ENFuseTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuseTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuseTypeList := TempENFuseType.getScrollableFilteredList(ENFuseTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuseTypeList.list);

  if LastCount > -1 then
     sgENFuseType.RowCount:=LastCount+2
  else
     sgENFuseType.RowCount:=2;

   with sgENFuseType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuseTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuseTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFuseTypeList.list[i].name;
        LastRow:=i+1;
        sgENFuseType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFuseType.Row:=1;
end;

procedure TfrmENFuseTypeShow.sgENFuseTypeTopLeftChanged(Sender: TObject);
var
  TempENFuseType: ENFuseTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuseTypeList: ENFuseTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuseType.TopRow + sgENFuseType.VisibleRowCount) = ColCount
  then
    begin
      TempENFuseType :=  HTTPRIOENFuseType as ENFuseTypeControllerSoapPort;
      CurrentRow:=sgENFuseType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuseTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuseTypeList := TempENFuseType.getScrollableFilteredList(ENFuseTypeFilter(FilterObject),ColCount-1, 100);



  sgENFuseType.RowCount:=sgENFuseType.RowCount+100;
  LastCount:=High(ENFuseTypeList.list);
  with sgENFuseType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuseTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuseTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFuseTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuseType.Row:=CurrentRow-5;
   sgENFuseType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuseTypeShow.sgENFuseTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuseType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuseTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuseType.RowCount-1 do
   for j:=0 to sgENFuseType.ColCount-1 do
     sgENFuseType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuseTypeShow.actViewExecute(Sender: TObject);
Var TempENFuseType: ENFuseTypeControllerSoapPort;
begin
 TempENFuseType := HTTPRIOENFuseType as ENFuseTypeControllerSoapPort;
   try
     ENFuseTypeObj := TempENFuseType.getObject(StrToInt(sgENFuseType.Cells[0,sgENFuseType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuseTypeEdit:=TfrmENFuseTypeEdit.Create(Application, dsView);
  try
    frmENFuseTypeEdit.ShowModal;
  finally
    frmENFuseTypeEdit.Free;
    frmENFuseTypeEdit:=nil;
  end;
end;

procedure TfrmENFuseTypeShow.actEditExecute(Sender: TObject);
Var TempENFuseType: ENFuseTypeControllerSoapPort;
begin
 TempENFuseType := HTTPRIOENFuseType as ENFuseTypeControllerSoapPort;
   try
     ENFuseTypeObj := TempENFuseType.getObject(StrToInt(sgENFuseType.Cells[0,sgENFuseType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuseTypeEdit:=TfrmENFuseTypeEdit.Create(Application, dsEdit);
  try
    if frmENFuseTypeEdit.ShowModal= mrOk then
      begin
        //TempENFuseType.save(ENFuseTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuseTypeEdit.Free;
    frmENFuseTypeEdit:=nil;
  end;
end;

procedure TfrmENFuseTypeShow.actDeleteExecute(Sender: TObject);
Var TempENFuseType: ENFuseTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuseType := HTTPRIOENFuseType as ENFuseTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuseType.Cells[0,sgENFuseType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип предохранителя) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuseType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuseTypeShow.actInsertExecute(Sender: TObject);
Var TempENFuseType: ENFuseTypeControllerSoapPort;
begin
  TempENFuseType := HTTPRIOENFuseType as ENFuseTypeControllerSoapPort;
  ENFuseTypeObj:=ENFuseType.Create;



  try
    frmENFuseTypeEdit:=TfrmENFuseTypeEdit.Create(Application, dsInsert);
    try
      if frmENFuseTypeEdit.ShowModal = mrOk then
      begin
        if ENFuseTypeObj<>nil then
            //TempENFuseType.add(ENFuseTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuseTypeEdit.Free;
      frmENFuseTypeEdit:=nil;
    end;
  finally
    ENFuseTypeObj.Free;
  end;
end;

procedure TfrmENFuseTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuseTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENFuseTypeFilterEdit:=TfrmENFuseTypeFilterEdit.Create(Application, dsInsert);
  try
    ENFuseTypeFilterObj := ENFuseTypeFilter.Create;
    SetNullIntProps(ENFuseTypeFilterObj);
    SetNullXSProps(ENFuseTypeFilterObj);

    if frmENFuseTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuseTypeFilter.Create;
      FilterObject := ENFuseTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuseTypeFilterEdit.Free;
    frmENFuseTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuseTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.