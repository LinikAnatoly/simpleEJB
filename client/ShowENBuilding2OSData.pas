
unit ShowENBuilding2OSData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBuilding2OSDataController ;


type
    TfrmENBuilding2OSDataShow = class(TChildForm)  
    HTTPRIOENBuilding2OSData: THTTPRIO;
    ImageList1: TImageList;
    sgENBuilding2OSData: TAdvStringGrid;
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
    procedure sgENBuilding2OSDataTopLeftChanged(Sender: TObject);
    procedure sgENBuilding2OSDataDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


var
  frmENBuilding2OSDataShow: TfrmENBuilding2OSDataShow;
  
  
implementation

uses Main, EditENBuilding2OSData, EditENBuilding2OSDataFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuilding2OSDataHeaders: array [1..22] of String =
        ( 'Код'
          ,'Ідентифікатор ОЗ'
          ,'ПК таблиці доввода'
          ,'Дата довода'
          ,'Інвентарний номер'
          ,'Код джерела приходу з ОЗ'
          ,'Найменування джерела приходу з ОЗ'
          ,'сума доввода налогового обліку'
          ,'сума доввода бухгалтерського обліку'
          ,'ПДВ доввода у бухгалтерському обліку'
          ,'Сума довода з ПДВ у бухгалтерському обліку'
          ,'Сума довода з ПДВ у налоговому обліку'
          ,'Сума довода з ПДВ у бухгалтерському обліку'
          ,'Найменування довводу'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
          ,'Номер акта Нове будівництво Значение по умолчанию : “№ акта из EnergyNet”'
          ,'Дата акта Нове будівництво по умолчанию : “дата акта из EnergyNet” '
          ,'Номер налоговой накладной'
          ,'Поставщик оказанной услуги.'
          ,'Договор с поставщиком оказанной услуги.'
          ,'Бухгалтерська дата проведення ОЗ-2'
        );
   

procedure TfrmENBuilding2OSDataShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBuilding2OSDataShow:=nil;
  inherited;
end;


procedure TfrmENBuilding2OSDataShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBuilding2OSDataShow.FormShow(Sender: TObject);
var
  TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
  i: Integer;
  ENBuilding2OSDataList: ENBuilding2OSDataShortList;
begin
  SetGridHeaders(ENBuilding2OSDataHeaders, sgENBuilding2OSData.ColumnHeaders);
  ColCount:=100;
  TempENBuilding2OSData :=  HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilding2OSDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilding2OSDataList := TempENBuilding2OSData.getScrollableFilteredList(ENBuilding2OSDataFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBuilding2OSDataList.list);

  if LastCount > -1 then
     sgENBuilding2OSData.RowCount:=LastCount+2
  else
     sgENBuilding2OSData.RowCount:=2;

   with sgENBuilding2OSData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2OSDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilding2OSDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENBuilding2OSDataList.list[i].num_un = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENBuilding2OSDataList.list[i].num_un);
        if ENBuilding2OSDataList.list[i].num_dovvod = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENBuilding2OSDataList.list[i].num_dovvod);
        if ENBuilding2OSDataList.list[i].date_dovvod = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENBuilding2OSDataList.list[i].date_dovvod);
        Cells[4,i+1] := ENBuilding2OSDataList.list[i].kod_inv;
        Cells[5,i+1] := ENBuilding2OSDataList.list[i].kod_ist;
        Cells[6,i+1] := ENBuilding2OSDataList.list[i].name_ist;
        if ENBuilding2OSDataList.list[i].sum_dovvod_n = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENBuilding2OSDataList.list[i].sum_dovvod_n.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_b = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENBuilding2OSDataList.list[i].sum_dovvod_b.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_nds = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENBuilding2OSDataList.list[i].sum_nds.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_nds_b = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENBuilding2OSDataList.list[i].sum_dovvod_nds_b.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_izn_n = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENBuilding2OSDataList.list[i].sum_dovvod_izn_n.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_izn_b = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENBuilding2OSDataList.list[i].sum_dovvod_izn_b.DecimalString;
        Cells[13,i+1] := ENBuilding2OSDataList.list[i].name_dovvod;
        Cells[14,i+1] := ENBuilding2OSDataList.list[i].userGen;
        if ENBuilding2OSDataList.list[i].dateEdit = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDateTimeWithDate2String(ENBuilding2OSDataList.list[i].dateEdit);
        Cells[16,i+1] := ENBuilding2OSDataList.list[i].kod_nakl;
        if ENBuilding2OSDataList.list[i].dt_nakl = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := XSDateTimeWithDate2String(ENBuilding2OSDataList.list[i].dt_nakl);
        Cells[18,i+1] := ENBuilding2OSDataList.list[i].kod_nal_nakl;
        Cells[19,i+1] := ENBuilding2OSDataList.list[i].kod_postav;
        Cells[20,i+1] := ENBuilding2OSDataList.list[i].kod_dogovor;
        if ENBuilding2OSDataList.list[i].dateBuh = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDateTimeWithDate2String(ENBuilding2OSDataList.list[i].dateBuh);
        LastRow:=i+1;
        sgENBuilding2OSData.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBuilding2OSData.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBuilding2OSData.RowCount > selectedRow then
      sgENBuilding2OSData.Row := selectedRow
    else
      sgENBuilding2OSData.Row := sgENBuilding2OSData.RowCount - 1;
    end
    else
      sgENBuilding2OSData.Row:=1;   
