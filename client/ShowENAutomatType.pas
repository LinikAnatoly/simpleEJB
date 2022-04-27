
unit ShowENAutomatType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAutomatTypeController, AdvObj ;


type
  TfrmENAutomatTypeShow = class(TChildForm)  
  HTTPRIOENAutomatType: THTTPRIO;
    ImageList1: TImageList;
    sgENAutomatType: TAdvStringGrid;
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
procedure sgENAutomatTypeTopLeftChanged(Sender: TObject);
procedure sgENAutomatTypeDblClick(Sender: TObject);
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
 frmENAutomatTypeShow : TfrmENAutomatTypeShow;
 // ENAutomatTypeObj: ENAutomatType;
 // ENAutomatTypeFilterObj: ENAutomatTypeFilter;
  
  
implementation

uses Main, EditENAutomatType, EditENAutomatTypeFilter;


{$R *.dfm}

var
  //frmENAutomatTypeShow : TfrmENAutomatTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAutomatTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип автомата'
        );
   

procedure TfrmENAutomatTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAutomatTypeShow:=nil;
    inherited;
  end;


procedure TfrmENAutomatTypeShow.FormShow(Sender: TObject);
var
  TempENAutomatType: ENAutomatTypeControllerSoapPort;
  i: Integer;
  ENAutomatTypeList: ENAutomatTypeShortList;
  begin
  SetGridHeaders(ENAutomatTypeHeaders, sgENAutomatType.ColumnHeaders);
  ColCount:=100;
  TempENAutomatType :=  HTTPRIOENAutomatType as ENAutomatTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAutomatTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutomatTypeList := TempENAutomatType.getScrollableFilteredList(ENAutomatTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAutomatTypeList.list);

  if LastCount > -1 then
     sgENAutomatType.RowCount:=LastCount+2
  else
     sgENAutomatType.RowCount:=2;

   with sgENAutomatType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutomatTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAutomatTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAutomatTypeList.list[i].name;
        LastRow:=i+1;
        sgENAutomatType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAutomatType.Row:=1;
end;

procedure TfrmENAutomatTypeShow.sgENAutomatTypeTopLeftChanged(Sender: TObject);
var
  TempENAutomatType: ENAutomatTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENAutomatTypeList: ENAutomatTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAutomatType.TopRow + sgENAutomatType.VisibleRowCount) = ColCount
  then
    begin
      TempENAutomatType :=  HTTPRIOENAutomatType as ENAutomatTypeControllerSoapPort;
      CurrentRow:=sgENAutomatType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAutomatTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutomatTypeList := TempENAutomatType.getScrollableFilteredList(ENAutomatTypeFilter(FilterObject),ColCount-1, 100);



  sgENAutomatType.RowCount:=sgENAutomatType.RowCount+100;
  LastCount:=High(ENAutomatTypeList.list);
  with sgENAutomatType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutomatTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAutomatTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAutomatTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAutomatType.Row:=CurrentRow-5;
   sgENAutomatType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAutomatTypeShow.sgENAutomatTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAutomatType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAutomatTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAutomatType.RowCount-1 do
   for j:=0 to sgENAutomatType.ColCount-1 do
     sgENAutomatType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAutomatTypeShow.actViewExecute(Sender: TObject);
Var TempENAutomatType: ENAutomatTypeControllerSoapPort;
begin
 TempENAutomatType := HTTPRIOENAutomatType as ENAutomatTypeControllerSoapPort;
   try
     ENAutomatTypeObj := TempENAutomatType.getObject(StrToInt(sgENAutomatType.Cells[0,sgENAutomatType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutomatTypeEdit:=TfrmENAutomatTypeEdit.Create(Application, dsView);
  try
    frmENAutomatTypeEdit.ShowModal;
  finally
    frmENAutomatTypeEdit.Free;
    frmENAutomatTypeEdit:=nil;
  end;
end;

procedure TfrmENAutomatTypeShow.actEditExecute(Sender: TObject);
Var TempENAutomatType: ENAutomatTypeControllerSoapPort;
begin
 TempENAutomatType := HTTPRIOENAutomatType as ENAutomatTypeControllerSoapPort;
   try
     ENAutomatTypeObj := TempENAutomatType.getObject(StrToInt(sgENAutomatType.Cells[0,sgENAutomatType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutomatTypeEdit:=TfrmENAutomatTypeEdit.Create(Application, dsEdit);
  try
    if frmENAutomatTypeEdit.ShowModal= mrOk then
      begin
        //TempENAutomatType.save(ENAutomatTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAutomatTypeEdit.Free;
    frmENAutomatTypeEdit:=nil;
  end;
end;

procedure TfrmENAutomatTypeShow.actDeleteExecute(Sender: TObject);
Var TempENAutomatType: ENAutomatTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAutomatType := HTTPRIOENAutomatType as ENAutomatTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAutomatType.Cells[0,sgENAutomatType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типы автоматов) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAutomatType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAutomatTypeShow.actInsertExecute(Sender: TObject);
Var TempENAutomatType: ENAutomatTypeControllerSoapPort;
begin
  TempENAutomatType := HTTPRIOENAutomatType as ENAutomatTypeControllerSoapPort;
  ENAutomatTypeObj:=ENAutomatType.Create;



  try
    frmENAutomatTypeEdit:=TfrmENAutomatTypeEdit.Create(Application, dsInsert);
    try
      if frmENAutomatTypeEdit.ShowModal = mrOk then
      begin
        if ENAutomatTypeObj<>nil then
            //TempENAutomatType.add(ENAutomatTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAutomatTypeEdit.Free;
      frmENAutomatTypeEdit:=nil;
    end;
  finally
    ENAutomatTypeObj.Free;
  end;
end;

procedure TfrmENAutomatTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAutomatTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENAutomatTypeFilterEdit:=TfrmENAutomatTypeFilterEdit.Create(Application, dsInsert);
  try
    ENAutomatTypeFilterObj := ENAutomatTypeFilter.Create;
    SetNullIntProps(ENAutomatTypeFilterObj);
    SetNullXSProps(ENAutomatTypeFilterObj);

    if frmENAutomatTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAutomatTypeFilter.Create;
      FilterObject := ENAutomatTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAutomatTypeFilterEdit.Free;
    frmENAutomatTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENAutomatTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.