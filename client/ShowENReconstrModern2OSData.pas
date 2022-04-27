
unit ShowENReconstrModern2OSData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENReconstrModern2OSDataController ;


type
  TfrmENReconstrModern2OSDataShow = class(TChildForm)  
  HTTPRIOENReconstrModern2OSData: THTTPRIO;
    ImageList1: TImageList;
    sgENReconstrModern2OSData: TAdvStringGrid;
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
procedure sgENReconstrModern2OSDataTopLeftChanged(Sender: TObject);
procedure sgENReconstrModern2OSDataDblClick(Sender: TObject);
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

//var
 // ENReconstrModern2OSDataObj: ENReconstrModern2OSData;
 // ENReconstrModern2OSDataFilterObj: ENReconstrModern2OSDataFilter;
  
  
implementation

uses Main, EditENReconstrModern2OSData, EditENReconstrModern2OSDataFilter,
  ShowENReconstrModern2OSData;


{$R *.dfm}

var
  //frmENReconstrModern2OSDataShow : TfrmENReconstrModern2OSDataShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENReconstrModern2OSDataHeaders: array [1..22] of String =
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
          ,'Номер акта ОЗ-2 Значение по умолчанию : “№ акта ОЗ-2 из EnergyNet”'
          ,'Дата акта ОЗ-2 Значение по умолчанию : “Дата акта ОЗ-2 из EnergyNet ”'
          ,'Номер налоговой накладной'
          ,'Поставщик оказанной услуги.'
          ,'Договор с поставщиком оказанной услуги.'
          ,'Бухгалтерська дата проведення'
        );
   

procedure TfrmENReconstrModern2OSDataShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENReconstrModern2OSDataShow:=nil;
    inherited;
  end;


procedure TfrmENReconstrModern2OSDataShow.FormShow(Sender: TObject);
var
  TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
  i: Integer;
  ENReconstrModern2OSDataList: ENReconstrModern2OSDataShortList;
  begin
  SetGridHeaders(ENReconstrModern2OSDataHeaders, sgENReconstrModern2OSData.ColumnHeaders);
  ColCount:=100;
  TempENReconstrModern2OSData :=  HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModern2OSDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModern2OSDataList := TempENReconstrModern2OSData.getScrollableFilteredList(ENReconstrModern2OSDataFilter(FilterObject),0,ColCount);


  LastCount:=High(ENReconstrModern2OSDataList.list);

  if LastCount > -1 then
     sgENReconstrModern2OSData.RowCount:=LastCount+2
  else
     sgENReconstrModern2OSData.RowCount:=2;

   with sgENReconstrModern2OSData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReconstrModern2OSDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENReconstrModern2OSDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENReconstrModern2OSDataList.list[i].num_un = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENReconstrModern2OSDataList.list[i].num_un);
        if ENReconstrModern2OSDataList.list[i].num_dovvod = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENReconstrModern2OSDataList.list[i].num_dovvod);
        if ENReconstrModern2OSDataList.list[i].date_dovvod = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENReconstrModern2OSDataList.list[i].date_dovvod);
        Cells[4,i+1] := ENReconstrModern2OSDataList.list[i].kod_inv;
        Cells[5,i+1] := ENReconstrModern2OSDataList.list[i].kod_ist;
        Cells[6,i+1] := ENReconstrModern2OSDataList.list[i].name_ist;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_n = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENReconstrModern2OSDataList.list[i].sum_dovvod_n.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_b = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENReconstrModern2OSDataList.list[i].sum_dovvod_b.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_nds = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENReconstrModern2OSDataList.list[i].sum_nds.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_nds_b = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENReconstrModern2OSDataList.list[i].sum_dovvod_nds_b.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_n = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_n.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_b = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_b.DecimalString;
        Cells[13,i+1] := ENReconstrModern2OSDataList.list[i].name_dovvod;
        Cells[14,i+1] := ENReconstrModern2OSDataList.list[i].userGen;
        if ENReconstrModern2OSDataList.list[i].dateEdit = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDateTimeWithDate2String(ENReconstrModern2OSDataList.list[i].dateEdit);
        Cells[16,i+1] := ENReconstrModern2OSDataList.list[i].kod_nakl;
        if ENReconstrModern2OSDataList.list[i].dt_nakl = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := XSDateTimeWithDate2String(ENReconstrModern2OSDataList.list[i].dt_nakl);
        Cells[18,i+1] := ENReconstrModern2OSDataList.list[i].kod_nal_nakl;
        Cells[19,i+1] := ENReconstrModern2OSDataList.list[i].kod_postav;
        Cells[20,i+1] := ENReconstrModern2OSDataList.list[i].kod_dogovor;
        if ENReconstrModern2OSDataList.list[i].dateBuh = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDateTimeWithDate2String(ENReconstrModern2OSDataList.list[i].dateBuh);
        LastRow:=i+1;
        sgENReconstrModern2OSData.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENReconstrModern2OSData.Row:=1;
