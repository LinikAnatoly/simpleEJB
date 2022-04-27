
unit ShowSCUsageInputItemKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCUsageInputItemKindController, AdvObj ;


type
  TfrmSCUsageInputItemKindShow = class(TChildForm)  
  HTTPRIOSCUsageInputItemKind: THTTPRIO;
    ImageList1: TImageList;
    sgSCUsageInputItemKind: TAdvStringGrid;
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
procedure sgSCUsageInputItemKindTopLeftChanged(Sender: TObject);
procedure sgSCUsageInputItemKindDblClick(Sender: TObject);
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
 frmSCUsageInputItemKindShow : TfrmSCUsageInputItemKindShow;
 // SCUsageInputItemKindObj: SCUsageInputItemKind;
 // SCUsageInputItemKindFilterObj: SCUsageInputItemKindFilter;
  
  
implementation

uses Main, EditSCUsageInputItemKind, EditSCUsageInputItemKindFilter;


{$R *.dfm}

var
  //frmSCUsageInputItemKindShow : TfrmSCUsageInputItemKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCUsageInputItemKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmSCUsageInputItemKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCUsageInputItemKindShow:=nil;
    inherited;
  end;


procedure TfrmSCUsageInputItemKindShow.FormShow(Sender: TObject);
var
  TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
  i: Integer;
  SCUsageInputItemKindList: SCUsageInputItemKindShortList;
  begin
  SetGridHeaders(SCUsageInputItemKindHeaders, sgSCUsageInputItemKind.ColumnHeaders);
  ColCount:=100;
  TempSCUsageInputItemKind :=  HTTPRIOSCUsageInputItemKind as SCUsageInputItemKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemKindList := TempSCUsageInputItemKind.getScrollableFilteredList(SCUsageInputItemKindFilter(FilterObject),0,ColCount);


  LastCount:=High(SCUsageInputItemKindList.list);

  if LastCount > -1 then
     sgSCUsageInputItemKind.RowCount:=LastCount+2
  else
     sgSCUsageInputItemKind.RowCount:=2;

   with sgSCUsageInputItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCUsageInputItemKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCUsageInputItemKindList.list[i].name;
        LastRow:=i+1;
        sgSCUsageInputItemKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCUsageInputItemKind.Row:=1;
end;

procedure TfrmSCUsageInputItemKindShow.sgSCUsageInputItemKindTopLeftChanged(Sender: TObject);
var
  TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
  i,CurrentRow: Integer;
  SCUsageInputItemKindList: SCUsageInputItemKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCUsageInputItemKind.TopRow + sgSCUsageInputItemKind.VisibleRowCount) = ColCount
  then
    begin
      TempSCUsageInputItemKind :=  HTTPRIOSCUsageInputItemKind as SCUsageInputItemKindControllerSoapPort;
      CurrentRow:=sgSCUsageInputItemKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemKindList := TempSCUsageInputItemKind.getScrollableFilteredList(SCUsageInputItemKindFilter(FilterObject),ColCount-1, 100);



  sgSCUsageInputItemKind.RowCount:=sgSCUsageInputItemKind.RowCount+100;
  LastCount:=High(SCUsageInputItemKindList.list);
  with sgSCUsageInputItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCUsageInputItemKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCUsageInputItemKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCUsageInputItemKind.Row:=CurrentRow-5;
   sgSCUsageInputItemKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCUsageInputItemKindShow.sgSCUsageInputItemKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCUsageInputItemKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCUsageInputItemKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCUsageInputItemKind.RowCount-1 do
   for j:=0 to sgSCUsageInputItemKind.ColCount-1 do
     sgSCUsageInputItemKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCUsageInputItemKindShow.actViewExecute(Sender: TObject);
Var TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
begin
 TempSCUsageInputItemKind := HTTPRIOSCUsageInputItemKind as SCUsageInputItemKindControllerSoapPort;
   try
     SCUsageInputItemKindObj := TempSCUsageInputItemKind.getObject(StrToInt(sgSCUsageInputItemKind.Cells[0,sgSCUsageInputItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemKindEdit:=TfrmSCUsageInputItemKindEdit.Create(Application, dsView);
  try
    frmSCUsageInputItemKindEdit.ShowModal;
  finally
    frmSCUsageInputItemKindEdit.Free;
    frmSCUsageInputItemKindEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemKindShow.actEditExecute(Sender: TObject);
Var TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
begin
 TempSCUsageInputItemKind := HTTPRIOSCUsageInputItemKind as SCUsageInputItemKindControllerSoapPort;
   try
     SCUsageInputItemKindObj := TempSCUsageInputItemKind.getObject(StrToInt(sgSCUsageInputItemKind.Cells[0,sgSCUsageInputItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemKindEdit:=TfrmSCUsageInputItemKindEdit.Create(Application, dsEdit);
  try
    if frmSCUsageInputItemKindEdit.ShowModal= mrOk then
      begin
        //TempSCUsageInputItemKind.save(SCUsageInputItemKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCUsageInputItemKindEdit.Free;
    frmSCUsageInputItemKindEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemKindShow.actDeleteExecute(Sender: TObject);
Var TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCUsageInputItemKind := HTTPRIOSCUsageInputItemKind as SCUsageInputItemKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCUsageInputItemKind.Cells[0,sgSCUsageInputItemKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид документу (типи ОЗ)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCUsageInputItemKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCUsageInputItemKindShow.actInsertExecute(Sender: TObject);
Var TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
begin
  TempSCUsageInputItemKind := HTTPRIOSCUsageInputItemKind as SCUsageInputItemKindControllerSoapPort;
  SCUsageInputItemKindObj:=SCUsageInputItemKind.Create;



  try
    frmSCUsageInputItemKindEdit:=TfrmSCUsageInputItemKindEdit.Create(Application, dsInsert);
    try
      if frmSCUsageInputItemKindEdit.ShowModal = mrOk then
      begin
        if SCUsageInputItemKindObj<>nil then
            //TempSCUsageInputItemKind.add(SCUsageInputItemKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCUsageInputItemKindEdit.Free;
      frmSCUsageInputItemKindEdit:=nil;
    end;
  finally
    SCUsageInputItemKindObj.Free;
  end;
end;

procedure TfrmSCUsageInputItemKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCUsageInputItemKindShow.actFilterExecute(Sender: TObject);
begin
{frmSCUsageInputItemKindFilterEdit:=TfrmSCUsageInputItemKindFilterEdit.Create(Application, dsInsert);
  try
    SCUsageInputItemKindFilterObj := SCUsageInputItemKindFilter.Create;
    SetNullIntProps(SCUsageInputItemKindFilterObj);
    SetNullXSProps(SCUsageInputItemKindFilterObj);

    if frmSCUsageInputItemKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCUsageInputItemKindFilter.Create;
      FilterObject := SCUsageInputItemKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCUsageInputItemKindFilterEdit.Free;
    frmSCUsageInputItemKindFilterEdit:=nil;
  end;}
end;

procedure TfrmSCUsageInputItemKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.