
unit ShowENDisconnectorDriveType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDisconnectorDriveTypeController, AdvObj ;


type
  TfrmENDisconnectorDriveTypeShow = class(TChildForm)  
  HTTPRIOENDisconnectorDriveType: THTTPRIO;
    ImageList1: TImageList;
    sgENDisconnectorDriveType: TAdvStringGrid;
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
procedure sgENDisconnectorDriveTypeTopLeftChanged(Sender: TObject);
procedure sgENDisconnectorDriveTypeDblClick(Sender: TObject);
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
 frmENDisconnectorDriveTypeShow : TfrmENDisconnectorDriveTypeShow;
 // ENDisconnectorDriveTypeObj: ENDisconnectorDriveType;
 // ENDisconnectorDriveTypeFilterObj: ENDisconnectorDriveTypeFilter;
  
  
implementation

uses Main, EditENDisconnectorDriveType, EditENDisconnectorDriveTypeFilter;


{$R *.dfm}

var
  //frmENDisconnectorDriveTypeShow : TfrmENDisconnectorDriveTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDisconnectorDriveTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип привода разъеденителя'
        );
   

procedure TfrmENDisconnectorDriveTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDisconnectorDriveTypeShow:=nil;
    inherited;
  end;


procedure TfrmENDisconnectorDriveTypeShow.FormShow(Sender: TObject);
var
  TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
  i: Integer;
  ENDisconnectorDriveTypeList: ENDisconnectorDriveTypeShortList;
  begin
  SetGridHeaders(ENDisconnectorDriveTypeHeaders, sgENDisconnectorDriveType.ColumnHeaders);
  ColCount:=100;
  TempENDisconnectorDriveType :=  HTTPRIOENDisconnectorDriveType as ENDisconnectorDriveTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDisconnectorDriveTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDisconnectorDriveTypeList := TempENDisconnectorDriveType.getScrollableFilteredList(ENDisconnectorDriveTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDisconnectorDriveTypeList.list);

  if LastCount > -1 then
     sgENDisconnectorDriveType.RowCount:=LastCount+2
  else
     sgENDisconnectorDriveType.RowCount:=2;

   with sgENDisconnectorDriveType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDisconnectorDriveTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDisconnectorDriveTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDisconnectorDriveTypeList.list[i].name;
        LastRow:=i+1;
        sgENDisconnectorDriveType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDisconnectorDriveType.Row:=1;
end;

procedure TfrmENDisconnectorDriveTypeShow.sgENDisconnectorDriveTypeTopLeftChanged(Sender: TObject);
var
  TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDisconnectorDriveTypeList: ENDisconnectorDriveTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDisconnectorDriveType.TopRow + sgENDisconnectorDriveType.VisibleRowCount) = ColCount
  then
    begin
      TempENDisconnectorDriveType :=  HTTPRIOENDisconnectorDriveType as ENDisconnectorDriveTypeControllerSoapPort;
      CurrentRow:=sgENDisconnectorDriveType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDisconnectorDriveTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDisconnectorDriveTypeList := TempENDisconnectorDriveType.getScrollableFilteredList(ENDisconnectorDriveTypeFilter(FilterObject),ColCount-1, 100);



  sgENDisconnectorDriveType.RowCount:=sgENDisconnectorDriveType.RowCount+100;
  LastCount:=High(ENDisconnectorDriveTypeList.list);
  with sgENDisconnectorDriveType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDisconnectorDriveTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDisconnectorDriveTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDisconnectorDriveTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDisconnectorDriveType.Row:=CurrentRow-5;
   sgENDisconnectorDriveType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDisconnectorDriveTypeShow.sgENDisconnectorDriveTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDisconnectorDriveType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDisconnectorDriveTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDisconnectorDriveType.RowCount-1 do
   for j:=0 to sgENDisconnectorDriveType.ColCount-1 do
     sgENDisconnectorDriveType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDisconnectorDriveTypeShow.actViewExecute(Sender: TObject);
Var TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
begin
 TempENDisconnectorDriveType := HTTPRIOENDisconnectorDriveType as ENDisconnectorDriveTypeControllerSoapPort;
   try
     ENDisconnectorDriveTypeObj := TempENDisconnectorDriveType.getObject(StrToInt(sgENDisconnectorDriveType.Cells[0,sgENDisconnectorDriveType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorDriveTypeEdit:=TfrmENDisconnectorDriveTypeEdit.Create(Application, dsView);
  try
    frmENDisconnectorDriveTypeEdit.ShowModal;
  finally
    frmENDisconnectorDriveTypeEdit.Free;
    frmENDisconnectorDriveTypeEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorDriveTypeShow.actEditExecute(Sender: TObject);
Var TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
begin
 TempENDisconnectorDriveType := HTTPRIOENDisconnectorDriveType as ENDisconnectorDriveTypeControllerSoapPort;
   try
     ENDisconnectorDriveTypeObj := TempENDisconnectorDriveType.getObject(StrToInt(sgENDisconnectorDriveType.Cells[0,sgENDisconnectorDriveType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorDriveTypeEdit:=TfrmENDisconnectorDriveTypeEdit.Create(Application, dsEdit);
  try
    if frmENDisconnectorDriveTypeEdit.ShowModal= mrOk then
      begin
        //TempENDisconnectorDriveType.save(ENDisconnectorDriveTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDisconnectorDriveTypeEdit.Free;
    frmENDisconnectorDriveTypeEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorDriveTypeShow.actDeleteExecute(Sender: TObject);
Var TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDisconnectorDriveType := HTTPRIOENDisconnectorDriveType as ENDisconnectorDriveTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDisconnectorDriveType.Cells[0,sgENDisconnectorDriveType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип привода разъеденителя) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDisconnectorDriveType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDisconnectorDriveTypeShow.actInsertExecute(Sender: TObject);
Var TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
begin
  TempENDisconnectorDriveType := HTTPRIOENDisconnectorDriveType as ENDisconnectorDriveTypeControllerSoapPort;
  ENDisconnectorDriveTypeObj:=ENDisconnectorDriveType.Create;



  try
    frmENDisconnectorDriveTypeEdit:=TfrmENDisconnectorDriveTypeEdit.Create(Application, dsInsert);
    try
      if frmENDisconnectorDriveTypeEdit.ShowModal = mrOk then
      begin
        if ENDisconnectorDriveTypeObj<>nil then
            //TempENDisconnectorDriveType.add(ENDisconnectorDriveTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDisconnectorDriveTypeEdit.Free;
      frmENDisconnectorDriveTypeEdit:=nil;
    end;
  finally
    ENDisconnectorDriveTypeObj.Free;
  end;
end;

procedure TfrmENDisconnectorDriveTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDisconnectorDriveTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENDisconnectorDriveTypeFilterEdit:=TfrmENDisconnectorDriveTypeFilterEdit.Create(Application, dsInsert);
  try
    ENDisconnectorDriveTypeFilterObj := ENDisconnectorDriveTypeFilter.Create;
    SetNullIntProps(ENDisconnectorDriveTypeFilterObj);
    SetNullXSProps(ENDisconnectorDriveTypeFilterObj);

    if frmENDisconnectorDriveTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDisconnectorDriveTypeFilter.Create;
      FilterObject := ENDisconnectorDriveTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDisconnectorDriveTypeFilterEdit.Free;
    frmENDisconnectorDriveTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENDisconnectorDriveTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.