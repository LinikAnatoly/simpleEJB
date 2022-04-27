
unit ShowENTravelWorkMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelWorkModeController ;


type
  TfrmENTravelWorkModeShow = class(TChildForm)  
  HTTPRIOENTravelWorkMode: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelWorkMode: TAdvStringGrid;
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
procedure sgENTravelWorkModeTopLeftChanged(Sender: TObject);
procedure sgENTravelWorkModeDblClick(Sender: TObject);
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
 // ENTravelWorkModeObj: ENTravelWorkMode;
 // ENTravelWorkModeFilterObj: ENTravelWorkModeFilter;
  
  
implementation

uses Main, EditENTravelWorkMode, EditENTravelWorkModeFilter;


{$R *.dfm}

var
  //frmENTravelWorkModeShow : TfrmENTravelWorkModeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelWorkModeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENTravelWorkModeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelWorkModeShow:=nil;
    inherited;
  end;


procedure TfrmENTravelWorkModeShow.FormShow(Sender: TObject);
var
  TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
  i: Integer;
  ENTravelWorkModeList: ENTravelWorkModeShortList;
  begin
  SetGridHeaders(ENTravelWorkModeHeaders, sgENTravelWorkMode.ColumnHeaders);
  ColCount:=100;
  TempENTravelWorkMode :=  HTTPRIOENTravelWorkMode as ENTravelWorkModeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelWorkModeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelWorkModeList := TempENTravelWorkMode.getScrollableFilteredList(ENTravelWorkModeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelWorkModeList.list);

  if LastCount > -1 then
     sgENTravelWorkMode.RowCount:=LastCount+2
  else
     sgENTravelWorkMode.RowCount:=2;

   with sgENTravelWorkMode do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelWorkModeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelWorkModeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelWorkModeList.list[i].name;
        LastRow:=i+1;
        sgENTravelWorkMode.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelWorkMode.Row:=1;
end;

procedure TfrmENTravelWorkModeShow.sgENTravelWorkModeTopLeftChanged(Sender: TObject);
var
  TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelWorkModeList: ENTravelWorkModeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelWorkMode.TopRow + sgENTravelWorkMode.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelWorkMode :=  HTTPRIOENTravelWorkMode as ENTravelWorkModeControllerSoapPort;
      CurrentRow:=sgENTravelWorkMode.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelWorkModeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelWorkModeList := TempENTravelWorkMode.getScrollableFilteredList(ENTravelWorkModeFilter(FilterObject),ColCount-1, 100);



  sgENTravelWorkMode.RowCount:=sgENTravelWorkMode.RowCount+100;
  LastCount:=High(ENTravelWorkModeList.list);
  with sgENTravelWorkMode do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelWorkModeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelWorkModeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTravelWorkModeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelWorkMode.Row:=CurrentRow-5;
   sgENTravelWorkMode.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelWorkModeShow.sgENTravelWorkModeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelWorkMode,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelWorkModeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelWorkMode.RowCount-1 do
   for j:=0 to sgENTravelWorkMode.ColCount-1 do
     sgENTravelWorkMode.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelWorkModeShow.actViewExecute(Sender: TObject);
Var TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
begin
 TempENTravelWorkMode := HTTPRIOENTravelWorkMode as ENTravelWorkModeControllerSoapPort;
   try
     ENTravelWorkModeObj := TempENTravelWorkMode.getObject(StrToInt(sgENTravelWorkMode.Cells[0,sgENTravelWorkMode.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelWorkModeEdit:=TfrmENTravelWorkModeEdit.Create(Application, dsView);
  try
    frmENTravelWorkModeEdit.ShowModal;
  finally
    frmENTravelWorkModeEdit.Free;
    frmENTravelWorkModeEdit:=nil;
  end;
end;

procedure TfrmENTravelWorkModeShow.actEditExecute(Sender: TObject);
Var TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
begin
 TempENTravelWorkMode := HTTPRIOENTravelWorkMode as ENTravelWorkModeControllerSoapPort;
   try
     ENTravelWorkModeObj := TempENTravelWorkMode.getObject(StrToInt(sgENTravelWorkMode.Cells[0,sgENTravelWorkMode.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelWorkModeEdit:=TfrmENTravelWorkModeEdit.Create(Application, dsEdit);
  try
    if frmENTravelWorkModeEdit.ShowModal= mrOk then
      begin
        //TempENTravelWorkMode.save(ENTravelWorkModeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelWorkModeEdit.Free;
    frmENTravelWorkModeEdit:=nil;
  end;
end;

procedure TfrmENTravelWorkModeShow.actDeleteExecute(Sender: TObject);
Var TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelWorkMode := HTTPRIOENTravelWorkMode as ENTravelWorkModeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelWorkMode.Cells[0,sgENTravelWorkMode.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Режим роботи водія) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelWorkMode.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelWorkModeShow.actInsertExecute(Sender: TObject);
Var TempENTravelWorkMode: ENTravelWorkModeControllerSoapPort;
begin
  TempENTravelWorkMode := HTTPRIOENTravelWorkMode as ENTravelWorkModeControllerSoapPort;
  ENTravelWorkModeObj:=ENTravelWorkMode.Create;



  try
    frmENTravelWorkModeEdit:=TfrmENTravelWorkModeEdit.Create(Application, dsInsert);
    try
      if frmENTravelWorkModeEdit.ShowModal = mrOk then
      begin
        if ENTravelWorkModeObj<>nil then
            //TempENTravelWorkMode.add(ENTravelWorkModeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelWorkModeEdit.Free;
      frmENTravelWorkModeEdit:=nil;
    end;
  finally
    ENTravelWorkModeObj.Free;
  end;
end;

procedure TfrmENTravelWorkModeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelWorkModeShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelWorkModeFilterEdit:=TfrmENTravelWorkModeFilterEdit.Create(Application, dsInsert);
  try
    ENTravelWorkModeFilterObj := ENTravelWorkModeFilter.Create;
    SetNullIntProps(ENTravelWorkModeFilterObj);
    SetNullXSProps(ENTravelWorkModeFilterObj);

    if frmENTravelWorkModeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelWorkModeFilter.Create;
      FilterObject := ENTravelWorkModeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelWorkModeFilterEdit.Free;
    frmENTravelWorkModeFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelWorkModeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.