end;

procedure TfrmENReconstrModern2OSDataShow.sgENReconstrModern2OSDataTopLeftChanged(Sender: TObject);
var
  TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
  i,CurrentRow: Integer;
  ENReconstrModern2OSDataList: ENReconstrModern2OSDataShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENReconstrModern2OSData.TopRow + sgENReconstrModern2OSData.VisibleRowCount) = ColCount
  then
    begin
      TempENReconstrModern2OSData :=  HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;
      CurrentRow:=sgENReconstrModern2OSData.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModern2OSDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModern2OSDataList := TempENReconstrModern2OSData.getScrollableFilteredList(ENReconstrModern2OSDataFilter(FilterObject),ColCount-1, 100);



  sgENReconstrModern2OSData.RowCount:=sgENReconstrModern2OSData.RowCount+100;
  LastCount:=High(ENReconstrModern2OSDataList.list);
  with sgENReconstrModern2OSData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReconstrModern2OSDataList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENReconstrModern2OSDataList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENReconstrModern2OSDataList.list[i].num_un = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENReconstrModern2OSDataList.list[i].num_un);
        if ENReconstrModern2OSDataList.list[i].num_dovvod = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENReconstrModern2OSDataList.list[i].num_dovvod);
        if ENReconstrModern2OSDataList.list[i].date_dovvod = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENReconstrModern2OSDataList.list[i].date_dovvod);
        Cells[4,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].kod_inv;
        Cells[5,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].kod_ist;
        Cells[6,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].name_ist;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_n = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].sum_dovvod_n.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_b = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].sum_dovvod_b.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_nds = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].sum_nds.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_nds_b = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].sum_dovvod_nds_b.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_n = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_n.DecimalString;
        if ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_b = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].sum_dovvod_izn_b.DecimalString;
        Cells[13,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].name_dovvod;
        Cells[14,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].userGen;
        if ENReconstrModern2OSDataList.list[i].dateEdit = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := XSDateTimeWithDate2String(ENReconstrModern2OSDataList.list[i].dateEdit);		  
        Cells[16,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].kod_nakl;
        if ENReconstrModern2OSDataList.list[i].dt_nakl = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := XSDateTimeWithDate2String(ENReconstrModern2OSDataList.list[i].dt_nakl);		  
        Cells[18,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].kod_nal_nakl;
        Cells[19,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].kod_postav;
        Cells[20,i+CurrentRow] := ENReconstrModern2OSDataList.list[i].kod_dogovor;
        if ENReconstrModern2OSDataList.list[i].dateBuh = nil then
          Cells[21,i+CurrentRow] := ''
        else
          Cells[21,i+CurrentRow] := XSDateTimeWithDate2String(ENReconstrModern2OSDataList.list[i].dateBuh);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENReconstrModern2OSData.Row:=CurrentRow-5;
   sgENReconstrModern2OSData.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENReconstrModern2OSDataShow.sgENReconstrModern2OSDataDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENReconstrModern2OSData,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENReconstrModern2OSDataShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENReconstrModern2OSData.RowCount-1 do
   for j:=0 to sgENReconstrModern2OSData.ColCount-1 do
     sgENReconstrModern2OSData.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENReconstrModern2OSDataShow.actViewExecute(Sender: TObject);
