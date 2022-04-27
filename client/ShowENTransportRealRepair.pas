
unit ShowENTransportRealRepair;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENTransportRealRepairController, AdvObj ;


type
    TfrmENTransportRealRepairShow = class(TChildForm)  
    HTTPRIOENTransportRealRepair: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportRealRepair: TAdvStringGrid;
    ActionListRepair: TActionList;
    actViewRepair: TAction;
    actInsertRepair: TAction;
    actDeleteRepair: TAction;
    actEditRepair: TAction;
    actUpdateRepair: TAction;
    actFilterRepair: TAction;
    actNoFilterRepair: TAction;
    PopupMenuRepair: TPopupMenu;
    N1Repair: TMenuItem;
    N2Repair: TMenuItem;
    N3Repair: TMenuItem;
    N4Repair: TMenuItem;
    N6Repair: TMenuItem;
    N7Repair: TMenuItem;
    N8Repair: TMenuItem;
    ToolBar1Repair: TToolBar;
    ToolButtonRepair: TToolButton;
    ToolButton6Repair: TToolButton;
    ToolButton7Repair: TToolButton;
    ToolButton8Repair: TToolButton;
    ToolButton11Repair: TToolButton;
    ToolButton2Repair: TToolButton;
    ToolButton3Repair: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENTransportRealRepairTopLeftChanged(Sender: TObject);
    procedure sgENTransportRealRepairDblClick(Sender: TObject);
    procedure actViewRepairExecute(Sender: TObject);
    procedure actEditRepairExecute(Sender: TObject);
    procedure actDeleteRepairExecute(Sender: TObject);
    procedure actInsertRepairExecute(Sender: TObject);
    procedure actUpdateRepairExecute(Sender: TObject);
    procedure actFilterRepairExecute(Sender: TObject);
    procedure actNoFilterRepairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENTransportRealRepairShow : TfrmENTransportRealRepairShow;
 // ENTransportRealRepairObj: ENTransportRealRepair;
 // ENTransportRealRepairFilterObj: ENTransportRealRepairFilter;
  
  
implementation

uses Main, EditENTransportRealRepair, EditENTransportRealRepairFilter;


{$R *.dfm}

var
  //frmENTransportRealRepairShow : TfrmENTransportRealRepairShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportRealRepairHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата початку періоду'
          ,'Дата закінчення періоду'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENTransportRealRepairShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENTransportRealRepairShow:=nil;
  inherited;
end;


procedure TfrmENTransportRealRepairShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENTransportRealRepairShow.FormShow(Sender: TObject);
var
  TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
  i: Integer;
  ENTransportRealRepairList: ENTransportRealRepairShortList;
begin
  SetGridHeaders(ENTransportRealRepairHeaders, sgENTransportRealRepair.ColumnHeaders);
  ColCount:=100;
  TempENTransportRealRepair :=  HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRealRepairFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRealRepairList := TempENTransportRealRepair.getScrollableFilteredList(ENTransportRealRepairFilter(FilterObject),0,ColCount);
  LastCount:=High(ENTransportRealRepairList.list);

  if LastCount > -1 then
     sgENTransportRealRepair.RowCount:=LastCount+2
  else
     sgENTransportRealRepair.RowCount:=2;

   with sgENTransportRealRepair do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRealRepairList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportRealRepairList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTransportRealRepairList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENTransportRealRepairList.list[i].dateStart);
        if ENTransportRealRepairList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTransportRealRepairList.list[i].dateFinal);
        Cells[3,i+1] := ENTransportRealRepairList.list[i].userGen;
        if ENTransportRealRepairList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENTransportRealRepairList.list[i].dateEdit);
        LastRow:=i+1;
        sgENTransportRealRepair.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENTransportRealRepair.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENTransportRealRepair.RowCount > selectedRow then
      sgENTransportRealRepair.Row := selectedRow
    else
      sgENTransportRealRepair.Row := sgENTransportRealRepair.RowCount - 1;
    end
    else
      sgENTransportRealRepair.Row:=1;   
end;


