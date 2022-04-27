
unit ShowRQOrderKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderKindController ;


type
  TfrmRQOrderKindShow = class(TChildForm)  
  HTTPRIORQOrderKind: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderKind: TAdvStringGrid;
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
procedure sgRQOrderKindTopLeftChanged(Sender: TObject);
procedure sgRQOrderKindDblClick(Sender: TObject);
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
 // RQOrderKindObj: RQOrderKind;
 // RQOrderKindFilterObj: RQOrderKindFilter;
  
  
implementation

uses Main, EditRQOrderKind, EditRQOrderKindFilter;


{$R *.dfm}

var
  //frmRQOrderKindShow : TfrmRQOrderKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование '
        );
   

procedure TfrmRQOrderKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderKindShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderKindShow.FormShow(Sender: TObject);
var
  TempRQOrderKind: RQOrderKindControllerSoapPort;
  i: Integer;
  RQOrderKindList: RQOrderKindShortList;
  begin
  SetGridHeaders(RQOrderKindHeaders, sgRQOrderKind.ColumnHeaders);
  ColCount:=100;
  TempRQOrderKind :=  HTTPRIORQOrderKind as RQOrderKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderKindList := TempRQOrderKind.getScrollableFilteredList(RQOrderKindFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderKindList.list);

  if LastCount > -1 then
     sgRQOrderKind.RowCount:=LastCount+2
  else
     sgRQOrderKind.RowCount:=2;

   with sgRQOrderKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderKindList.list[i].name;
        LastRow:=i+1;
        sgRQOrderKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderKind.Row:=1;
end;

procedure TfrmRQOrderKindShow.sgRQOrderKindTopLeftChanged(Sender: TObject);
var
  TempRQOrderKind: RQOrderKindControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderKindList: RQOrderKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderKind.TopRow + sgRQOrderKind.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderKind :=  HTTPRIORQOrderKind as RQOrderKindControllerSoapPort;
      CurrentRow:=sgRQOrderKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderKindList := TempRQOrderKind.getScrollableFilteredList(RQOrderKindFilter(FilterObject),ColCount-1, 100);



  sgRQOrderKind.RowCount:=sgRQOrderKind.RowCount+100;
  LastCount:=High(RQOrderKindList.list);
  with sgRQOrderKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderKind.Row:=CurrentRow-5;
   sgRQOrderKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderKindShow.sgRQOrderKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderKind.RowCount-1 do
   for j:=0 to sgRQOrderKind.ColCount-1 do
     sgRQOrderKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderKindShow.actViewExecute(Sender: TObject);
Var TempRQOrderKind: RQOrderKindControllerSoapPort;
begin
 TempRQOrderKind := HTTPRIORQOrderKind as RQOrderKindControllerSoapPort;
   try
     RQOrderKindObj := TempRQOrderKind.getObject(StrToInt(sgRQOrderKind.Cells[0,sgRQOrderKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderKindEdit:=TfrmRQOrderKindEdit.Create(Application, dsView);
  try
    frmRQOrderKindEdit.ShowModal;
  finally
    frmRQOrderKindEdit.Free;
    frmRQOrderKindEdit:=nil;
  end;
end;

procedure TfrmRQOrderKindShow.actEditExecute(Sender: TObject);
Var TempRQOrderKind: RQOrderKindControllerSoapPort;
begin
 TempRQOrderKind := HTTPRIORQOrderKind as RQOrderKindControllerSoapPort;
   try
     RQOrderKindObj := TempRQOrderKind.getObject(StrToInt(sgRQOrderKind.Cells[0,sgRQOrderKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderKindEdit:=TfrmRQOrderKindEdit.Create(Application, dsEdit);
  try
    if frmRQOrderKindEdit.ShowModal= mrOk then
      begin
        //TempRQOrderKind.save(RQOrderKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderKindEdit.Free;
    frmRQOrderKindEdit:=nil;
  end;
end;

procedure TfrmRQOrderKindShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderKind: RQOrderKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderKind := HTTPRIORQOrderKind as RQOrderKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderKind.Cells[0,sgRQOrderKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид заявки (РЭС/БД/ХОЕ)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderKindShow.actInsertExecute(Sender: TObject);
Var TempRQOrderKind: RQOrderKindControllerSoapPort;
begin
  TempRQOrderKind := HTTPRIORQOrderKind as RQOrderKindControllerSoapPort;
  RQOrderKindObj:=RQOrderKind.Create;



  try
    frmRQOrderKindEdit:=TfrmRQOrderKindEdit.Create(Application, dsInsert);
    try
      if frmRQOrderKindEdit.ShowModal = mrOk then
      begin
        if RQOrderKindObj<>nil then
            //TempRQOrderKind.add(RQOrderKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderKindEdit.Free;
      frmRQOrderKindEdit:=nil;
    end;
  finally
    RQOrderKindObj.Free;
  end;
end;

procedure TfrmRQOrderKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderKindShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderKindFilterEdit:=TfrmRQOrderKindFilterEdit.Create(Application, dsEdit);
  try
    RQOrderKindFilterObj := RQOrderKindFilter.Create;
    SetNullIntProps(RQOrderKindFilterObj);
    SetNullXSProps(RQOrderKindFilterObj);

    if frmRQOrderKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderKindFilter.Create;
      FilterObject := RQOrderKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderKindFilterEdit.Free;
    frmRQOrderKindFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.