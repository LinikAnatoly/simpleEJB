
unit ShowENCabelOutType10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCabelOutType10Controller, AdvObj ;


type
  TfrmENCabelOutType10Show = class(TChildForm)  
  HTTPRIOENCabelOutType10: THTTPRIO;
    ImageList1: TImageList;
    sgENCabelOutType10: TAdvStringGrid;
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
procedure sgENCabelOutType10TopLeftChanged(Sender: TObject);
procedure sgENCabelOutType10DblClick(Sender: TObject);
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
 frmENCabelOutType10Show : TfrmENCabelOutType10Show;
 // ENCabelOutType10Obj: ENCabelOutType10;
 // ENCabelOutType10FilterObj: ENCabelOutType10Filter;
  
  
implementation

uses Main, EditENCabelOutType10, EditENCabelOutType10Filter;


{$R *.dfm}

var
  //frmENCabelOutType10Show : TfrmENCabelOutType10Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCabelOutType10Headers: array [1..2] of String =
        ( 'Код'
          ,'Призначення кабельного виходу і вставки'
        );
   

procedure TfrmENCabelOutType10Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCabelOutType10Show:=nil;
    inherited;
  end;


procedure TfrmENCabelOutType10Show.FormShow(Sender: TObject);
var
  TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
  i: Integer;
  ENCabelOutType10List: ENCabelOutType10ShortList;
  begin
  SetGridHeaders(ENCabelOutType10Headers, sgENCabelOutType10.ColumnHeaders);
  ColCount:=100;
  TempENCabelOutType10 :=  HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelOutType10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelOutType10List := TempENCabelOutType10.getScrollableFilteredList(ENCabelOutType10Filter(FilterObject),0,ColCount);


  LastCount:=High(ENCabelOutType10List.list);

  if LastCount > -1 then
     sgENCabelOutType10.RowCount:=LastCount+2
  else
     sgENCabelOutType10.RowCount:=2;

   with sgENCabelOutType10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCabelOutType10List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCabelOutType10List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCabelOutType10List.list[i].name;
        LastRow:=i+1;
        sgENCabelOutType10.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCabelOutType10.Row:=1;
end;

procedure TfrmENCabelOutType10Show.sgENCabelOutType10TopLeftChanged(Sender: TObject);
var
  TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
  i,CurrentRow: Integer;
  ENCabelOutType10List: ENCabelOutType10ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCabelOutType10.TopRow + sgENCabelOutType10.VisibleRowCount) = ColCount
  then
    begin
      TempENCabelOutType10 :=  HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;
      CurrentRow:=sgENCabelOutType10.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelOutType10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelOutType10List := TempENCabelOutType10.getScrollableFilteredList(ENCabelOutType10Filter(FilterObject),ColCount-1, 100);



  sgENCabelOutType10.RowCount:=sgENCabelOutType10.RowCount+100;
  LastCount:=High(ENCabelOutType10List.list);
  with sgENCabelOutType10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCabelOutType10List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCabelOutType10List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCabelOutType10List.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCabelOutType10.Row:=CurrentRow-5;
   sgENCabelOutType10.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCabelOutType10Show.sgENCabelOutType10DblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCabelOutType10,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCabelOutType10Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCabelOutType10.RowCount-1 do
   for j:=0 to sgENCabelOutType10.ColCount-1 do
     sgENCabelOutType10.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCabelOutType10Show.actViewExecute(Sender: TObject);
Var TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
begin
 TempENCabelOutType10 := HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;
   try
     ENCabelOutType10Obj := TempENCabelOutType10.getObject(StrToInt(sgENCabelOutType10.Cells[0,sgENCabelOutType10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelOutType10Edit:=TfrmENCabelOutType10Edit.Create(Application, dsView);
  try
    frmENCabelOutType10Edit.ShowModal;
  finally
    frmENCabelOutType10Edit.Free;
    frmENCabelOutType10Edit:=nil;
  end;
end;

procedure TfrmENCabelOutType10Show.actEditExecute(Sender: TObject);
Var TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
begin
 TempENCabelOutType10 := HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;
   try
     ENCabelOutType10Obj := TempENCabelOutType10.getObject(StrToInt(sgENCabelOutType10.Cells[0,sgENCabelOutType10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelOutType10Edit:=TfrmENCabelOutType10Edit.Create(Application, dsEdit);
  try
    if frmENCabelOutType10Edit.ShowModal= mrOk then
      begin
        //TempENCabelOutType10.save(ENCabelOutType10Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCabelOutType10Edit.Free;
    frmENCabelOutType10Edit:=nil;
  end;
end;

procedure TfrmENCabelOutType10Show.actDeleteExecute(Sender: TObject);
Var TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCabelOutType10 := HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCabelOutType10.Cells[0,sgENCabelOutType10.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Призначення кабельного виходу і вставки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCabelOutType10.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCabelOutType10Show.actInsertExecute(Sender: TObject);
// Var TempENCabelOutType10: ENCabelOutType10ControllerSoapPort; 
begin
  // TempENCabelOutType10 := HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCabelOutType10Obj:=ENCabelOutType10.Create;



  try
    frmENCabelOutType10Edit:=TfrmENCabelOutType10Edit.Create(Application, dsInsert);
    try
      if frmENCabelOutType10Edit.ShowModal = mrOk then
      begin
        if ENCabelOutType10Obj<>nil then
            //TempENCabelOutType10.add(ENCabelOutType10Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCabelOutType10Edit.Free;
      frmENCabelOutType10Edit:=nil;
    end;
  finally
    ENCabelOutType10Obj.Free;
  end;
end;

procedure TfrmENCabelOutType10Show.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCabelOutType10Show.actFilterExecute(Sender: TObject);
begin
{frmENCabelOutType10FilterEdit:=TfrmENCabelOutType10FilterEdit.Create(Application, dsInsert);
  try
    ENCabelOutType10FilterObj := ENCabelOutType10Filter.Create;
    SetNullIntProps(ENCabelOutType10FilterObj);
    SetNullXSProps(ENCabelOutType10FilterObj);

    if frmENCabelOutType10FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCabelOutType10Filter.Create;
      FilterObject := ENCabelOutType10FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCabelOutType10FilterEdit.Free;
    frmENCabelOutType10FilterEdit:=nil;
  end;}
end;

procedure TfrmENCabelOutType10Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.