procedure TfrmENTransportRealRepairShow.sgENTransportRealRepairTopLeftChanged(Sender: TObject);
var
  TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportRealRepairList: ENTransportRealRepairShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportRealRepair.TopRow + sgENTransportRealRepair.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportRealRepair :=  HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;
      CurrentRow:=sgENTransportRealRepair.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRealRepairFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRealRepairList := TempENTransportRealRepair.getScrollableFilteredList(ENTransportRealRepairFilter(FilterObject),ColCount-1, 100);


  sgENTransportRealRepair.RowCount:=sgENTransportRealRepair.RowCount+100;
  LastCount:=High(ENTransportRealRepairList.list);
  with sgENTransportRealRepair do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRealRepairList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportRealRepairList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTransportRealRepairList.list[i].dateStart = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENTransportRealRepairList.list[i].dateStart);
        if ENTransportRealRepairList.list[i].dateFinal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENTransportRealRepairList.list[i].dateFinal);
        Cells[3,i+CurrentRow] := ENTransportRealRepairList.list[i].userGen;
        if ENTransportRealRepairList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENTransportRealRepairList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportRealRepair.Row:=CurrentRow-5;
   sgENTransportRealRepair.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportRealRepairShow.sgENTransportRealRepairDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportRealRepair,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENTransportRealRepairShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENTransportRealRepair.RowCount-1 do
   for j:=0 to sgENTransportRealRepair.ColCount-1 do
     sgENTransportRealRepair.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENTransportRealRepairShow.actViewRepairExecute(Sender: TObject);
var 
  TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
begin
  TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;
  try
    ENTransportRealRepairObj := TempENTransportRealRepair.getObject(StrToInt(sgENTransportRealRepair.Cells[0,sgENTransportRealRepair.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENTransportRealRepair.Row;
  frmENTransportRealRepairEdit:=TfrmENTransportRealRepairEdit.Create(Application, dsView);
  
  try
    frmENTransportRealRepairEdit.ShowModal;
  finally
    frmENTransportRealRepairEdit.Free;
    frmENTransportRealRepairEdit:=nil;
  end;

  if sgENTransportRealRepair.RowCount > selectedRow then
    sgENTransportRealRepair.Row := selectedRow
  else
    sgENTransportRealRepair.Row := sgENTransportRealRepair.RowCount - 1;
  
end;


procedure TfrmENTransportRealRepairShow.actEditRepairExecute(Sender: TObject);
var 
  TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
begin
  TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;
  try
    ENTransportRealRepairObj := TempENTransportRealRepair.getObject(StrToInt(sgENTransportRealRepair.Cells[0,sgENTransportRealRepair.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENTransportRealRepair.Row;
  frmENTransportRealRepairEdit:=TfrmENTransportRealRepairEdit.Create(Application, dsEdit);
  
  try
    if frmENTransportRealRepairEdit.ShowModal= mrOk then
      begin
        //TempENTransportRealRepair.save(ENTransportRealRepairObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportRealRepairEdit.Free;
    frmENTransportRealRepairEdit:=nil;
  end;

  if sgENTransportRealRepair.RowCount > selectedRow then
    sgENTransportRealRepair.Row := selectedRow
  else
    sgENTransportRealRepair.Row := sgENTransportRealRepair.RowCount - 1;
  
end;


procedure TfrmENTransportRealRepairShow.actDeleteRepairExecute(Sender: TObject);
Var TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportRealRepair.Cells[0,sgENTransportRealRepair.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ремонт транспорта) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportRealRepair.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportRealRepairShow.actInsertRepairExecute(Sender: TObject);
// Var TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort; 
begin
  // TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTransportRealRepairObj:=ENTransportRealRepair.Create;
  SetNullIntProps(ENTransportRealRepairObj);
  SetNullXSProps(ENTransportRealRepairObj);

   //ENTransportRealRepairObj.dateStart:= TXSDate.Create;
   //ENTransportRealRepairObj.dateFinal:= TXSDate.Create;
   //ENTransportRealRepairObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENTransportRealRepairEdit:=TfrmENTransportRealRepairEdit.Create(Application, dsInsert);
    try
      if frmENTransportRealRepairEdit.ShowModal = mrOk then
      begin
        if ENTransportRealRepairObj<>nil then
            //TempENTransportRealRepair.add(ENTransportRealRepairObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportRealRepairEdit.Free;
      frmENTransportRealRepairEdit:=nil;
    end;
  finally
    ENTransportRealRepairObj.Free;
  end;
end;


procedure TfrmENTransportRealRepairShow.actUpdateRepairExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENTransportRealRepairShow.actFilterRepairExecute(Sender: TObject);
begin
{frmENTransportRealRepairFilterEdit:=TfrmENTransportRealRepairFilterEdit.Create(Application, dsInsert);
  try
    ENTransportRealRepairFilterObj := ENTransportRealRepairFilter.Create;
    SetNullIntProps(ENTransportRealRepairFilterObj);
    SetNullXSProps(ENTransportRealRepairFilterObj);

    if frmENTransportRealRepairFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENTransportRealRepairFilter.Create;
      FilterObject := ENTransportRealRepairFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportRealRepairFilterEdit.Free;
    frmENTransportRealRepairFilterEdit:=nil;
  end;}
end;


procedure TfrmENTransportRealRepairShow.actNoFilterRepairExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.