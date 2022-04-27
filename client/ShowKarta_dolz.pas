
unit ShowKarta_dolz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  Karta_dolzController;


type
  TfrmKarta_dolzShow = class(TChildForm)  
  HTTPRIOKarta_dolz: THTTPRIO;
    ImageList1: TImageList;
    sgKarta_dolz: TAdvStringGrid;
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
procedure sgKarta_dolzTopLeftChanged(Sender: TObject);
procedure sgKarta_dolzDblClick(Sender: TObject);
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

var frmKarta_dolzShow: TfrmKarta_dolzShow;
 // Karta_dolzObj: Karta_dolz;
 // Karta_dolzFilterObj: Karta_dolzFilter;

implementation

uses Main, EditKarta_dolz, EditKarta_dolzFilter;

{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  Karta_dolzHeaders: array [1..3] of String =
        ( 'Код'
          ,'Посада'
          ,'Разряд'
        );
   

procedure TfrmKarta_dolzShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmKarta_dolzShow:=nil;
    inherited;
  end;


procedure TfrmKarta_dolzShow.FormShow(Sender: TObject);
var
  TempKarta_dolz: Karta_dolzControllerSoapPort;
  i: Integer;
  Karta_dolzList: Karta_dolzShortList;
  begin
  SetGridHeaders(Karta_dolzHeaders, sgKarta_dolz.ColumnHeaders);
  ColCount:=100;
  TempKarta_dolz :=  HTTPRIOKarta_dolz as Karta_dolzControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := Karta_dolzFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  Karta_dolzList := TempKarta_dolz.getScrollableFilteredList(Karta_dolzFilter(FilterObject),0,ColCount);


  LastCount:=High(Karta_dolzList.list);

  if LastCount > -1 then
     sgKarta_dolz.RowCount:=LastCount+2
  else
     sgKarta_dolz.RowCount:=2;

   with sgKarta_dolz do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if Karta_dolzList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(Karta_dolzList.list[i].id)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := Karta_dolzList.list[i].name_dolz;
        Cells[2,i+1] := Karta_dolzList.list[i].razryad;
        LastRow:=i+1;
        sgKarta_dolz.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgKarta_dolz.Row:=1;
end;

procedure TfrmKarta_dolzShow.sgKarta_dolzTopLeftChanged(Sender: TObject);
var
  TempKarta_dolz: Karta_dolzControllerSoapPort;
  i,CurrentRow: Integer;
  Karta_dolzList: Karta_dolzShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgKarta_dolz.TopRow + sgKarta_dolz.VisibleRowCount) = ColCount
  then
    begin
      TempKarta_dolz :=  HTTPRIOKarta_dolz as Karta_dolzControllerSoapPort;
      CurrentRow:=sgKarta_dolz.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := Karta_dolzFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  Karta_dolzList := TempKarta_dolz.getScrollableFilteredList(Karta_dolzFilter(FilterObject),ColCount-1, 100);



  sgKarta_dolz.RowCount:=sgKarta_dolz.RowCount+100;
  LastCount:=High(Karta_dolzList.list);
  with sgKarta_dolz do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if Karta_dolzList.list[i].id <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(Karta_dolzList.list[i].id)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := Karta_dolzList.list[i].name_dolz;
        Cells[2,i+CurrentRow] := Karta_dolzList.list[i].razryad;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgKarta_dolz.Row:=CurrentRow-5;
   sgKarta_dolz.RowCount:=LastRow+1;
  end;
end;

procedure TfrmKarta_dolzShow.sgKarta_dolzDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgKarta_dolz,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmKarta_dolzShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgKarta_dolz.RowCount-1 do
   for j:=0 to sgKarta_dolz.ColCount-1 do
     sgKarta_dolz.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmKarta_dolzShow.actViewExecute(Sender: TObject);
Var TempKarta_dolz: Karta_dolzControllerSoapPort;
begin
 TempKarta_dolz := HTTPRIOKarta_dolz as Karta_dolzControllerSoapPort;
   try
     Karta_dolzObj := TempKarta_dolz.getObject(StrToInt(sgKarta_dolz.Cells[0,sgKarta_dolz.Row]));
   except
   on EConvertError do Exit;
  end;
  frmKarta_dolzEdit:=TfrmKarta_dolzEdit.Create(Application, dsView);
  try
    frmKarta_dolzEdit.ShowModal;
  finally
    frmKarta_dolzEdit.Free;
    frmKarta_dolzEdit:=nil;
  end;
end;

procedure TfrmKarta_dolzShow.actEditExecute(Sender: TObject);
Var TempKarta_dolz: Karta_dolzControllerSoapPort;
begin
 TempKarta_dolz := HTTPRIOKarta_dolz as Karta_dolzControllerSoapPort;
   try
     Karta_dolzObj := TempKarta_dolz.getObject(StrToInt(sgKarta_dolz.Cells[0,sgKarta_dolz.Row]));
   except
   on EConvertError do Exit;
  end;
  frmKarta_dolzEdit:=TfrmKarta_dolzEdit.Create(Application, dsEdit);
  try
    if frmKarta_dolzEdit.ShowModal= mrOk then
      begin
        //TempKarta_dolz.save(Karta_dolzObj);
        UpdateGrid(Sender);
      end;
  finally
    frmKarta_dolzEdit.Free;
    frmKarta_dolzEdit:=nil;
  end;
end;

procedure TfrmKarta_dolzShow.actDeleteExecute(Sender: TObject);
Var TempKarta_dolz: Karta_dolzControllerSoapPort;
  ObjCode: Integer;
begin
 TempKarta_dolz := HTTPRIOKarta_dolz as Karta_dolzControllerSoapPort;
   try
     ObjCode := StrToInt(sgKarta_dolz.Cells[0,sgKarta_dolz.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Норматівні посади) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempKarta_dolz.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmKarta_dolzShow.actInsertExecute(Sender: TObject);
Var TempKarta_dolz: Karta_dolzControllerSoapPort;
begin
  TempKarta_dolz := HTTPRIOKarta_dolz as Karta_dolzControllerSoapPort;
  Karta_dolzObj:=Karta_dolz.Create;



  try
    frmKarta_dolzEdit:=TfrmKarta_dolzEdit.Create(Application, dsInsert);
    try
      if frmKarta_dolzEdit.ShowModal = mrOk then
      begin
        if Karta_dolzObj<>nil then
            //TempKarta_dolz.add(Karta_dolzObj);
            UpdateGrid(Sender);
      end;
    finally
      frmKarta_dolzEdit.Free;
      frmKarta_dolzEdit:=nil;
    end;
  finally
    Karta_dolzObj.Free;
  end;
end;

procedure TfrmKarta_dolzShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmKarta_dolzShow.actFilterExecute(Sender: TObject);
begin
{frmKarta_dolzFilterEdit:=TfrmKarta_dolzFilterEdit.Create(Application, dsEdit);
  try
    Karta_dolzFilterObj := Karta_dolzFilter.Create;
    SetNullIntProps(Karta_dolzFilterObj);
    SetNullXSProps(Karta_dolzFilterObj);

    if frmKarta_dolzFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := Karta_dolzFilter.Create;
      FilterObject := Karta_dolzFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmKarta_dolzFilterEdit.Free;
    frmKarta_dolzFilterEdit:=nil;
  end;}
end;

procedure TfrmKarta_dolzShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.