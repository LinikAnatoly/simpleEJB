
unit ShowENServicesCalculation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesObjectController, AdvObj, tmsAdvGridExcel;


type
    TfrmENServicesCalculationShow = class(TChildForm)
    HTTPRIOENServicesObject: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesObject: TAdvStringGrid;
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
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    actBudgetApproved: TAction;
    actUnBudgetApproved: TAction;
    actSigned: TAction;
    actUnSigned: TAction;
    actPaid: TAction;
    actUnPaid: TAction;
    actCanceled: TAction;
    N16: TMenuItem;
    actExpExcel: TAction;
    N17: TMenuItem;
    miActSigned: TMenuItem;
    miActUnSigned: TMenuItem;
    actCountersActSigned: TAction;
    actCountersActUnSigned: TAction;
    actFinishWork: TAction;
    N18: TMenuItem;
    actPrepaid: TAction;
    actUnPrepaid: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    miActDisclaimerCustomerServices: TMenuItem;
    actDisclaimerCustomerServices: TAction;
    actCloseContract: TAction;
    actUnCloseContract: TAction;
    miCloseContract: TMenuItem;
    miUnCloseContract: TMenuItem;
    actUndoFinishWorks: TAction;
    N22: TMenuItem;
    btnServicesRegistryPrint: TToolButton;
    miChangeContractFin: TMenuItem;
    actChangeContractFin: TAction;
    actUpdatePersonalAccount: TAction;
    N23: TMenuItem;
    N24: TMenuItem;
    actUpdateCounterZonesType: TAction;
    N25: TMenuItem;
    aeExcel: TAdvGridExcelIO;
    N26: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENServicesObjectTopLeftChanged(Sender: TObject);
    procedure sgENServicesObjectDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUnBudgetApprovedExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure actPaidExecute(Sender: TObject);
    procedure actUnPaidExecute(Sender: TObject);
    procedure actCanceledExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actExpExcelExecute(Sender: TObject);
    procedure actCountersActSignedExecute(Sender: TObject);
    procedure actCountersActUnSignedExecute(Sender: TObject);
    procedure actFinishWorkExecute(Sender: TObject);
    procedure actPrepaidExecute(Sender: TObject);
    procedure actUnPrepaidExecute(Sender: TObject);
    procedure actDisclaimerCustomerServicesExecute(Sender: TObject);
    procedure actCloseContractExecute(Sender: TObject);
    procedure actUnCloseContractExecute(Sender: TObject);
    procedure actUndoFinishWorksExecute(Sender: TObject);
    procedure btnServicesRegistryPrintClick(Sender: TObject);
    procedure actChangeContractFinExecute(Sender: TObject);
    procedure actUpdatePersonalAccountExecute(Sender: TObject);
    procedure actUpdateCounterZonesTypeExecute(Sender: TObject);
    procedure N26Click(Sender: TObject);

  private
   { Private declarations }
   isFiltered  : boolean;
   priconnections : Boolean;

 public
   { Public declarations }
   substation04Code : Integer;
   notStandartConnection : Boolean;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENServicesCalculationShow : TfrmENServicesCalculationShow;
 // ENServicesObjectObj: ENServicesObject;
 // ENServicesObjectFilterObj: ENServicesObjectFilter;

var servObjCode: Integer;

implementation

uses Main, EditENServicesObject, EditENServicesObjectFilter,
  EditENServicesCalculation, DMReportsUnit, ENConsts,
  ENServicesContractKindController, ENServicesContractTypeController,
  reportServicesRegistryPrint, ShowFINServicesObject,
  EditPersonalAccountForServicesObject, EditENServicesObjectCounterZonesType , Globals ,ShellAPI ,
  EditENServicesContragentType;



{$R *.dfm}

var
  //frmENServicesCalculObjectShow : TfrmENServicesCalculObjectShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesCalculationHeaders: array [1..19] of String =
        ( 'Код'
          ,'Порядковий № дог.'
          ,'Дата дог.(порядковий)'
          ,'№ дог. фін.кол.'
          ,'Дата дог. фін.кол.'
          ,'Замовник'
          ,'Код замовника'
          ,'Тип замовника'
          ,'Підрозділ'
          ,'Тип договору'
          ,'Статус договору'
          ,'Бух. статус'
          ,'Примітка'
					,'Адреса замовника'
					,'Сума оплати (з НДС)'
					,'Сума дохода (з НДС)'
          {,'пользователь внесший изменение'
          ,'дата последнего изменения'}
          ,'Гранична дата виконання робіт'
          ,'Кількість днів затримки(з вини споживача) '
          ,'Макс. термін виконання(дні)'
        );
   

procedure TfrmENServicesCalculationShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormMode = fmChild) then
  begin
    {
    if (FilterObject <> nil) then
    begin
      if (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil)
          and (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION)
      then frmENServicesCalculationShow := nil
      else
        frmENServicesCalculationShow := nil;
    end
    else
    }
      frmENServicesCalculationShow := nil;
  end;

   inherited;
end;


procedure TfrmENServicesCalculationShow.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
begin
  if (FilterObject <> nil) and (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil) and
     (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION) then
  begin
    priconnections := True;
    ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
    DisableActions([actInsert, actDelete]);
  end;

  DisableActions([actNoFilter]);
  SetGridHeaders(ENServicesCalculationHeaders, sgENServicesObject.ColumnHeaders);

  if (priconnections) then
  begin
    sgENServicesObject.ColWidths[9] := 150;
    sgENServicesObject.ColumnHeaders[9] := 'Тип договору / Тип приєднання';
  end;

  ColCount:=100;
  TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     //ENServicesObjectFilter(FilterObject).conditionSQL := 'contractnumberservices is not null';
     ENServicesObjectFilter(FilterObject).conditionSQL := '(contractnumberservices is not null and ' +
                                                          ' coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_CONNECTION) + ')';
     ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';

     ENServicesObjectFilter(FilterObject).contractKindRef := ENServicesContractKindRef.Create;
     ENServicesObjectFilter(FilterObject).contractKindRef.code := SERVICES_CONTRACT_KIND_SERVICES; 

     isFiltered := false;
  end
  else
     isFiltered := true;

  if not isFiltered then
  begin
     actFilterExecute(Sender);
     exit;
  end;

  ENServicesObjectList := TempENServicesObject.getEasyShortList(ENServicesObjectFilter(FilterObject),0,ColCount);
  LastCount:=High(ENServicesObjectList.list);

  if LastCount > -1 then
     sgENServicesObject.RowCount:=LastCount+2
  else
     sgENServicesObject.RowCount:=2;

   with sgENServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumberServices;
        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
          Cells[3,i+1] := ENServicesObjectList.list[i].contractNumber
        else
          Cells[3,i+1] := '';

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);

        {
        /// 21.09.11 Нужно выводить дату нашу, а не с ФК (если нашей нет, тогда с ФК)!
        if ENServicesObjectList.list[i].contractDateServices = nil then
        begin
          if ENServicesObjectList.list[i].contractDate = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        end
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);
        ///
        }

        Cells[5,i+1] := ENServicesObjectList.list[i].contragentname;
        Cells[6,i+1] := ENServicesObjectList.list[i].contragentokpo;

        // тип заказчика
        Cells[7,i+1] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[8,i+1] := ENServicesObjectList.list[i].departmentShortName;
        // Тип договора
        Cells[9,i+1] := ENServicesObjectList.list[i].contractTypeRefName;
        // Статус договора
        Cells[10,i+1] := ENServicesObjectList.list[i].contractStatusRefName;

        // Бух. статус
        Cells[11,i+1] := ENServicesObjectList.list[i].statusRefName;

        Cells[12,i+1] := ENServicesObjectList.list[i].commentGen;

				Cells[13,i+1] := ENServicesObjectList.list[i].contragentAddress;

				if ENServicesObjectList.list[i].paySum = nil then
					Cells[14,i+1] := ''
				else
					Cells[14,i+1] := ENServicesObjectList.list[i].paySum.DecimalString;

				if ENServicesObjectList.list[i].dohodSum = nil then
					Cells[15,i+1] := ''
				else
				 begin
          // для безоплатных тоже не показываем
					// если черновой, отмененный,  расторгнут , отказан от услуг -
          // то не показываем сумму дохода по договору
					if  ((ENServicesObjectList.list[i].contractStatusRefCode in [ENSERVICESOBJECTSTATUS_DRAFT , ENSERVICESOBJECTSTATUS_CANCELED , ENSERVICESOBJECTSTATUS_TERMINATED , ENSERVICESOBJECTSTATUS_DISCLAIMER])
               or (ENServicesObjectList.list[i].isNoPay = ENConsts.ENSERVICESOBJECT_ISNOPAY )) then
					 Cells[15,i+1] := ''
					 else
					 Cells[15,i+1] := ENServicesObjectList.list[i].dohodSum.DecimalString;
				  end;

        if ENServicesObjectList.list[i].boundaryDateWork = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := XSDate2String(ENServicesObjectList.list[i].boundaryDateWork);

        if ENServicesObjectList.list[i].countdaydelay <> Low(Integer) then
        Cells[17,i+1] := IntToStr(ENServicesObjectList.list[i].countdaydelay)
        else
        Cells[17,i+1] := '';

        if ENServicesObjectList.list[i].term <> Low(Integer) then
        begin
           if ( (ENServicesObjectList.list[i].regulation = Low(Integer) )
              or
                (ENServicesObjectList.list[i].regulation = 0 ) )  then
           Cells[18,i+1] := IntToStr(ENServicesObjectList.list[i].term) + ' (робоч.)'
           else
           Cells[18,i+1] := IntToStr(ENServicesObjectList.list[i].term) + ' (календ.)'

        end
        else
        Cells[18,i+1] := '';


           if ENServicesObjectList.list[i].isRed > 0 then
              RowColor[i+1] := clRed
           else
           // поговорили с Юрковским пока красить в желтый не будем