end;


procedure TfrmENBuilding2OSDataShow.sgENBuilding2OSDataTopLeftChanged(Sender: TObject);
var
  TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuilding2OSDataList: ENBuilding2OSDataShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuilding2OSData.TopRow + sgENBuilding2OSData.VisibleRowCount) = ColCount
  then
    begin
      TempENBuilding2OSData :=  HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;
      CurrentRow:=sgENBuilding2OSData.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilding2OSDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilding2OSDataList := TempENBuilding2OSData.getScrollableFilteredList(ENBuilding2OSDataFilter(FilterObject),ColCount-1, 100);


  sgENBuilding2OSData.RowCount:=sgENBuilding2OSData.RowCount+100;
  LastCount:=High(ENBuilding2OSDataList.list);
  with sgENBuilding2OSData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2OSDataList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuilding2OSDataList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENBuilding2OSDataList.list[i].num_un = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENBuilding2OSDataList.list[i].num_un);
        if ENBuilding2OSDataList.list[i].num_dovvod = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENBuilding2OSDataList.list[i].num_dovvod);
        if ENBuilding2OSDataList.list[i].date_dovvod = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENBuilding2OSDataList.list[i].date_dovvod);
        Cells[4,i+CurrentRow] := ENBuilding2OSDataList.list[i].kod_inv;
        Cells[5,i+CurrentRow] := ENBuilding2OSDataList.list[i].kod_ist;
        Cells[6,i+CurrentRow] := ENBuilding2OSDataList.list[i].name_ist;
        if ENBuilding2OSDataList.list[i].sum_dovvod_n = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENBuilding2OSDataList.list[i].sum_dovvod_n.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_b = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENBuilding2OSDataList.list[i].sum_dovvod_b.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_nds = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENBuilding2OSDataList.list[i].sum_nds.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_nds_b = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENBuilding2OSDataList.list[i].sum_dovvod_nds_b.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_izn_n = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := ENBuilding2OSDataList.list[i].sum_dovvod_izn_n.DecimalString;
        if ENBuilding2OSDataList.list[i].sum_dovvod_izn_b = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := ENBuilding2OSDataList.list[i].sum_dovvod_izn_b.DecimalString;
        Cells[13,i+CurrentRow] := ENBuilding2OSDataList.list[i].name_dovvod;
        Cells[14,i+CurrentRow] := ENBuilding2OSDataList.list[i].userGen;
        if ENBuilding2OSDataList.list[i].dateEdit = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := XSDateTimeWithDate2String(ENBuilding2OSDataList.list[i].dateEdit);
        Cells[16,i+CurrentRow] := ENBuilding2OSDataList.list[i].kod_nakl;
        if ENBuilding2OSDataList.list[i].dt_nakl = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := XSDateTimeWithDate2String(ENBuilding2OSDataList.list[i].dt_nakl);
        Cells[18,i+CurrentRow] := ENBuilding2OSDataList.list[i].kod_nal_nakl;
        Cells[19,i+CurrentRow] := ENBuilding2OSDataList.list[i].kod_postav;
        Cells[20,i+CurrentRow] := ENBuilding2OSDataList.list[i].kod_dogovor;
        if ENBuilding2OSDataList.list[i].dateBuh = nil then
          Cells[21,i+CurrentRow] := ''
        else
          Cells[21,i+CurrentRow] := XSDateTimeWithDate2String(ENBuilding2OSDataList.list[i].dateBuh);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuilding2OSData.Row:=CurrentRow-5;
   sgENBuilding2OSData.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuilding2OSDataShow.sgENBuilding2OSDataDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuilding2OSData,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBuilding2OSDataShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBuilding2OSData.RowCount-1 do
   for j:=0 to sgENBuilding2OSData.ColCount-1 do
     sgENBuilding2OSData.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBuilding2OSDataShow.actViewExecute(Sender: TObject);
