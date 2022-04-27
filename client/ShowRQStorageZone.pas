
unit ShowRQStorageZone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQStorageZoneController, AdvObj ;


type
  TfrmRQStorageZoneShow = class(TChildForm)  
  HTTPRIORQStorageZone: THTTPRIO;
    ImageList1: TImageList;
    sgRQStorageZone: TAdvStringGrid;
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
procedure sgRQStorageZoneTopLeftChanged(Sender: TObject);
procedure sgRQStorageZoneDblClick(Sender: TObject);
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
 frmRQStorageZoneShow : TfrmRQStorageZoneShow;
 // RQStorageZoneObj: RQStorageZone;
 // RQStorageZoneFilterObj: RQStorageZoneFilter;
  
  
implementation

uses Main, EditRQStorageZone, EditRQStorageZoneFilter;


{$R *.dfm}

var
  //frmRQStorageZoneShow : TfrmRQStorageZoneShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorageZoneHeaders: array [1..6] of String =
        ( 'Код'
          ,'Склад'
          ,'Місце зберігання'
          ,'Опис'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQStorageZoneShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQStorageZoneShow:=nil;
    inherited;
  end;


procedure TfrmRQStorageZoneShow.FormShow(Sender: TObject);
var
  TempRQStorageZone: RQStorageZoneControllerSoapPort;
  i: Integer;
  RQStorageZoneList: RQStorageZoneShortList;
  begin
  SetGridHeaders(RQStorageZoneHeaders, sgRQStorageZone.ColumnHeaders);
  ColCount:=100;
  TempRQStorageZone :=  HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageZoneFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageZoneList := TempRQStorageZone.getScrollableFilteredList(RQStorageZoneFilter(FilterObject),0,ColCount);


  LastCount:=High(RQStorageZoneList.list);

  if LastCount > -1 then
     sgRQStorageZone.RowCount:=LastCount+2
  else
     sgRQStorageZone.RowCount:=2;

   with sgRQStorageZone do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if RQStorageZoneList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQStorageZoneList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQStorageZoneList.list[i].storageName;
        Cells[2,i+1] := RQStorageZoneList.list[i].name;
        Cells[3,i+1] := RQStorageZoneList.list[i].description;
        Cells[4,i+1] := RQStorageZoneList.list[i].userGen;

        if RQStorageZoneList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(RQStorageZoneList.list[i].dateEdit);

        LastRow:=i+1;
        sgRQStorageZone.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQStorageZone.Row:=1;
end;

procedure TfrmRQStorageZoneShow.sgRQStorageZoneTopLeftChanged(Sender: TObject);
var
  TempRQStorageZone: RQStorageZoneControllerSoapPort;
  i,CurrentRow: Integer;
  RQStorageZoneList: RQStorageZoneShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQStorageZone.TopRow + sgRQStorageZone.VisibleRowCount) = ColCount
  then
    begin
      TempRQStorageZone :=  HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
      CurrentRow:=sgRQStorageZone.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageZoneFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageZoneList := TempRQStorageZone.getScrollableFilteredList(RQStorageZoneFilter(FilterObject),ColCount-1, 100);



  sgRQStorageZone.RowCount:=sgRQStorageZone.RowCount+100;
  LastCount:=High(RQStorageZoneList.list);
  with sgRQStorageZone do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if RQStorageZoneList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQStorageZoneList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := RQStorageZoneList.list[i].storageName;
        Cells[2,i+CurrentRow] := RQStorageZoneList.list[i].name;
        Cells[3,i+CurrentRow] := RQStorageZoneList.list[i].description;
        Cells[4,i+CurrentRow] := RQStorageZoneList.list[i].userGen;

        if RQStorageZoneList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(RQStorageZoneList.list[i].dateEdit);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQStorageZone.Row:=CurrentRow-5;
   sgRQStorageZone.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQStorageZoneShow.sgRQStorageZoneDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQStorageZone,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQStorageZoneShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQStorageZone.RowCount-1 do
   for j:=0 to sgRQStorageZone.ColCount-1 do
     sgRQStorageZone.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQStorageZoneShow.actViewExecute(Sender: TObject);