//           if ENServicesObjectList.list[i].isYellow > 0 then
//              RowColor[i+1] := clYellow
//           else
              RowColor[i+1] := clWindow;
           if ENServicesObjectList.list[i].contractStatusRefCode =
                ENConsts.ENSERVICESOBJECTSTATUS_TERMINATED then
              RowColor[i+1] := clSilver;






        LastRow:=i+1;
        sgENServicesObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesObject.Row:=1;
end;


procedure TfrmENServicesCalculationShow.N26Click(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  objCode: Integer;
  servicesObject: ENServicesObject;
begin
  inherited;

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  frmENServicesContragentTypeEdit := TfrmENServicesContragentTypeEdit.Create(Application, dsInsert);
  try
    if frmENServicesContragentTypeEdit.ShowModal = mrOk then
    begin
      if (frmENServicesContragentTypeEdit.cbContragentType.ItemIndex <> -1) then
      begin

      if servicesObject.personalAccountCode <> LOW_INT then
      begin
       Application.MessageBox(PChar('Вже обрано особовий рахунок!'), PChar('Увага!'), MB_ICONWARNING);
       Exit;
      end;

        if (frmENServicesContragentTypeEdit.cbContragentType.ItemIndex = 0) then
          servicesObject.contragentTypeRef.code := ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL
        else
          servicesObject.contragentTypeRef.code := ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET;

        TempENServicesObject.save(servicesObject);
      end;

      UpdateGrid(Sender);
    end;
  finally
    frmENServicesContragentTypeEdit.Free;
  end;
end;

procedure TfrmENServicesCalculationShow.sgENServicesObjectTopLeftChanged(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENServicesObject.TopRow + sgENServicesObject.VisibleRowCount) = ColCount
  then
  begin
    TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    CurrentRow:=sgENServicesObject.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := ENServicesObjectFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
       ENServicesObjectFilter(FilterObject).conditionSQL := 'contractnumberservices is not null';
       ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
    end;

    ENServicesObjectList := TempENServicesObject.getEasyShortList(ENServicesObjectFilter(FilterObject),ColCount-1, 100);
    sgENServicesObject.RowCount:=sgENServicesObject.RowCount+100;

    LastCount:=High(ENServicesObjectList.list);
    with sgENServicesObject do
    for i:=0 to LastCount do
    begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENServicesObjectList.list[i].contractNumberServices;

        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

          
        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
          Cells[3,i+CurrentRow] := ENServicesObjectList.list[i].contractNumber
        else
          Cells[3,i+CurrentRow] := '';

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);

        {
        /// 21.09.11 Нужно выводить дату нашу, а не с ФК (если нашей нет, тогда с ФК)!
        if ENServicesObjectList.list[i].contractDateServices = nil then
        begin
          if ENServicesObjectList.list[i].contractDate = nil then
            Cells[2,i+CurrentRow] := ''
          else
            Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        end
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);
        ///
        }

        Cells[5,i+CurrentRow] := ENServicesObjectList.list[i].contragentname;
        Cells[6,i+CurrentRow] := ENServicesObjectList.list[i].contragentokpo;
        // тип заказчика
        Cells[7,i+CurrentRow] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[8,i+CurrentRow] := ENServicesObjectList.list[i].departmentShortName;
        // Тип договора
        Cells[9,i+CurrentRow] := ENServicesObjectList.list[i].contractTypeRefName;
        // Статус договора
        Cells[10,i+CurrentRow] := ENServicesObjectList.list[i].contractStatusRefName;

        // Бух. статус
        Cells[11,i+CurrentRow] := ENServicesObjectList.list[i].statusRefName;

        Cells[12,i+CurrentRow] := ENServicesObjectList.list[i].commentGen;

				Cells[13,i+CurrentRow] := ENServicesObjectList.list[i].contragentAddress;

				if ENServicesObjectList.list[i].paySum = nil then
					Cells[14,i+CurrentRow] := ''
				else
					Cells[14,i+CurrentRow] := ENServicesObjectList.list[i].paySum.DecimalString;


				if ENServicesObjectList.list[i].dohodSum = nil then
					Cells[15,i+CurrentRow] := ''
				else
				 begin
          // для безоплатных тоже не показываем
					// если черновой, отмененный,  расторгнут , отказан от услуг -
          // то не показываем сумму дохода по договору
         	if  ((ENServicesObjectList.list[i].contractStatusRefCode in [ENSERVICESOBJECTSTATUS_DRAFT , ENSERVICESOBJECTSTATUS_CANCELED , ENSERVICESOBJECTSTATUS_TERMINATED , ENSERVICESOBJECTSTATUS_DISCLAIMER])
               or (ENServicesObjectList.list[i].isNoPay = ENConsts.ENSERVICESOBJECT_ISNOPAY )) then
					 Cells[15,i+CurrentRow] := ''
					 else
					 Cells[15,i+CurrentRow] := ENServicesObjectList.list[i].dohodSum.DecimalString;
				  end;


        if ENServicesObjectList.list[i].boundaryDateWork = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].boundaryDateWork);

        if ENServicesObjectList.list[i].countdaydelay <> Low(Integer) then
         Cells[17,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].countdaydelay)
        else
         Cells[17,i+CurrentRow] := '';

          if ENServicesObjectList.list[i].term <> Low(Integer) then
        begin
           if ( (ENServicesObjectList.list[i].regulation = Low(Integer) )
              or
                (ENServicesObjectList.list[i].regulation = 0 ) )  then
           Cells[18,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].term) + ' (робоч.)'
           else
           Cells[18,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].term) + ' (календ.)'

        end
        else
        Cells[18,i+1] := '';

           if ENServicesObjectList.list[i].isRed > 0 then
              RowColor[i+CurrentRow] := clRed
           else
           // поговорили с Юрковским пока красить в желтый не будем
