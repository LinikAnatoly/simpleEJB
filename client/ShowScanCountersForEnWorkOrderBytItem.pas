
unit ShowScanCountersForEnWorkOrderBytItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ScanCountersController,AdvObj, StdCtrls ;


type
  TfrmScanCountersShowForEnWorkOrderBytItem = class(TChildForm)
    ImageList1: TImageList;
    sgScanCounters: TAdvStringGrid;
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
    HTTPRIOScanCounters: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgScanCountersTopLeftChanged(Sender: TObject);
procedure sgScanCountersDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
procedure actSelectExecute(Sender: TObject); override;
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   isFiltered : boolean;
   workorderbytitemcode : Integer;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmScanCountersShowForEnWorkOrderBytItem : TfrmScanCountersShowForEnWorkOrderBytItem;
 // ScanCountersObj: ScanCounters;
 // ScanCountersFilterObj: ScanCountersFilter;
budgetCode:Integer;
molCode:String;

implementation

uses Main,EditScanCountersFilter, EditScanCountersFilterForEnWorkOrderBytItem;//, EditScanCounters, EditScanCountersFilter, EditCounterFilter;


{$R *.dfm}

var
 // frmScanCountersShow : TfrmScanCountersShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ScanCountersHeaders: array [1..11] of String =
        (  'Код'       // 0
          ,'Наименование'  // 1
          ,'Тип счетчика'  // 2
          ,'Инв. №'        // 3
          ,'Серийный №'    // 4
          ,'Код РЭСа'      // 5
          ,'Дата выпуска'  // 6
          ,'Стоим. с НДС'  // 7
          ,'Счет'          // 8
          ,'Код МОЛ'       // 9
          ,'Наименование МОЛ'// 10
        );
   

procedure TfrmScanCountersShowForEnWorkOrderBytItem.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmScanCountersShowForEnWorkOrderBytItem:=nil;
    inherited;
  end;


procedure TfrmScanCountersShowForEnWorkOrderBytItem.FormCreate(Sender: TObject);
begin
  inherited;
  isFiltered := false;
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.FormShow(Sender: TObject);
var
  TempScanCounters: ScanCountersControllerSoapPort;
  i: Integer;
  ScanCountersList: ScanCountersShortList;
  begin
  SetGridHeaders(ScanCountersHeaders, sgScanCounters.ColumnHeaders);
  ColCount:=100;
  TempScanCounters :=  HTTPRIOScanCounters as ScanCountersControllerSoapPort;




  if FilterObject = nil then
  begin
     FilterObject := ScanCountersFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     isFiltered := false;
  end;

  if not isFiltered then
  begin
     //isFiltered := true;
     actFilterExecute(Sender);
     exit;
  end;

  begin
  ScanCountersList := TempScanCounters.getScrollableFilteredListNetForEnWorkOrderBytItem
  (ScanCountersFilter(FilterObject),
  0,
  ColCount,
  workorderbytitemcode);


  LastCount:=High(ScanCountersList.list);

  if LastCount > -1 then
     sgScanCounters.RowCount:=LastCount+2
  else
     sgScanCounters.RowCount:=2;

   with sgScanCounters do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        Cells[0,i+1] := IntToStr(ScanCountersList.list[i].num_un);
        Cells[1,i+1] := ScanCountersList.list[i].name;
        Cells[2,i+1] := ScanCountersList.list[i].type_counter;
        Cells[3,i+1] := ScanCountersList.list[i].invnumber;
        Cells[4,i+1] := ScanCountersList.list[i].serialnumber;
        Cells[5,i+1] := InttoStr(ScanCountersList.list[i].codePodr);
        if ScanCountersList.list[i].dt_vypusk<>nil then
        Cells[6,i+1] := XSDate2String(ScanCountersList.list[i].dt_vypusk)
        else Cells[6,i+1]:='';


        Cells[7,i+1] := ScanCountersList.list[i].sum_st_nds.DecimalString;
        Cells[8,i+1] := ScanCountersList.list[i].kod_subsch_b;
        Cells[9,i+1] := ScanCountersList.list[i].mol;
        Cells[10,i+1] := ScanCountersList.list[i].mol_name;


        LastRow:=i+1;
        sgScanCounters.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgScanCounters.Row:=1;
  end;
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.sgScanCountersTopLeftChanged(Sender: TObject);
var
  TempScanCounters: ScanCountersControllerSoapPort;
  i,CurrentRow: Integer;
  ScanCountersList: ScanCountersShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgScanCounters.TopRow + sgScanCounters.VisibleRowCount) = ColCount
  then
    begin
      TempScanCounters :=  HTTPRIOScanCounters as ScanCountersControllerSoapPort;
      CurrentRow:=sgScanCounters.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ScanCountersFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ScanCountersList := TempScanCounters.getScrollableFilteredListNetForEnWorkOrderBytItem
  (ScanCountersFilter(FilterObject),
  ColCount-1,
  100,
  workorderbytitemcode);


  sgScanCounters.RowCount:=sgScanCounters.RowCount+100;
  LastCount:=High(ScanCountersList.list);
  with sgScanCounters do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        
        Cells[0,i+CurrentRow] := IntToStr(ScanCountersList.list[i].num_un);
        Cells[1,i+CurrentRow] := ScanCountersList.list[i].name;
        Cells[2,i+CurrentRow] := ScanCountersList.list[i].type_counter;
        Cells[3,i+CurrentRow] := ScanCountersList.list[i].invnumber;
        Cells[4,i+CurrentRow] := ScanCountersList.list[i].serialnumber;
        Cells[5,i+CurrentRow] := InttoStr(ScanCountersList.list[i].codePodr);
        if ScanCountersList.list[i].dt_vypusk<>nil then
        Cells[6,i+CurrentRow] := XSDate2String(ScanCountersList.list[i].dt_vypusk)
        else Cells[6,i+CurrentRow]:='';


        Cells[7,i+CurrentRow] := ScanCountersList.list[i].sum_st_nds.DecimalString;
        Cells[8,i+CurrentRow] := ScanCountersList.list[i].kod_subsch_b;
        Cells[9,i+CurrentRow] := ScanCountersList.list[i].mol;
        Cells[10,i+CurrentRow] := ScanCountersList.list[i].mol_name;



        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgScanCounters.Row:=CurrentRow-5;
   sgScanCounters.RowCount:=LastRow+1;
  end;
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.sgScanCountersDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgScanCounters,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgScanCounters.RowCount-1 do
   for j:=0 to sgScanCounters.ColCount-1 do
     sgScanCounters.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.actViewExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