var 
  TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
begin
  TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;
  try
    ENBuilding2OSDataObj := TempENBuilding2OSData.getObject(StrToInt(sgENBuilding2OSData.Cells[0,sgENBuilding2OSData.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuilding2OSData.Row;
  frmENBuilding2OSDataEdit:=TfrmENBuilding2OSDataEdit.Create(Application, dsView);
  
  try
    frmENBuilding2OSDataEdit.ShowModal;
  finally
    frmENBuilding2OSDataEdit.Free;
    frmENBuilding2OSDataEdit:=nil;
  end;

  if sgENBuilding2OSData.RowCount > selectedRow then
    sgENBuilding2OSData.Row := selectedRow
  else
    sgENBuilding2OSData.Row := sgENBuilding2OSData.RowCount - 1;
  
end;


procedure TfrmENBuilding2OSDataShow.actEditExecute(Sender: TObject);
var 
  TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
begin
  TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;
  try
    ENBuilding2OSDataObj := TempENBuilding2OSData.getObject(StrToInt(sgENBuilding2OSData.Cells[0,sgENBuilding2OSData.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuilding2OSData.Row;
  frmENBuilding2OSDataEdit:=TfrmENBuilding2OSDataEdit.Create(Application, dsEdit);
  
  try
    if frmENBuilding2OSDataEdit.ShowModal= mrOk then
      begin
        //TempENBuilding2OSData.save(ENBuilding2OSDataObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuilding2OSDataEdit.Free;
    frmENBuilding2OSDataEdit:=nil;
  end;

  if sgENBuilding2OSData.RowCount > selectedRow then
    sgENBuilding2OSData.Row := selectedRow
  else
    sgENBuilding2OSData.Row := sgENBuilding2OSData.RowCount - 1;
  
end;


procedure TfrmENBuilding2OSDataShow.actDeleteExecute(Sender: TObject);
Var TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilding2OSData.Cells[0,sgENBuilding2OSData.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Связь документов Нове будівництво с бухгалтерскими данными)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilding2OSData.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuilding2OSDataShow.actInsertExecute(Sender: TObject);
// Var TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort; 
begin
  // TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBuilding2OSDataObj:=ENBuilding2OSData.Create;
  SetNullIntProps(ENBuilding2OSDataObj);
  SetNullXSProps(ENBuilding2OSDataObj);

   //ENBuilding2OSDataObj.date_dovvod:= TXSDate.Create;
   //ENBuilding2OSDataObj.sum_dovvod_n:= TXSDecimal.Create;
   //ENBuilding2OSDataObj.sum_dovvod_b:= TXSDecimal.Create;
   //ENBuilding2OSDataObj.sum_nds:= TXSDecimal.Create;
   //ENBuilding2OSDataObj.sum_dovvod_nds_b:= TXSDecimal.Create;
   //ENBuilding2OSDataObj.sum_dovvod_izn_n:= TXSDecimal.Create;
   //ENBuilding2OSDataObj.sum_dovvod_izn_b:= TXSDecimal.Create;
   //ENBuilding2OSDataObj.dateEdit:= TXSDateTime.Create;
   
   //ENBuilding2OSDataObj.dt_nakl:= TXSDateTime.Create;
   
   //ENBuilding2OSDataObj.dateBuh:= TXSDateTime.Create;
   


  try
    frmENBuilding2OSDataEdit:=TfrmENBuilding2OSDataEdit.Create(Application, dsInsert);
    try
      if frmENBuilding2OSDataEdit.ShowModal = mrOk then
      begin
        if ENBuilding2OSDataObj<>nil then
            //TempENBuilding2OSData.add(ENBuilding2OSDataObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuilding2OSDataEdit.Free;
      frmENBuilding2OSDataEdit:=nil;
    end;
  finally
    ENBuilding2OSDataObj.Free;
  end;
end;


procedure TfrmENBuilding2OSDataShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBuilding2OSDataShow.actFilterExecute(Sender: TObject);
begin
{frmENBuilding2OSDataFilterEdit:=TfrmENBuilding2OSDataFilterEdit.Create(Application, dsInsert);
  try
    ENBuilding2OSDataFilterObj := ENBuilding2OSDataFilter.Create;
    SetNullIntProps(ENBuilding2OSDataFilterObj);
    SetNullXSProps(ENBuilding2OSDataFilterObj);

    if frmENBuilding2OSDataFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBuilding2OSDataFilter.Create;
      FilterObject := ENBuilding2OSDataFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuilding2OSDataFilterEdit.Free;
    frmENBuilding2OSDataFilterEdit:=nil;
  end;}
end;


procedure TfrmENBuilding2OSDataShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.