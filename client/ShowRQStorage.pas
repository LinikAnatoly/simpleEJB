
unit ShowRQStorage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQStorageController, AdvObj ;


type
  TfrmRQStorageShow = class(TChildForm)  
  HTTPRIORQStorage: THTTPRIO;
    ImageList1: TImageList;
    sgRQStorage: TAdvStringGrid;
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
procedure sgRQStorageTopLeftChanged(Sender: TObject);
procedure sgRQStorageDblClick(Sender: TObject);
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
 frmRQStorageShow : TfrmRQStorageShow;
 // RQStorageObj: RQStorage;
 // RQStorageFilterObj: RQStorageFilter;
  
  
implementation

uses Main, EditRQStorage, EditRQStorageFilter;


{$R *.dfm}

var
  //frmRQStorageShow : TfrmRQStorageShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorageHeaders: array [1..6] of String =
        ( 'Код'
          ,'Найменування'
          ,'Скорочене найменування'
          ,'Опис'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQStorageShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQStorageShow:=nil;
    inherited;
  end;


procedure TfrmRQStorageShow.FormShow(Sender: TObject);
var
  TempRQStorage: RQStorageControllerSoapPort;
  i: Integer;
  RQStorageList: RQStorageShortList;
  begin
  SetGridHeaders(RQStorageHeaders, sgRQStorage.ColumnHeaders);
  ColCount:=100;
  TempRQStorage :=  HTTPRIORQStorage as RQStorageControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageList := TempRQStorage.getScrollableFilteredList(RQStorageFilter(FilterObject),0,ColCount);


  LastCount:=High(RQStorageList.list);

  if LastCount > -1 then
     sgRQStorage.RowCount:=LastCount+2
  else
     sgRQStorage.RowCount:=2;

   with sgRQStorage do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorageList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQStorageList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQStorageList.list[i].name;
        Cells[2,i+1] := RQStorageList.list[i].shortName;
        Cells[3,i+1] := RQStorageList.list[i].description;
        Cells[4,i+1] := RQStorageList.list[i].userGen;
        if RQStorageList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(RQStorageList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQStorage.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQStorage.Row:=1;
end;

procedure TfrmRQStorageShow.sgRQStorageTopLeftChanged(Sender: TObject);
var
  TempRQStorage: RQStorageControllerSoapPort;
  i,CurrentRow: Integer;
  RQStorageList: RQStorageShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQStorage.TopRow + sgRQStorage.VisibleRowCount) = ColCount
  then
    begin
      TempRQStorage :=  HTTPRIORQStorage as RQStorageControllerSoapPort;
      CurrentRow:=sgRQStorage.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageList := TempRQStorage.getScrollableFilteredList(RQStorageFilter(FilterObject),ColCount-1, 100);



  sgRQStorage.RowCount:=sgRQStorage.RowCount+100;
  LastCount:=High(RQStorageList.list);
  with sgRQStorage do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorageList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQStorageList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQStorageList.list[i].name;
        Cells[2,i+CurrentRow] := RQStorageList.list[i].shortName;
        Cells[3,i+CurrentRow] := RQStorageList.list[i].description;
        Cells[4,i+CurrentRow] := RQStorageList.list[i].userGen;
        if RQStorageList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(RQStorageList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQStorage.Row:=CurrentRow-5;
   sgRQStorage.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQStorageShow.sgRQStorageDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQStorage,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQStorageShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQStorage.RowCount-1 do
   for j:=0 to sgRQStorage.ColCount-1 do
     sgRQStorage.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQStorageShow.actViewExecute(Sender: TObject);
Var TempRQStorage: RQStorageControllerSoapPort;
begin
 TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;
   try
     RQStorageObj := TempRQStorage.getObject(StrToInt(sgRQStorage.Cells[0,sgRQStorage.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageEdit:=TfrmRQStorageEdit.Create(Application, dsView);
  try
    frmRQStorageEdit.ShowModal;
  finally
    frmRQStorageEdit.Free;
    frmRQStorageEdit:=nil;
  end;
end;

procedure TfrmRQStorageShow.actEditExecute(Sender: TObject);
Var TempRQStorage: RQStorageControllerSoapPort;
begin
 TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;
   try
     RQStorageObj := TempRQStorage.getObject(StrToInt(sgRQStorage.Cells[0,sgRQStorage.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageEdit:=TfrmRQStorageEdit.Create(Application, dsEdit);
  try
    if frmRQStorageEdit.ShowModal= mrOk then
      begin
        //TempRQStorage.save(RQStorageObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQStorageEdit.Free;
    frmRQStorageEdit:=nil;
  end;
end;

procedure TfrmRQStorageShow.actDeleteExecute(Sender: TObject);
Var TempRQStorage: RQStorageControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQStorage.Cells[0,sgRQStorage.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Склади) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQStorage.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQStorageShow.actInsertExecute(Sender: TObject);
// Var TempRQStorage: RQStorageControllerSoapPort; 
begin
  // TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQStorageObj:=RQStorage.Create;

   //RQStorageObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQStorageEdit:=TfrmRQStorageEdit.Create(Application, dsInsert);
    try
      if frmRQStorageEdit.ShowModal = mrOk then
      begin
        if RQStorageObj<>nil then
            //TempRQStorage.add(RQStorageObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQStorageEdit.Free;
      frmRQStorageEdit:=nil;
    end;
  finally
    RQStorageObj.Free;
  end;
end;

procedure TfrmRQStorageShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQStorageShow.actFilterExecute(Sender: TObject);
begin
frmRQStorageFilterEdit:=TfrmRQStorageFilterEdit.Create(Application, dsInsert);
  try
    RQStorageFilterObj := RQStorageFilter.Create;
    SetNullIntProps(RQStorageFilterObj);
    SetNullXSProps(RQStorageFilterObj);

    if frmRQStorageFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQStorageFilter.Create;
      FilterObject := RQStorageFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQStorageFilterEdit.Free;
    frmRQStorageFilterEdit:=nil;
  end;
end;

procedure TfrmRQStorageShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.