Var TempRQStorageZone: RQStorageZoneControllerSoapPort;
begin
 TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
   try
     RQStorageZoneObj := TempRQStorageZone.getObject(StrToInt(sgRQStorageZone.Cells[0,sgRQStorageZone.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageZoneEdit:=TfrmRQStorageZoneEdit.Create(Application, dsView);
  try
    frmRQStorageZoneEdit.ShowModal;
  finally
    frmRQStorageZoneEdit.Free;
    frmRQStorageZoneEdit:=nil;
  end;
end;

procedure TfrmRQStorageZoneShow.actEditExecute(Sender: TObject);
Var TempRQStorageZone: RQStorageZoneControllerSoapPort;
begin
 TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
   try
     RQStorageZoneObj := TempRQStorageZone.getObject(StrToInt(sgRQStorageZone.Cells[0,sgRQStorageZone.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageZoneEdit:=TfrmRQStorageZoneEdit.Create(Application, dsEdit);
  try
    if frmRQStorageZoneEdit.ShowModal= mrOk then
      begin
        //TempRQStorageZone.save(RQStorageZoneObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQStorageZoneEdit.Free;
    frmRQStorageZoneEdit:=nil;
  end;
end;

procedure TfrmRQStorageZoneShow.actDeleteExecute(Sender: TObject);
Var TempRQStorageZone: RQStorageZoneControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQStorageZone.Cells[0,sgRQStorageZone.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Місця зберігання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQStorageZone.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQStorageZoneShow.actInsertExecute(Sender: TObject);
// Var TempRQStorageZone: RQStorageZoneControllerSoapPort; 
begin
  // TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQStorageZoneObj:=RQStorageZone.Create;

   //RQStorageZoneObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQStorageZoneEdit:=TfrmRQStorageZoneEdit.Create(Application, dsInsert);
    try
      if frmRQStorageZoneEdit.ShowModal = mrOk then
      begin
        if RQStorageZoneObj<>nil then
            //TempRQStorageZone.add(RQStorageZoneObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQStorageZoneEdit.Free;
      frmRQStorageZoneEdit:=nil;
    end;
  finally
    RQStorageZoneObj.Free;
  end;
end;

procedure TfrmRQStorageZoneShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQStorageZoneShow.actFilterExecute(Sender: TObject);
var
strConditionSQL : String;
begin
  frmRQStorageZoneFilterEdit:=TfrmRQStorageZoneFilterEdit.Create(Application, dsInsert);
  try

    // Запоминание conditionSQL если оно было задано
    if FilterObject <> nil then
      if RQStorageZoneFilter(FilterObject).conditionSQL <> '' then
        strConditionSQL := RQStorageZoneFilter(FilterObject).conditionSQL;
    RQStorageZoneFilterObj := RQStorageZoneFilter.Create;
    SetNullIntProps(RQStorageZoneFilterObj);
    SetNullXSProps(RQStorageZoneFilterObj);

    if frmRQStorageZoneFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQStorageZoneFilter.Create;
      FilterObject := RQStorageZoneFilterObj;
      RQStorageZoneFilter(FilterObject).conditionSQL := strConditionSQL;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQStorageZoneFilterEdit.Free;
    frmRQStorageZoneFilterEdit:=nil;
  end;
end;

procedure TfrmRQStorageZoneShow.actNoFilterExecute(Sender: TObject);
var
  strConditionSQL : WideString;
begin

  // Запоминание условие если было задано
  strConditionSQL := RQStorageZoneFilter(FilterObject).conditionSQL;
  FilterObject.Free;
  FilterObject := nil;

  FilterObject := RQStorageZoneFilter.Create;
  SetNullXSProps(FilterObject);
  SetNullIntProps(FilterObject);
  RQStorageZoneFilter(FilterObject).conditionSQL := strConditionSQL;
  UpdateGrid(Sender);
end;

end.