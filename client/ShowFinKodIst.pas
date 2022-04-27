
unit ShowFinKodIst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FinKodIstController, AdvObj ;


type
  TfrmFinKodIstShow = class(TChildForm)  
  HTTPRIOFinKodIst: THTTPRIO;
    ImageList1: TImageList;
    sgFinKodIst: TAdvStringGrid;
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
procedure sgFinKodIstTopLeftChanged(Sender: TObject);
procedure sgFinKodIstDblClick(Sender: TObject);
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
 frmFinKodIstShow : TfrmFinKodIstShow;
 // FinKodIstObj: FinKodIst;
 // FinKodIstFilterObj: FinKodIstFilter;
  
  
implementation

uses Main, EditFinKodIst, EditFinKodIstFilter;


{$R *.dfm}

var
  //frmFinKodIstShow : TfrmFinKodIstShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FinKodIstHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmFinKodIstShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFinKodIstShow:=nil;
    inherited;
  end;


procedure TfrmFinKodIstShow.FormShow(Sender: TObject);
var
  TempFinKodIst: FinKodIstControllerSoapPort;
  i: Integer;
  FinKodIstList: FinKodIstShortList;
  begin
  SetGridHeaders(FinKodIstHeaders, sgFinKodIst.ColumnHeaders);
  ColCount:=100;
  TempFinKodIst :=  HTTPRIOFinKodIst as FinKodIstControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FinKodIstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FinKodIstList := TempFinKodIst.getScrollableFilteredList(FinKodIstFilter(FilterObject),0,ColCount);


  LastCount:=High(FinKodIstList.list);

  if LastCount > -1 then
     sgFinKodIst.RowCount:=LastCount+2
  else
     sgFinKodIst.RowCount:=2;

   with sgFinKodIst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FinKodIstList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FinKodIstList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FinKodIstList.list[i].name;
        if FinKodIstList.list[i].value <> Low(Integer) then
        Cells[2,i+1] := IntToStr(FinKodIstList.list[i].value)
        else
        Cells[2,i+1] := '';
        LastRow:=i+1;
        sgFinKodIst.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFinKodIst.Row:=1;
end;

procedure TfrmFinKodIstShow.sgFinKodIstTopLeftChanged(Sender: TObject);
var
  TempFinKodIst: FinKodIstControllerSoapPort;
  i,CurrentRow: Integer;
  FinKodIstList: FinKodIstShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFinKodIst.TopRow + sgFinKodIst.VisibleRowCount) = ColCount
  then
    begin
      TempFinKodIst :=  HTTPRIOFinKodIst as FinKodIstControllerSoapPort;
      CurrentRow:=sgFinKodIst.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FinKodIstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FinKodIstList := TempFinKodIst.getScrollableFilteredList(FinKodIstFilter(FilterObject),ColCount-1, 100);



  sgFinKodIst.RowCount:=sgFinKodIst.RowCount+100;
  LastCount:=High(FinKodIstList.list);
  with sgFinKodIst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FinKodIstList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FinKodIstList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FinKodIstList.list[i].name;
        if FinKodIstList.list[i].value <> Low(Integer) then
        Cells[2,i+CurrentRow] := IntToStr(FinKodIstList.list[i].value)
        else
        Cells[2,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFinKodIst.Row:=CurrentRow-5;
   sgFinKodIst.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFinKodIstShow.sgFinKodIstDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFinKodIst,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFinKodIstShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFinKodIst.RowCount-1 do
   for j:=0 to sgFinKodIst.ColCount-1 do
     sgFinKodIst.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFinKodIstShow.actViewExecute(Sender: TObject);
Var TempFinKodIst: FinKodIstControllerSoapPort;
begin
 TempFinKodIst := HTTPRIOFinKodIst as FinKodIstControllerSoapPort;
   try
     FinKodIstObj := TempFinKodIst.getObject(StrToInt(sgFinKodIst.Cells[0,sgFinKodIst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFinKodIstEdit:=TfrmFinKodIstEdit.Create(Application, dsView);
  try
    frmFinKodIstEdit.ShowModal;
  finally
    frmFinKodIstEdit.Free;
    frmFinKodIstEdit:=nil;
  end;
end;

procedure TfrmFinKodIstShow.actEditExecute(Sender: TObject);
Var TempFinKodIst: FinKodIstControllerSoapPort;
begin
 TempFinKodIst := HTTPRIOFinKodIst as FinKodIstControllerSoapPort;
   try
     FinKodIstObj := TempFinKodIst.getObject(StrToInt(sgFinKodIst.Cells[0,sgFinKodIst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFinKodIstEdit:=TfrmFinKodIstEdit.Create(Application, dsEdit);
  try
    if frmFinKodIstEdit.ShowModal= mrOk then
      begin
        //TempFinKodIst.save(FinKodIstObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFinKodIstEdit.Free;
    frmFinKodIstEdit:=nil;
  end;
end;

procedure TfrmFinKodIstShow.actDeleteExecute(Sender: TObject);
Var TempFinKodIst: FinKodIstControllerSoapPort;
  ObjCode: Integer;
begin
 TempFinKodIst := HTTPRIOFinKodIst as FinKodIstControllerSoapPort;
   try
     ObjCode := StrToInt(sgFinKodIst.Cells[0,sgFinKodIst.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Источник из ФК) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFinKodIst.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFinKodIstShow.actInsertExecute(Sender: TObject);
// Var TempFinKodIst: FinKodIstControllerSoapPort; 
begin
  // TempFinKodIst := HTTPRIOFinKodIst as FinKodIstControllerSoapPort;  /// Это здесь уже лишнее!!!
  FinKodIstObj:=FinKodIst.Create;



  try
    frmFinKodIstEdit:=TfrmFinKodIstEdit.Create(Application, dsInsert);
    try
      if frmFinKodIstEdit.ShowModal = mrOk then
      begin
        if FinKodIstObj<>nil then
            //TempFinKodIst.add(FinKodIstObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFinKodIstEdit.Free;
      frmFinKodIstEdit:=nil;
    end;
  finally
    FinKodIstObj.Free;
  end;
end;

procedure TfrmFinKodIstShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFinKodIstShow.actFilterExecute(Sender: TObject);
begin
{frmFinKodIstFilterEdit:=TfrmFinKodIstFilterEdit.Create(Application, dsInsert);
  try
    FinKodIstFilterObj := FinKodIstFilter.Create;
    SetNullIntProps(FinKodIstFilterObj);
    SetNullXSProps(FinKodIstFilterObj);

    if frmFinKodIstFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FinKodIstFilter.Create;
      FilterObject := FinKodIstFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFinKodIstFilterEdit.Free;
    frmFinKodIstFilterEdit:=nil;
  end;}
end;

procedure TfrmFinKodIstShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.