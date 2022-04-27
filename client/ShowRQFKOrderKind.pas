
unit ShowRQFKOrderKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKOrderKindController, AdvObj ;


type
  TfrmRQFKOrderKindShow = class(TChildForm)  
  HTTPRIORQFKOrderKind: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrderKind: TAdvStringGrid;
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
procedure sgRQFKOrderKindTopLeftChanged(Sender: TObject);
procedure sgRQFKOrderKindDblClick(Sender: TObject);
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
 frmRQFKOrderKindShow : TfrmRQFKOrderKindShow;
 // RQFKOrderKindObj: RQFKOrderKind;
 // RQFKOrderKindFilterObj: RQFKOrderKindFilter;
  
  
implementation

uses Main, EditRQFKOrderKind, EditRQFKOrderKindFilter;


{$R *.dfm}

var
  //frmRQFKOrderKindShow : TfrmRQFKOrderKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderKindHeaders: array [1..3] of String =
        ( 'Код'
          ,'Вид ордеру'
          ,'Розшифровка'
        );
   

procedure TfrmRQFKOrderKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKOrderKindShow:=nil;
    inherited;
  end;


procedure TfrmRQFKOrderKindShow.FormShow(Sender: TObject);
var
  TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
  i: Integer;
  RQFKOrderKindList: RQFKOrderKindShortList;
  begin
  SetGridHeaders(RQFKOrderKindHeaders, sgRQFKOrderKind.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrderKind :=  HTTPRIORQFKOrderKind as RQFKOrderKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderKindList := TempRQFKOrderKind.getScrollableFilteredList(RQFKOrderKindFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKOrderKindList.list);

  if LastCount > -1 then
     sgRQFKOrderKind.RowCount:=LastCount+2
  else
     sgRQFKOrderKind.RowCount:=2;

   with sgRQFKOrderKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderKindList.list[i].name;
        Cells[2,i+1] := RQFKOrderKindList.list[i].txtGen;
        LastRow:=i+1;
        sgRQFKOrderKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrderKind.Row:=1;
end;

procedure TfrmRQFKOrderKindShow.sgRQFKOrderKindTopLeftChanged(Sender: TObject);
var
  TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderKindList: RQFKOrderKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrderKind.TopRow + sgRQFKOrderKind.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrderKind :=  HTTPRIORQFKOrderKind as RQFKOrderKindControllerSoapPort;
      CurrentRow:=sgRQFKOrderKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderKindList := TempRQFKOrderKind.getScrollableFilteredList(RQFKOrderKindFilter(FilterObject),ColCount-1, 100);



  sgRQFKOrderKind.RowCount:=sgRQFKOrderKind.RowCount+100;
  LastCount:=High(RQFKOrderKindList.list);
  with sgRQFKOrderKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKOrderKindList.list[i].name;
        Cells[2,i+CurrentRow] := RQFKOrderKindList.list[i].txtGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrderKind.Row:=CurrentRow-5;
   sgRQFKOrderKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderKindShow.sgRQFKOrderKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrderKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrderKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrderKind.RowCount-1 do
   for j:=0 to sgRQFKOrderKind.ColCount-1 do
     sgRQFKOrderKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrderKindShow.actViewExecute(Sender: TObject);
Var TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
begin
 TempRQFKOrderKind := HTTPRIORQFKOrderKind as RQFKOrderKindControllerSoapPort;
   try
     RQFKOrderKindObj := TempRQFKOrderKind.getObject(StrToInt(sgRQFKOrderKind.Cells[0,sgRQFKOrderKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderKindEdit:=TfrmRQFKOrderKindEdit.Create(Application, dsView);
  try
    frmRQFKOrderKindEdit.ShowModal;
  finally
    frmRQFKOrderKindEdit.Free;
    frmRQFKOrderKindEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderKindShow.actEditExecute(Sender: TObject);
Var TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
begin
 TempRQFKOrderKind := HTTPRIORQFKOrderKind as RQFKOrderKindControllerSoapPort;
   try
     RQFKOrderKindObj := TempRQFKOrderKind.getObject(StrToInt(sgRQFKOrderKind.Cells[0,sgRQFKOrderKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderKindEdit:=TfrmRQFKOrderKindEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrderKindEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderKind.save(RQFKOrderKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderKindEdit.Free;
    frmRQFKOrderKindEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderKindShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrderKind := HTTPRIORQFKOrderKind as RQFKOrderKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrderKind.Cells[0,sgRQFKOrderKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид ордеру (прбутковий/видатковий)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrderKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrderKindShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
begin
  TempRQFKOrderKind := HTTPRIORQFKOrderKind as RQFKOrderKindControllerSoapPort;
  RQFKOrderKindObj:=RQFKOrderKind.Create;



  try
    frmRQFKOrderKindEdit:=TfrmRQFKOrderKindEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrderKindEdit.ShowModal = mrOk then
      begin
        if RQFKOrderKindObj<>nil then
            //TempRQFKOrderKind.add(RQFKOrderKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrderKindEdit.Free;
      frmRQFKOrderKindEdit:=nil;
    end;
  finally
    RQFKOrderKindObj.Free;
  end;
end;

procedure TfrmRQFKOrderKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderKindShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrderKindFilterEdit:=TfrmRQFKOrderKindFilterEdit.Create(Application, dsEdit);
  try
    RQFKOrderKindFilterObj := RQFKOrderKindFilter.Create;
    SetNullIntProps(RQFKOrderKindFilterObj);
    SetNullXSProps(RQFKOrderKindFilterObj);

    if frmRQFKOrderKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKOrderKindFilter.Create;
      FilterObject := RQFKOrderKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrderKindFilterEdit.Free;
    frmRQFKOrderKindFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKOrderKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.