//           if ENServicesObjectList.list[i].isYellow > 0 then
//              RowColor[i+CurrentRow] := clYellow
//           else
              RowColor[i+CurrentRow] := clWindow;
           if ENServicesObjectList.list[i].contractStatusRefCode =
                ENConsts.ENSERVICESOBJECTSTATUS_TERMINATED then
              RowColor[i+CurrentRow] := clSilver;

        LastRow:=i+CurrentRow;
    end; 
   ColCount:=ColCount+100;
   sgENServicesObject.Row:=CurrentRow-5;
   sgENServicesObject.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENServicesCalculationShow.sgENServicesObjectDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      servObjCode := StrToInt(GetReturnValue(sgENServicesObject, 0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesObject.RowCount-1 do
   for j:=0 to sgENServicesObject.ColCount-1 do
     sgENServicesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesCalculationShow.actViewExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
 TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ENServicesObjectObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
   except
   on EConvertError do Exit;
  end;

  frmENServicesCalculationEdit := TfrmENServicesCalculationEdit.Create(Application, dsView);
  if (priconnections)
    then frmENServicesCalculationEdit.priconnections := True;

  frmENServicesCalculationEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
  try
    frmENServicesCalculationEdit.ShowModal;
  finally
    frmENServicesCalculationEdit.Free;
    frmENServicesCalculationEdit:=nil;
  end;
end;

procedure TfrmENServicesCalculationShow.btnServicesRegistryPrintClick(
  Sender: TObject);
begin
   frmServicesRegistryPrint := TfrmServicesRegistryPrint.Create(Application, dsInsert);
 try
   frmServicesRegistryPrint.ShowModal;
 finally
   frmServicesRegistryPrint.Free;
   frmServicesRegistryPrint := nil;
 end;

end;

procedure TfrmENServicesCalculationShow.actEditExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesObjectObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
  except
    on EConvertError do Exit;
  end;

  if ((ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) or
      (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED_BY_BUH)) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) or
     (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Підписаний" або "Сплачений" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CANCELED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Відмінений" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Роботи виконані" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Скасований" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DISCLAIMER) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Відмова замовника від послуг" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CLOSE) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Закритий" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENServicesCalculationEdit:=TfrmENServicesCalculationEdit.Create(Application, dsEdit);
  if (priconnections)
     then frmENServicesCalculationEdit.priconnections := True;

  try
    frmENServicesCalculationEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
    if frmENServicesCalculationEdit.ShowModal= mrOk then
      begin

        UpdateGrid(Sender);
      end;
    //UpdateGrid(Sender);
  finally
    frmENServicesCalculationEdit.Free;
    frmENServicesCalculationEdit:=nil;
  end;
end;


procedure TfrmENServicesCalculationShow.actDeleteExecute(Sender: TObject);
var
  TempENServicesCalculation: ENServicesObjectControllerSoapPort;
  ObjCode: Integer;
  checkServicesConsumer : Boolean;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  ENServicesObjectObj := TempENServicesCalculation.getObject(ObjCode);

  if (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, видаляти не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Підписаний" або "Сплачений" видаляти не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  // проверка договора на связь с Заявлением потребителя в DocFlow...
  checkServicesConsumer := DMReports.checkServicesConsumer(ObjCode);

  if (checkServicesConsumer) and (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECTSTATUS_CANCELED) then
  begin
    Application.MessageBox(PChar('Договор вже відмінено при виконанні послуг по Заяві споживача!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (checkServicesConsumer)
      and (Application.MessageBox(PChar('Договір створено при реєстрації Заяви побутового споживача! Виконання послуги буде припинено! Ви дійсно бажаєте видалити Договір про послуги на сторону?'),
      PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK) then
  begin
    TempENServicesCalculation.remove(ObjCode);
    UpdateGrid(Sender);
  end else

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Об''єкти - послуги на сторону) ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesCalculation.remove(ObjCode);
    UpdateGrid(Sender);
  end;

end;


procedure TfrmENServicesCalculationShow.actInsertExecute(Sender: TObject);
begin
  ENServicesObjectObj := ENServicesObject.Create;
  SetNullIntProps(ENServicesObjectObj);
  SetNullXSProps(ENServicesObjectObj);

  // ENServicesObjectObj.contractDate:= TXSDate.Create;
  // ENServicesObjectObj.dateEdit:= TXSDate.Create;

  try
    frmENServicesCalculationEdit := TfrmENServicesCalculationEdit.Create(Application, dsInsert);
    if (priconnections)
      then frmENServicesCalculationEdit.priconnections := True;

    try
      if frmENServicesCalculationEdit.ShowModal = mrOk then
      begin
        if ENServicesObjectObj<>nil then
        begin
            //TempENServicesObject.add(ENServicesObjectObj);
            UpdateGrid(Sender);
        end;
      end;
    finally
      frmENServicesCalculationEdit.Free;
      frmENServicesCalculationEdit:=nil;
    end;
  finally
    ENServicesObjectObj.Free;
  end;
end;


procedure TfrmENServicesCalculationShow.actUpdateCounterZonesTypeExecute(
  Sender: TObject);
  var
  servicesObject : ENServicesObject;
  ObjCode : Integer;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  frmEditENServicesObjectCounterZonesType : TfrmEditENServicesObjectCounterZonesType;
begin
  inherited;
  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort; 
  servicesObject := TempENServicesObject.getObject(ObjCode);
  frmEditENServicesObjectCounterZonesType := TfrmEditENServicesObjectCounterZonesType.Create(Application, dsEdit);
  frmEditENServicesObjectCounterZonesType.servicesObject := servicesObject;
  if frmEditENServicesObjectCounterZonesType.ShowModal = mrOk then begin
    actUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesCalculationShow.actUpdatePersonalAccountExecute(
  Sender: TObject);
var
  ObjCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  frmPersonalAccountForServicesObjectEdit := TfrmPersonalAccountForServicesObjectEdit.Create(Application, dsInsert);
  try
    frmPersonalAccountForServicesObjectEdit.servicesObjectCode := ObjCode;
    frmPersonalAccountForServicesObjectEdit.ShowModal;
  finally
    frmPersonalAccountForServicesObjectEdit.Free;
    frmPersonalAccountForServicesObjectEdit := nil;
  end;
end;

procedure TfrmENServicesCalculationShow.actFilterExecute(Sender: TObject);
var
    contractKindCode{, contractTypeCode }: Integer;
    conditionSQL : String;
begin
  contractKindCode := -1;
  //contractTypeCode := -1;
  
  frmENServicesObjectFilterEdit := TfrmENServicesObjectFilterEdit.Create(Application, dsInsert);
  try
    frmENServicesObjectFilterEdit.priconnections := priconnections;

    ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
    SetNullIntProps(ENServicesObjectFilterObj);
    SetNullXSProps(ENServicesObjectFilterObj);

    if FilterObject <> nil then
    begin
      if ENServicesObjectFilter(FilterObject).contractKindRef <> nil then
         contractKindCode := ENServicesObjectFilter(FilterObject).contractKindRef.code;

      //if ENServicesObjectFilter(FilterObject).contractTypeRef <> nil then
      //   contractTypeCode := ENServicesObjectFilter(FilterObject).contractTypeRef.code;
    end;

    if frmENServicesObjectFilterEdit.ShowModal = mrOk then
    begin
      {
      if (contractTypeCode <> -1) then
      begin
        ENServicesObjectFilterObj.contractTypeRef := ENServicesContractTypeRef.Create;
        ENServicesObjectFilterObj.contractTypeRef.code := contractTypeCode;
      end;
      }

      if priconnections then
      begin
        ENServicesObjectFilterObj.contractTypeRef := ENServicesContractTypeRef.Create;
        ENServicesObjectFilterObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION;
      end;

      if (contractKindCode <> -1) then
      begin
        ENServicesObjectFilterObj.contractKindRef := ENServicesContractKindRef.Create;
        ENServicesObjectFilterObj.contractKindRef.code := contractKindCode;
      end;

      //FilterObject := ENServicesObjectFilter.Create;
      FilterObject := ENServicesObjectFilterObj;
      conditionSQL := ENServicesObjectFilter(FilterObject).conditionSQL;
      AddCondition(conditionSQL, 'contractnumberservices is not null');

      if not priconnections then
        AddCondition(conditionSQL, 'coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_CONNECTION));


      if notStandartConnection then
         AddCondition(conditionSQL, ' ENSERVICESOBJECT.code in ' +
                    '( ' +
                    ' select so2tc.servicesobjectrefcode ' +
                    '   from enservicesobject2techcondtnsservices so2tc, ' +
                    '        entechconditionsservcs tc ' +
                    '  where so2tc.techcondservrefcode = tc.code ' +
                    '   and tc.s04refcode = ' + IntToStr(substation04Code) +
                    '   and tc.connectionkindrefcode = ' + IntToStr(ENCONNECTIONKIND_NO_STANDART) +
                    ') ' );
      {if frmENServicesObjectFilterEdit.TKClassificationTypeCode > 0 then
         AddCondition(conditionSQL,
         ' ENSERVICESOBJECT.code in (select distinct so.code from tkclassificationtype tcl  , enplanwork2classfctntp p2clt , enplanwork p , enservicesobject so ' +
         ' where tcl.code in ('+ IntToStr( frmENServicesObjectFilterEdit.TKClassificationTypeCode) +'  )  ' +
         '      and p2clt.classificationtyperfcd = tcl.code  ' +
         '      and p2clt.planrefcode = p.code  ' +
         '      and p.elementrefcode = so.elementcode ' +
         '      and p.kindcode = 5 ' +
         '  )  '
           );}

       // 01.04.2015 - фильтр по тексту калькулыции с маско т.е нпо конкретной калькуляции не подходит

      if trim(frmENServicesObjectFilterEdit.edtTKClassificationTypeName.Text) <> '' then
        AddCondition(conditionSQL,
         ' ENSERVICESOBJECT.code in (select distinct so.code from tkclassificationtype tcl  , enplanwork2classfctntp p2clt , enplanwork p , enservicesobject so ' +
         ' where tcl.kod like replace('+ chr(39)+trim(frmENServicesObjectFilterEdit.edtTKClassificationTypeName.Text)+chr(39) +'  , ' + chr(39) + '*' +chr(39) + ','+ chr(39) +'%' + chr(39) + ' )  ' +
         '      and p2clt.classificationtyperfcd = tcl.code  ' +
         '      and p2clt.planrefcode = p.code  ' +
         '      and p.elementrefcode = so.elementcode ' +
         '      and p.kindcode = 5 ' +
         '  )  '      );


      ENServicesObjectFilter(FilterObject).conditionSQL := conditionSQL;
      ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesObjectFilterEdit.Free;
    frmENServicesObjectFilterEdit:=nil;
  end;
end;


procedure TfrmENServicesCalculationShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENServicesCalculationShow.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode, planCode : Integer;
    svoObject : ENServicesObject;
begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
    svoObject := TempENServicesObject.getObject(objCode);
    planCode := DMReports.getPlanCodeForCalculationByElement(svoObject.element.code);
  except
    on EConvertError do Exit;
  end;

  // для договоров, созданных с сайта, при утверждении сметы проверяем доверенность и договор в ФК...
  if (svoObject.createdFromSite = YES) then
  begin
    if (svoObject.finDocID = LOW_INT) then
    begin
      Application.MessageBox(PChar('Не вибрано договір з Фін. Колекції!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      actEditExecute(Sender);
      Exit;
    end;

    if (svoObject.warrantRef.code = Low(Integer)) then
    begin
      Application.MessageBox(PChar('Спочатку треба вибрати довіреність!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      actEditExecute(Sender);
      Exit;
    end;

    if (svoObject.contragentName = '') then
    begin
      Application.MessageBox(PChar('Не вибрано замовника у договорі!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      actEditExecute(Sender);
      Exit;
    end;

    if (svoObject.contractDateServices = nil) then
    begin
      Application.MessageBox(PChar('Не вибрано дату договору!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      actEditExecute(Sender);
      Exit;
    end;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити кошторис ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject.budgetApproved(objCode, planCode);

    Application.MessageBox(PChar('Кошторис затверджено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesCalculationShow.actUnBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження кошторису ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempENServicesObject.unBudgetApproved(objCode);

    Application.MessageBox(PChar('Затвердження відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;



procedure TfrmENServicesCalculationShow.actSignedExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
    servicesObject : ENServicesObject;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  if (servicesObject.finDocID = LOW_INT) then
  begin
    Application.MessageBox(PChar('Не вибрано договір з Фін. Колекції!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  if (servicesObject.contragentName = '') then
  begin
    Application.MessageBox(PChar('Не вибрано замовника у договорі!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  // Для новых договоров банковские реквизиты - обязательные поля (для юр. лиц небюджет)!
  if (servicesObject.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT) then
  begin
    if (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET) then
      if (servicesObject.contragentBankName = '') or
         (servicesObject.contragentBankAccount = '') { or
         (servicesObject.contragentBankMfo = '') } then
      begin
        Application.MessageBox(PChar('Введіть банківські реквізити Замовника!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        actEditExecute(Sender);
        Exit;
      end;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.signed(objCode);

    Application.MessageBox(PChar('Договір підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actUnSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання договору?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unSigned(objCode);

    Application.MessageBox(PChar('Підписання відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actPaidExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте сплатити рахунок за договором?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.paid(objCode);

    Application.MessageBox(PChar('Рахунок сплачено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actUnPaidExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити оплату?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unPaid(objCode);

    Application.MessageBox(PChar('Оплату відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actCanceledExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.canceled(objCode);

    Application.MessageBox(PChar('Договір відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actChangeContractFinExecute(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;

   soObj:ENServicesObject;
   TempENServicesObject: ENServicesObjectControllerSoapPort;
begin



   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin

            try
                soObj:=ENServicesObject.Create;
                try
                  soObj.code := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
                except
                  on EConvertError do Exit;
                end;


                TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

                soObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                soObj.contractDate := TXSDate.Create;
                soObj.contractDate.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject, 2))));
                soObj.name := GetReturnValue(sgFINServicesObject, 3);
                soObj.partnerCode:= GetReturnValue(sgFINServicesObject, 4);
                soObj.finDocCode :=  GetReturnValue(sgFINServicesObject, 5);
                soObj.finDocID := StrToInt( GetReturnValue(sgFINServicesObject, 6));
                soObj.commentGen :=  GetReturnValue(sgFINServicesObject, 7);

                TempENServicesObject.changeContractFin(soObj);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Close;
      UpdateGrid(Sender);
   end;
end;


procedure TfrmENServicesCalculationShow.PopupMenu1Popup(Sender: TObject);
var
  calc: ENServicesObject;
  ObjCode: Integer;
begin

  miActSigned.Visible := False;
  miActUnSigned.Visible := False;

  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  calc := DMReports.getServicesObjectByCode(ObjCode);
  if calc = nil then
  begin
    Exit;
  end;

  if (calc <> nil) then
  begin
    if (DMReports.CheckCounters(ObjCode)) then
    begin
      miActSigned.Visible := True;
      miActUnSigned.Visible := True;
    end;
  end;

  // SUPP - 3740... +++ отказ заказчика от услуг - пока не проведен в ФК и не присоединение!!!
  actDisclaimerCustomerServices.Enabled :=
  ( ( (calc.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_DISCLAIMER)
        and (calc.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD)
        and (calc.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION) )

    and (calc.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID)
    and (calc.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED)
    and (calc.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE)
  );

  // 21.05.2020... SUPP-91700... +++ договор в статусе "Оплачен"
  // отменить договор возможно при наличии возврата денег
  // проверка на серваке
  actCanceled.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT)
      or (calc.statusRef.code <> ENSERVICESOBJECTSTATUS_PAID);

  actBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT;
  actUnBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
  actSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
  actUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;

  actChangeContractFin.Enabled := calc.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD;

  if calc.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then
  begin
     HideActions([actPrepaid, actUnPrepaid {*** , actFinishWork, actUndoFinishWorks ***}
                  {, actCloseContract , actunCloseContract SUPP-4588 статус договора закрытый должен быть и на договорах по методике без предоплат } ]);
     actPaid.Caption := 'Сплатити рахунок';
     actUnPaid.Caption := 'Відмінити сплату рахунка';

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actUndoFinishWorks.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     ///// 19.07.2018 Теперь можем переводить в статус "Работы выполнены" и договора с типом расчета "Згідно кошторису"
     // Если это юр. лицо бюджет, то работы могут быть выполнены, не дожидаясь оплаты, иначе - после "Оплаты"
     if calc.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
     begin
       // actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
       //                          (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID)) and
       //                         (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);
       // actPaid.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
       //                   (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED);

       actFinishWork.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
       actUndoFinishWorks.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
       actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     end
     else
       actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) and
                                (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);
     /////

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;
		 actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;

		 actCloseContract.Enabled := calc.contractStatusRef.code in [  ENSERVICESOBJECTSTATUS_COMPLETED , ENSERVICESOBJECTSTATUS_PAID] ;
		 actunCloseContract.Enabled := calc.contractStatusRef.code =  ENSERVICESOBJECTSTATUS_CLOSE;

  end
  else if calc.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
  begin
		 HideActions([actPrepaid, actUnPrepaid, actFinishWork, actUndoFinishWorks, actCloseContract, actunCloseContract], false);
     actPaid.Caption := 'Сплатити остаточний рахунок';
     actUnPaid.Caption := 'Відмінити сплату остаточного рахунка';

     ///// 14.05.13 NET-4235
     //actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actPrepaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actUnPrepaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID;

     //actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) and
     //                         (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);

     actUndoFinishWorks.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     // Если это юр. лицо бюджет, то работы могут быть выполнены, не дожидаясь оплаты, иначе - после "Оплаты"
		 if calc.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
     begin
			 // actFinishWork.Enabled := ((calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
       //                           (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID)) and
       //                          (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);
       // actUndoFinishWorks.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

       // для бюджета без предоплаты
       actPrepaid.Enabled := False;
       actFinishWork.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
       actUndoFinishWorks.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
       actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     end
     else
       actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) and
                                (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     /////

     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID; //ENSERVICESOBJECTSTATUS_PAID;
		 actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;


		 actCloseContract.Enabled := calc.contractStatusRef.code in [  ENSERVICESOBJECTSTATUS_PREPAID , ENSERVICESOBJECTSTATUS_COMPLETED , ENSERVICESOBJECTSTATUS_PAID] ;
		 actunCloseContract.Enabled := calc.contractStatusRef.code =  ENSERVICESOBJECTSTATUS_CLOSE;
  end
	else
    raise Exception.Create('NET-4235 Невідомий тип розрахунку для договору! Код договору: ' + IntToStr(ObjCode));


  if calc.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
  begin
    actPaid.Caption := 'Сплатити рахунок';
    actUnPaid.Caption := 'Відмінити сплату рахунка';
  end;

  DisableActions([actUpdateCounterZonesType], (calc.countersZoneType = Low(Integer)));
  HideActions([actUpdateCounterZonesType], (calc.countersZoneType = Low(Integer)));
end;


procedure TfrmENServicesCalculationShow.actExpExcelExecute(
  Sender: TObject);
  var AppPath, FileName: String;
      OldCursor: TCursor;
begin
//  inherited;
//  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку ... '+#10#13+' Зберегти в Ексель ?'),
//                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
//  begin
//    DMReports.exportGrid(sgENServicesObject, 'Список_договорів_');
//  end;

  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('Список договорів_') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmENServicesCalculationShow.actCountersActSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати акт прийому лічильників?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.actSigned(objCode);

    Application.MessageBox(PChar('Акт підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actCountersActUnSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання акту?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.actUnSigned(objCode);

    Application.MessageBox(PChar('Підписання акту відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesCalculationShow.actFinishWorkExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
    servicesObject: ENServicesObject;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  {
  if (servicesObject.finDocID = LOW_INT) then
  begin
    Application.MessageBox(PChar('Не вибрано договір з Фін. Колекції!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  if (servicesObject.contragentName = '') then
  begin
    Application.MessageBox(PChar('Не вибрано замовника у договорі!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;
  }

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести договір у статус "Роботи виконані"?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject.finishWorks(objCode);
    Application.MessageBox(PChar('Договір переведено в статус "Роботи виконані"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actPrepaidExecute(Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте сплатити попередній рахунок за договором?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.prepaid(objCode);

    Application.MessageBox(PChar('Попередній рахунок сплачено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actUnPrepaidExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити сплату попереднього рахунку?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unPrepaid(objCode);

    Application.MessageBox(PChar('Сплату попереднього рахунку відмінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actDisclaimerCustomerServicesExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести договір у статус "Відмова замовника від послуг"???'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.disclaimerCustomerServices(objCode);

    Application.MessageBox(PChar('Статус договіру змінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesCalculationShow.actCloseContractExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести статус договору в "Закритий"?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

		TempENServicesObject.closeContract(objCode);

    Application.MessageBox(PChar('Статус договора змінено на статус "Закритий"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actUnCloseContractExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
		objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити  переведення договору в статус "Закритий"?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unCloseContract(objCode);

    Application.MessageBox(PChar('Закриття договору відмінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesCalculationShow.actUndoFinishWorksExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити переведення договору в статус "Роботи виконані"?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempENServicesObject.undoFinishWorks(objCode);

    Application.MessageBox(PChar('Переведення в статус "Роботи виконані" відмінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

end.


