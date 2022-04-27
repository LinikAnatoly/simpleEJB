
unit ShowENDisconnectorType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDisconnectorTypeController, AdvObj ;


type
  TfrmENDisconnectorTypeShow = class(TChildForm)  
  HTTPRIOENDisconnectorType: THTTPRIO;
    ImageList1: TImageList;
    sgENDisconnectorType: TAdvStringGrid;
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
procedure sgENDisconnectorTypeTopLeftChanged(Sender: TObject);
procedure sgENDisconnectorTypeDblClick(Sender: TObject);
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
 frmENDisconnectorTypeShow : TfrmENDisconnectorTypeShow;
 // ENDisconnectorTypeObj: ENDisconnectorType;
 // ENDisconnectorTypeFilterObj: ENDisconnectorTypeFilter;
  
  
implementation

uses Main, EditENDisconnectorType, EditENDisconnectorTypeFilter;


{$R *.dfm}

var
  //frmENDisconnectorTypeShow : TfrmENDisconnectorTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDisconnectorTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип разъеденителя'
        );
   

procedure TfrmENDisconnectorTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDisconnectorTypeShow:=nil;
    inherited;
  end;


procedure TfrmENDisconnectorTypeShow.FormShow(Sender: TObject);
var
  TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
  i: Integer;
  ENDisconnectorTypeList: ENDisconnectorTypeShortList;
  begin
  SetGridHeaders(ENDisconnectorTypeHeaders, sgENDisconnectorType.ColumnHeaders);
  ColCount:=100;
  TempENDisconnectorType :=  HTTPRIOENDisconnectorType as ENDisconnectorTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDisconnectorTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDisconnectorTypeList := TempENDisconnectorType.getScrollableFilteredList(ENDisconnectorTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDisconnectorTypeList.list);

  if LastCount > -1 then
     sgENDisconnectorType.RowCount:=LastCount+2
  else
     sgENDisconnectorType.RowCount:=2;

   with sgENDisconnectorType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDisconnectorTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDisconnectorTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDisconnectorTypeList.list[i].name;
        LastRow:=i+1;
        sgENDisconnectorType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDisconnectorType.Row:=1;
end;

procedure TfrmENDisconnectorTypeShow.sgENDisconnectorTypeTopLeftChanged(Sender: TObject);
var
  TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDisconnectorTypeList: ENDisconnectorTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDisconnectorType.TopRow + sgENDisconnectorType.VisibleRowCount) = ColCount
  then
    begin
      TempENDisconnectorType :=  HTTPRIOENDisconnectorType as ENDisconnectorTypeControllerSoapPort;
      CurrentRow:=sgENDisconnectorType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDisconnectorTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDisconnectorTypeList := TempENDisconnectorType.getScrollableFilteredList(ENDisconnectorTypeFilter(FilterObject),ColCount-1, 100);



  sgENDisconnectorType.RowCount:=sgENDisconnectorType.RowCount+100;
  LastCount:=High(ENDisconnectorTypeList.list);
  with sgENDisconnectorType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDisconnectorTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDisconnectorTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDisconnectorTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDisconnectorType.Row:=CurrentRow-5;
   sgENDisconnectorType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDisconnectorTypeShow.sgENDisconnectorTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDisconnectorType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDisconnectorTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDisconnectorType.RowCount-1 do
   for j:=0 to sgENDisconnectorType.ColCount-1 do
     sgENDisconnectorType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDisconnectorTypeShow.actViewExecute(Sender: TObject);
Var TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
begin
 TempENDisconnectorType := HTTPRIOENDisconnectorType as ENDisconnectorTypeControllerSoapPort;
   try
     ENDisconnectorTypeObj := TempENDisconnectorType.getObject(StrToInt(sgENDisconnectorType.Cells[0,sgENDisconnectorType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorTypeEdit:=TfrmENDisconnectorTypeEdit.Create(Application, dsView);
  try
    frmENDisconnectorTypeEdit.ShowModal;
  finally
    frmENDisconnectorTypeEdit.Free;
    frmENDisconnectorTypeEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorTypeShow.actEditExecute(Sender: TObject);
Var TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
begin
 TempENDisconnectorType := HTTPRIOENDisconnectorType as ENDisconnectorTypeControllerSoapPort;
   try
     ENDisconnectorTypeObj := TempENDisconnectorType.getObject(StrToInt(sgENDisconnectorType.Cells[0,sgENDisconnectorType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorTypeEdit:=TfrmENDisconnectorTypeEdit.Create(Application, dsEdit);
  try
    if frmENDisconnectorTypeEdit.ShowModal= mrOk then
      begin
        //TempENDisconnectorType.save(ENDisconnectorTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDisconnectorTypeEdit.Free;
    frmENDisconnectorTypeEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorTypeShow.actDeleteExecute(Sender: TObject);
Var TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDisconnectorType := HTTPRIOENDisconnectorType as ENDisconnectorTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDisconnectorType.Cells[0,sgENDisconnectorType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип разъеденителя) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDisconnectorType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDisconnectorTypeShow.actInsertExecute(Sender: TObject);
Var TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
begin
  TempENDisconnectorType := HTTPRIOENDisconnectorType as ENDisconnectorTypeControllerSoapPort;
  ENDisconnectorTypeObj:=ENDisconnectorType.Create;



  try
    frmENDisconnectorTypeEdit:=TfrmENDisconnectorTypeEdit.Create(Application, dsInsert);
    try
      if frmENDisconnectorTypeEdit.ShowModal = mrOk then
      begin
        if ENDisconnectorTypeObj<>nil then
            //TempENDisconnectorType.add(ENDisconnectorTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDisconnectorTypeEdit.Free;
      frmENDisconnectorTypeEdit:=nil;
    end;
  finally
    ENDisconnectorTypeObj.Free;
  end;
end;

procedure TfrmENDisconnectorTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDisconnectorTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENDisconnectorTypeFilterEdit:=TfrmENDisconnectorTypeFilterEdit.Create(Application, dsInsert);
  try
    ENDisconnectorTypeFilterObj := ENDisconnectorTypeFilter.Create;
    SetNullIntProps(ENDisconnectorTypeFilterObj);
    SetNullXSProps(ENDisconnectorTypeFilterObj);

    if frmENDisconnectorTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDisconnectorTypeFilter.Create;
      FilterObject := ENDisconnectorTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDisconnectorTypeFilterEdit.Free;
    frmENDisconnectorTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENDisconnectorTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.