Var TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
begin
 TempENReconstrModern2OSData := HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;
   try
     ENReconstrModern2OSDataObj := TempENReconstrModern2OSData.getObject(StrToInt(sgENReconstrModern2OSData.Cells[0,sgENReconstrModern2OSData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENReconstrModern2OSDataEdit:=TfrmENReconstrModern2OSDataEdit.Create(Application, dsView);
  try
    frmENReconstrModern2OSDataEdit.ShowModal;
  finally
    frmENReconstrModern2OSDataEdit.Free;
    frmENReconstrModern2OSDataEdit:=nil;
  end;
end;

procedure TfrmENReconstrModern2OSDataShow.actEditExecute(Sender: TObject);
Var TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
begin
 TempENReconstrModern2OSData := HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;
   try
     ENReconstrModern2OSDataObj := TempENReconstrModern2OSData.getObject(StrToInt(sgENReconstrModern2OSData.Cells[0,sgENReconstrModern2OSData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENReconstrModern2OSDataEdit:=TfrmENReconstrModern2OSDataEdit.Create(Application, dsEdit);
  try
    if frmENReconstrModern2OSDataEdit.ShowModal= mrOk then
      begin
        //TempENReconstrModern2OSData.save(ENReconstrModern2OSDataObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENReconstrModern2OSDataEdit.Free;
    frmENReconstrModern2OSDataEdit:=nil;
  end;
end;

procedure TfrmENReconstrModern2OSDataShow.actDeleteExecute(Sender: TObject);
Var TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
  ObjCode: Integer;
begin
 TempENReconstrModern2OSData := HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;
   try
     ObjCode := StrToInt(sgENReconstrModern2OSData.Cells[0,sgENReconstrModern2OSData.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связь документов по реконструкции модернизации с бухгалтерскими данными) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENReconstrModern2OSData.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENReconstrModern2OSDataShow.actInsertExecute(Sender: TObject);
// Var TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort; 
begin
  // TempENReconstrModern2OSData := HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENReconstrModern2OSDataObj:=ENReconstrModern2OSData.Create;

   //ENReconstrModern2OSDataObj.date_dovvod:= TXSDate.Create;
   //ENReconstrModern2OSDataObj.sum_dovvod_n:= TXSDecimal.Create;
   //ENReconstrModern2OSDataObj.sum_dovvod_b:= TXSDecimal.Create;
   //ENReconstrModern2OSDataObj.sum_nds:= TXSDecimal.Create;
   //ENReconstrModern2OSDataObj.sum_dovvod_nds_b:= TXSDecimal.Create;
   //ENReconstrModern2OSDataObj.sum_dovvod_izn_n:= TXSDecimal.Create;
   //ENReconstrModern2OSDataObj.sum_dovvod_izn_b:= TXSDecimal.Create;
   //ENReconstrModern2OSDataObj.dateEdit:= TXSDateTime.Create;
   
   //ENReconstrModern2OSDataObj.dt_nakl:= TXSDateTime.Create;
   
   //ENReconstrModern2OSDataObj.dateBuh:= TXSDateTime.Create;
   


  try
    frmENReconstrModern2OSDataEdit:=TfrmENReconstrModern2OSDataEdit.Create(Application, dsInsert);
    try
      if frmENReconstrModern2OSDataEdit.ShowModal = mrOk then
      begin
        if ENReconstrModern2OSDataObj<>nil then
            //TempENReconstrModern2OSData.add(ENReconstrModern2OSDataObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENReconstrModern2OSDataEdit.Free;
      frmENReconstrModern2OSDataEdit:=nil;
    end;
  finally
    ENReconstrModern2OSDataObj.Free;
  end;
end;

procedure TfrmENReconstrModern2OSDataShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENReconstrModern2OSDataShow.actFilterExecute(Sender: TObject);
begin
{frmENReconstrModern2OSDataFilterEdit:=TfrmENReconstrModern2OSDataFilterEdit.Create(Application, dsInsert);
  try
    ENReconstrModern2OSDataFilterObj := ENReconstrModern2OSDataFilter.Create;
    SetNullIntProps(ENReconstrModern2OSDataFilterObj);
    SetNullXSProps(ENReconstrModern2OSDataFilterObj);

    if frmENReconstrModern2OSDataFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENReconstrModern2OSDataFilter.Create;
      FilterObject := ENReconstrModern2OSDataFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENReconstrModern2OSDataFilterEdit.Free;
    frmENReconstrModern2OSDataFilterEdit:=nil;
  end;}
end;

procedure TfrmENReconstrModern2OSDataShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.