begin
{ TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
   try
     ScanCountersObj := TempScanCounters.getObject(StrToInt(sgScanCounters.Cells[0,sgScanCounters.Row]));
   except
   on EConvertError do Exit;
  end;
  frmScanCountersEdit:=TfrmScanCountersEdit.Create(Application, dsView);
  try
    frmScanCountersEdit.ShowModal;
  finally
    frmScanCountersEdit.Free;
    frmScanCountersEdit:=nil;
  end;  }
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.actEditExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
begin
 {TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
   try
     ScanCountersObj := TempScanCounters.getObject(StrToInt(sgScanCounters.Cells[0,sgScanCounters.Row]));
   except
   on EConvertError do Exit;
  end;
  frmScanCountersEdit:=TfrmScanCountersEdit.Create(Application, dsEdit);
  try
    if frmScanCountersEdit.ShowModal= mrOk then
      begin
        //TempScanCounters.save(ScanCountersObj);
        UpdateGrid(Sender);
      end;
  finally
    frmScanCountersEdit.Free;
    frmScanCountersEdit:=nil;
  end;    }
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.actDeleteExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
  ObjCode: Integer;
begin
 TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
   try
     ObjCode := StrToInt(sgScanCounters.Cells[0,sgScanCounters.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Счетчик) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempScanCounters.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.actInsertExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
begin
 { TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
  ScanCountersObj:=ScanCounters.Create;



  try
    frmScanCountersEdit:=TfrmScanCountersEdit.Create(Application, dsInsert);
    try
      if frmScanCountersEdit.ShowModal = mrOk then
      begin
        if ScanCountersObj<>nil then
            //TempScanCounters.add(ScanCountersObj);
            UpdateGrid(Sender);
      end;
    finally
      frmScanCountersEdit.Free;
      frmScanCountersEdit:=nil;
    end;
  finally
    ScanCountersObj.Free;
  end;  }
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmScanCountersShowForEnWorkOrderBytItem.actFilterExecute(Sender: TObject);
begin
{
  frmScanCountersFilterEditForEnWorkOrderBytItem:=TfrmScanCountersFilterEditForEnWorkOrderBytItem.Create(Application, dsInsert);
  try
      frmScanCountersFilterEditForEnWorkOrderBytItem.chkCounterWithoutAccountPoint.Checked := true;
    if frmScanCountersFilterEditForEnWorkOrderBytItem.ShowModal = mrOk then
    begin
      isFiltered := True;
      actUpdateExecute(Sender);
    end;
  finally
    frmScanCountersFilterEditForEnWorkOrderBytItem.Free;
    frmScanCountersFilterEditForEnWorkOrderBytItem:=nil;
  end;
}
  frmScanCountersFilterEditForEnWorkOrderBytItem := TfrmScanCountersFilterEditForEnWorkOrderBytItem.Create(Application, dsInsert);
  try
    frmScanCountersFilterEditForEnWorkOrderBytItem.chkCounterWithoutAccountPoint.Checked := true;

    ScanCountersFilterObj := ScanCountersFilter.Create;
    SetNullIntProps(ScanCountersFilterObj);
    SetNullXSProps(ScanCountersFilterObj);

    if frmScanCountersFilterEditForEnWorkOrderBytItem.ShowModal = mrOk then
    begin
      FilterObject := ScanCountersFilterObj;
      isFiltered := True;
      actUpdateExecute(Sender);
    end;
  finally
    frmScanCountersFilterEditForEnWorkOrderBytItem.Free;
    frmScanCountersFilterEditForEnWorkOrderBytItem := nil;
  end;
end;

procedure TfrmScanCountersShowForEnWorkOrderBytItem.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;


procedure TfrmScanCountersShowForEnWorkOrderBytItem.actSelectExecute(Sender: TObject);
Var temp: String;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=GetReturnValue(sgScanCounters,2);
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

end.
