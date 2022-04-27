
unit ShowENCottage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCottageController, AdvObj;


type
    TfrmENCottageShow = class(TChildForm)
    HTTPRIOENCottage: THTTPRIO;
    ImageList1: TImageList;
    sgENCottage: TAdvStringGrid;
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
    procedure sgENCottageTopLeftChanged(Sender: TObject);
    procedure sgENCottageDblClick(Sender: TObject);
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
 // ENCottageObj: ENCottage;
 // ENCottageFilterObj: ENCottageFilter;
 frmENCottageShow : TfrmENCottageShow;
  
  
implementation

uses Main, EditENCottage, EditENCottageFilter;


{$R *.dfm}

var
  //frmENCottageShow : TfrmENCottageShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCottageHeaders: array [1..7] of String =
        ( 'Код'
          ,'№ Котеджу'
          ,'Кількість спальних місць'
          ,'Опис котеджу'
          ,'Коментар'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENCottageShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCottageShow:=nil;
    inherited;
  end;


procedure TfrmENCottageShow.FormShow(Sender: TObject);
var
  TempENCottage: ENCottageControllerSoapPort;
  i: Integer;
  ENCottageList: ENCottageShortList;
begin
  SetGridHeaders(ENCottageHeaders, sgENCottage.ColumnHeaders);
  ColCount:=100;
  TempENCottage :=  HTTPRIOENCottage as ENCottageControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCottageFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCottageList := TempENCottage.getScrollableFilteredList(ENCottageFilter(FilterObject),0,ColCount);

  LastCount:=High(ENCottageList.list);

  if LastCount > -1 then
     sgENCottage.RowCount:=LastCount+2
  else
     sgENCottage.RowCount:=2;

   with sgENCottage do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCottageList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCottageList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCottageList.list[i].numberGen;
        if ENCottageList.list[i].numberBeds = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENCottageList.list[i].numberBeds);
        Cells[3,i+1] := ENCottageList.list[i].description;
        Cells[4,i+1] := ENCottageList.list[i].commentgen;
        Cells[5,i+1] := ENCottageList.list[i].userGen;
        if ENCottageList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENCottageList.list[i].dateEdit);
        LastRow:=i+1;
        sgENCottage.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCottage.Row:=1;
end;

procedure TfrmENCottageShow.sgENCottageTopLeftChanged(Sender: TObject);
var
  TempENCottage: ENCottageControllerSoapPort;
  i,CurrentRow: Integer;
  ENCottageList: ENCottageShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENCottage.TopRow + sgENCottage.VisibleRowCount) = ColCount
  then
  begin
      TempENCottage :=  HTTPRIOENCottage as ENCottageControllerSoapPort;
      CurrentRow:=sgENCottage.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCottageFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCottageList := TempENCottage.getScrollableFilteredList(ENCottageFilter(FilterObject),ColCount-1, 100);

  sgENCottage.RowCount:=sgENCottage.RowCount+100;
  LastCount:=High(ENCottageList.list);
  with sgENCottage do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCottageList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCottageList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCottageList.list[i].numberGen;
        if ENCottageList.list[i].numberBeds = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENCottageList.list[i].numberBeds);
        Cells[3,i+CurrentRow] := ENCottageList.list[i].description;
        Cells[4,i+CurrentRow] := ENCottageList.list[i].commentgen;
        Cells[5,i+CurrentRow] := ENCottageList.list[i].userGen;
        if ENCottageList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENCottageList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCottage.Row:=CurrentRow-5;
   sgENCottage.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCottageShow.sgENCottageDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCottage,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCottageShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCottage.RowCount-1 do
   for j:=0 to sgENCottage.ColCount-1 do
     sgENCottage.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCottageShow.actViewExecute(Sender: TObject);
Var TempENCottage: ENCottageControllerSoapPort;
begin
  TempENCottage := HTTPRIOENCottage as ENCottageControllerSoapPort;
  try
     ENCottageObj := TempENCottage.getObject(StrToInt(sgENCottage.Cells[0,sgENCottage.Row]));
  except
   on EConvertError do Exit;
  end;

  frmENCottageEdit:=TfrmENCottageEdit.Create(Application, dsView);
  try
    frmENCottageEdit.ShowModal;
  finally
    frmENCottageEdit.Free;
    frmENCottageEdit:=nil;
  end;
end;

procedure TfrmENCottageShow.actEditExecute(Sender: TObject);
Var TempENCottage: ENCottageControllerSoapPort;
begin
  TempENCottage := HTTPRIOENCottage as ENCottageControllerSoapPort;
  try
     ENCottageObj := TempENCottage.getObject(StrToInt(sgENCottage.Cells[0,sgENCottage.Row]));
  except
   on EConvertError do Exit;
  end;

  frmENCottageEdit:=TfrmENCottageEdit.Create(Application, dsEdit);
  try
    if frmENCottageEdit.ShowModal= mrOk then
      begin
        //TempENCottage.save(ENCottageObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCottageEdit.Free;
    frmENCottageEdit:=nil;
  end;
end;

procedure TfrmENCottageShow.actDeleteExecute(Sender: TObject);
Var TempENCottage: ENCottageControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCottage := HTTPRIOENCottage as ENCottageControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCottage.Cells[0,sgENCottage.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Котедж) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCottage.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCottageShow.actInsertExecute(Sender: TObject);
// Var TempENCottage: ENCottageControllerSoapPort; 
begin
  // TempENCottage := HTTPRIOENCottage as ENCottageControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCottageObj:=ENCottage.Create;
  try
    frmENCottageEdit:=TfrmENCottageEdit.Create(Application, dsInsert);
    try
      if frmENCottageEdit.ShowModal = mrOk then
      begin
        if ENCottageObj<>nil then
            //TempENCottage.add(ENCottageObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCottageEdit.Free;
      frmENCottageEdit:=nil;
    end;
  finally
    ENCottageObj.Free;
  end;
end;


procedure TfrmENCottageShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENCottageShow.actFilterExecute(Sender: TObject);
begin
{frmENCottageFilterEdit:=TfrmENCottageFilterEdit.Create(Application, dsInsert);
  try
    ENCottageFilterObj := ENCottageFilter.Create;
    SetNullIntProps(ENCottageFilterObj);
    SetNullXSProps(ENCottageFilterObj);

    if frmENCottageFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCottageFilter.Create;
      FilterObject := ENCottageFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCottageFilterEdit.Free;
    frmENCottageFilterEdit:=nil;
  end;}
end;

procedure TfrmENCottageShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.