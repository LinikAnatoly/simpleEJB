
unit EditENServicesFromSideObjectConsolid;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENServicesFromSideObjectController,
    ENConsts , EditENPlanWorkFilter, ENPlanWorkController , ENServFromSide2PlanWorkController,
    ExtCtrls, AdvObj , EditENPlanWork , ENTechConditionsServicesController,
  TB2Item, TB2Dock, TB2Toolbar, AdvSplitter,DateUtils  ;

type
  TfrmENServicesFromSideObjectConsolidEdit = class(TDialogForm)
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    tsPlans: TTabSheet;
    edtCommentGen: TMemo;
    HTTPRIOENServicesFromSideObject: THTTPRIO;
    btnCancel: TButton;
    btnOk: TButton;
    edtCode: TEdit;
    edtENElementElementName: TEdit;
    edtENDepartmentDepartmentName: TEdit;
    edtDateEdit: TDateTimePicker;
    edtFinDocID: TEdit;
    edtFinDocCode: TEdit;
    edtPartnerCode: TEdit;
    edtName: TEdit;
    edtContractDate: TDateTimePicker;
    edtContractNumber: TEdit;
    lblContractNumber: TLabel;
    lblName: TLabel;
    spbContractNumberSelect: TSpeedButton;
    lblCode: TLabel;
    lblENElementElementName: TLabel;
    spbENElementElement: TSpeedButton;
    lblENDepartmentDepartmentName: TLabel;
    spbENDepartmentDepartment: TSpeedButton;
    lblDateEdit: TLabel;
    lblUserGen: TLabel;
    lblCommentGen: TLabel;
    lblFinDocID: TLabel;
    lblFinDocCode: TLabel;
    lblPartnerCode: TLabel;
    HTTPRIOENPlanWork: THTTPRIO;
    Panel1: TPanel;
    ImageList1: TImageList;
    alPlans: TActionList;
    actViewPlan: TAction;
    actInsertPlan: TAction;
    actDeletePlan: TAction;
    actEditPlan: TAction;
    actClosePlan: TAction;
    actUnClosePlan: TAction;
    actFinishPlan: TAction;
    actUndoFinishPlan: TAction;
    actPreConfirm: TAction;
    actConfirm: TAction;
    actUndoConfirm: TAction;
    actSaveFinexecutDepartment: TAction;
    pmPlans: TPopupMenu;
    miViewPlan: TMenuItem;
    miEditPlan: TMenuItem;
    miDeletePlan: TMenuItem;
    miN1: TMenuItem;
    miClosePlan: TMenuItem;
    N11: TMenuItem;
    miPreConfirm: TMenuItem;
    miConfirm: TMenuItem;
    miUndoConfirm: TMenuItem;
    miN2: TMenuItem;
    miUnClosePlan: TMenuItem;
    miN3: TMenuItem;
    miFinishPlan: TMenuItem;
    miUndoFinishPlan: TMenuItem;
    miChangeFinexecutorForPlan: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton16: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    tbBind2Plan: TToolButton;
    tbUnBind2Plan: TToolButton;
    pmAddPlan: TPopupMenu;
    miAddPlan: TMenuItem;
    addPlanPriconnection: TMenuItem;
    actAddPlanPriconnection: TAction;
    HTTPRIOENTechConditionsServices: THTTPRIO;
    HTTPRIOENContragent: THTTPRIO;
    HTTPRIO1: THTTPRIO;
    HTTPRIOENServicesObject: THTTPRIO;
    tsRQOrder: TTabSheet;
    sgRQOrder: TAdvStringGrid;
    spl1: TSplitter;
    sgRQOrderItem: TAdvStringGrid;
    alRQOrder: TActionList;
    actRQOrderUpdate: TAction;
    HTTPRIORQOrder: THTTPRIO;
    HTTPRIORQOrderItem: THTTPRIO;
    actRQOrderItemUpdate: TAction;
    tsBill: TTabSheet;
    tsRqFkOrder: TTabSheet;
    ImageList2: TImageList;
    actListBill: TActionList;
    actViewBill: TAction;
    actUpdateBill: TAction;
    HTTPRIORQBill: THTTPRIO;
    actBindPlan2ServicesFromSide: TAction;
    HTTPRIOENServFromSide2PlanWork: THTTPRIO;
    actDeleteBindPlan2ServicesFromSide: TAction;
    HTTPRIOENBuilding2ServicesObject: THTTPRIO;
    N1: TMenuItem;
    miBindPlan2ServicesFromSide: TMenuItem;
    sgENPlanWork: TAdvStringGrid;
    pmRQOrder: TPopupMenu;
    pmRQOrderUpdate: TMenuItem;
    planActionList: TActionList;
    actPlanView: TAction;
    actPlanDelete: TAction;
    actPlanEdit: TAction;
    actPlanUpdate: TAction;
    ImageList3: TImageList;
    planPopupMenu: TPopupMenu;
    miPlanView: TMenuItem;
    miPlanDelete: TMenuItem;
    miPlanEdit: TMenuItem;
    miPlanUpdate: TMenuItem;
    N2: TMenuItem;
    actPlanMove: TAction;
    miPlanMove: TMenuItem;
    actPlanSaveAddInfo: TAction;
    HTTPRIOAuth: THTTPRIO;
    miPlanSaveAddInfo: TMenuItem;
    actPlanSaveFinexecutDepartment: TAction;
    actPlanFinishPlanWork: TAction;
    miPlanFinishPlanWork: TMenuItem;
    actPlanCopyPlan: TAction;
    actPlanUndoFinishPlanWork: TAction;
    miPlanUndoFinishPlanWork: TMenuItem;
    N3: TMenuItem;
    miPlanCopyPlan: TMenuItem;
    pmRQOrderItem: TPopupMenu;
    MenuItem1: TMenuItem;
    actRQOrderItemIsPAID: TAction;
    actOrderItemisNOPAID: TAction;
    actRQOrderView: TAction;
    miRQOrderView: TMenuItem;
    alRQFKOrder: TActionList;
    actRQFKOrderView: TAction;
    actRQFKOrderInsert: TAction;
    actRQFKOrderDelete: TAction;
    actRQFKOrderEdit: TAction;
    actRQFKOrderUpdate: TAction;
    actRQFKOrderFilter: TAction;
    actRQFKOrderNoFilter: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton3: TToolButton;
    ToolButton10: TToolButton;
    btnAddChecked: TToolButton;
    sgRQFKOrderItem: TAdvStringGrid;
    AdvSplitter1: TAdvSplitter;
    sgRQFKOrder: TAdvStringGrid;
    HTTPRIORQFKOrder: THTTPRIO;
    actRQFKOrderItemUpdate: TAction;
    HTTPRIORQFKOrderItem: THTTPRIO;
    GroupBox1: TGroupBox;
    TBToolbar3: TTBToolbar;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    sgRQBill: TAdvStringGrid;
    gbPayment: TGroupBox;
    sgRQPayDocItem: TAdvStringGrid;
    actPayUpdate: TAction;
    HTTPRIORQPayDocItem: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    pmRQFKOrder: TPopupMenu;
    pmRQFKOrderUpdate: TMenuItem;
    actCreatePrihod: TAction;
    miCreatePrihod: TMenuItem;
    actUnCreatePrihod: TAction;
    miUnCreatePrihod: TMenuItem;
    actMoveToFK: TAction;
    actUnMoveToFK: TAction;
    lblNumberProject: TLabel;
    edtNumberProject: TEdit;
    mmoBillAndPayments: TMemo;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbContractNumberSelectClick(Sender: TObject);
  function getPlansList(filter : ENPlanWorkFilter) : ENPlanWorkShortList;
    procedure actUpdatePlanExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure actInsertPlanExecute(Sender: TObject);
    procedure actAddPlanPriconnectionExecute(Sender: TObject);
    function getContragentsCount(): Integer;
    procedure actViewPlanExecute(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure miAddPlanClick(Sender: TObject);
    procedure actRQOrderUpdateExecute(Sender: TObject);
    procedure actRQOrderItemUpdateExecute(Sender: TObject);
    procedure sgRQOrderClick(Sender: TObject);
    procedure actUpdateBillExecute(Sender: TObject);
    procedure actBindPlan2ServicesFromSideExecute(Sender: TObject);
    procedure actDeleteBindPlan2ServicesFromSideExecute(Sender: TObject);
    procedure actPlanViewExecute(Sender: TObject);
    procedure actPlanDeleteExecute(Sender: TObject);
    procedure actPlanEditExecute(Sender: TObject);
    procedure actPlanMoveExecute(Sender: TObject);
    procedure actPlanSaveAddInfoExecute(Sender: TObject);
    procedure actPlanSaveFinexecutDepartmentExecute(Sender: TObject);
    procedure actPlanFinishPlanWorkExecute(Sender: TObject);
    procedure actPlanUndoFinishPlanWorkExecute(Sender: TObject);
    procedure actPlanCopyPlanExecute(Sender: TObject);
    procedure actRQOrderItemIsPAIDExecute(Sender: TObject);
    procedure actOrderItemisNOPAIDExecute(Sender: TObject);
    procedure actViewBillExecute(Sender: TObject);
    procedure sgRQOrderDblClick(Sender: TObject);
    procedure actRQOrderViewExecute(Sender: TObject);
    procedure sgRQBillDblClick(Sender: TObject);
    procedure actRQFKOrderViewExecute(Sender: TObject);
    procedure actRQFKOrderInsertExecute(Sender: TObject);
    procedure actRQFKOrderUpdateExecute(Sender: TObject);
    procedure actRQFKOrderItemUpdateExecute(Sender: TObject);
    procedure sgRQFKOrderClick(Sender: TObject);
    procedure actPayUpdateExecute(Sender: TObject);
    procedure sgRQBillClick(Sender: TObject);
    procedure sgRQOrderItemDblClick(Sender: TObject);
    procedure sgENPlanWorkDblClick(Sender: TObject);
    procedure actDeletePlanExecute(Sender: TObject);
    procedure actCreatePrihodExecute(Sender: TObject);
    procedure actUnCreatePrihodExecute(Sender: TObject);
    procedure actMoveToFKExecute(Sender: TObject);
    procedure actUnMoveToFKExecute(Sender: TObject);

  private
    { Private declarations }
    ENTechConditionsServicesObj: ENTechConditionsServices;
  public
    { Public declarations }

end;

var
  frmENServicesFromSideObjectConsolidEdit: TfrmENServicesFromSideObjectConsolidEdit;
  ENServicesFromSideObjectObj: ENServicesFromSideObject;

  ENPlanWorkHeaders: array [1..21] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
          ,'Інфо ОЗ-1'
          ,'Інфо ОЗ-2'
          ,'Інфо Розпорядження(подача напруги) '
        );


         RQOrderHeaders: array [1..13] of String =
        ( 'Код'
          ,'№ заявки'
          ,'№ проекта'
          ,'Період'//'Період (місяць)'
          ,'Дата складання'
          ,'Підрозділ'
          ,'Вид заявки'
          ,'Тип заявки'
          ,'Вид ресурса'
          ,'Бюджетотримач'
          ,'Сума (з ПДВ)'
          ,'Статус'
          ,'користувач'
        );

  RQOrderItemHeaders: array [1..15] of String =
        ( 'Код'
          , '№'
          , 'Код ДДС' 
          , 'Матеріал(Довідник)'
          , 'Од. виміру(Довідник)'
          //,'Назва матеріалу (Текст)'
          //,'Од. виміру (Текст)'

          ,'Кількість'
          ,'Ціна (з ПДВ)'
          ,'Сума (з ПДВ)'
          
          ,'Строк поставки'
          , 'Запл.дата сплати'
          , 'Запл.дата постачання'

          //,'ціна без ПДВ'
          //,'ПДВ'
          //,'Сума'
          //,'Сума ПДВ'

          ,'Кількість первинна'
          ,'Постачальник'
          ,'№ та дата договору'
          ,'Примітка'
          //,'Користувач'
        );

  RQBillHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер'
          ,'Номер проекта'
          ,'Дата рахунку'
          ,'Сума (з ПДВ)'
          ,'постачальник'
          ,'№ договору/дата'
          ,'статус рахунку'
          ,'стан рахунку'
          ,'користувач який вніс зміни'
        );

   RQFKOrderHeaders: array [1..22] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Дата проведення'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Перевірено у бухгалтерії'
          , 'Сума без ПДВ (грн)'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Загальна вага, кг'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
          ,'Дата постач. матеріалів'

        );

 RQFKOrderItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Вага, кг'
          ,'Дж.фін.'
          ,''
        );
     RQPayDocItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер документа'
          ,'Дата сплати'
          ,'Номер доручення'
          ,'Матеріал(Довідник)'
          ,'Од. виміру(Довідник)'
          ,'Кількість'
          ,'Сума у рахунку(без ПДВ)'
          ,'Сума у рахунку(з ПДВ)'
          ,'Сума сплати'
        );

  const
  MATERIAL_COL_NUMBER   = 4; // № столбца 'Матеріал(Довідник)'
  
implementation


uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
  ,ShowFINServicesObject
  ,ENServicesObjectController ,
  DMReportsUnit, ShowENServicesConnection,
  ENServicesContractKindController, ENServicesContractTypeController,
  EditENTechConditionsServices, ENContragentController,
  ENPlanWorkKindController, ENPlanWorkFormController,
  ENTechCond2PlanWorkController, ENActController, RQOrderController,
  RQOrderItemController, TKMaterialsController, EditRQBill, RQBillController,
  ShowENPlanWork, ENBuilding2ServicesObjectController,
  EditENPlanWorkMoveHistory, ENPlanWorkMoveHistoryController,
  ENPlanWorkMoveReasonController, UserController, EditENPlanWorkAddInfo,
  EditENPlanWorkCopy, EditRQOrder, RQFKOrderController, ShowRQInvoice,
  RQInvoiceController, EditRQFKOrder, RQFKOrderKindController,
  RQFKOrderItemController, RQPayDocItemController, EditRQOrderItem,
  EditRQOrderItemServices, ENPlanWorkStatusController;


{uses  
    EnergyproController, EnergyproController2, ENServicesFromSideObjectController  ;
}
{$R *.dfm}



procedure TfrmENServicesFromSideObjectConsolidEdit.FormShow(Sender: TObject);
var
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
  servicesFromSideShortObj : ENServicesFromSideObjectShort;
begin

 PageControl1.ActivePage:= tsGeneral;

  if DialogState = dsView then
  begin
    DisableControls([
      edtENDepartmentDepartmentName
      ,spbENDepartmentDepartment
      ,edtENElementElementName
      ,spbENElementElement]);

    DisableControls([edtCode, edtContractDate, edtContractNumber,
            edtPartnerCode, edtFinDocCode, edtFinDocID, spbContractNumberSelect,edtNumberProject]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtCode, edtContractDate, edtContractNumber, 
            edtPartnerCode, edtFinDocCode, edtFinDocID , edtNumberProject]);
    DenyBlankValues([edtCommentGen, edtName]);
  end;

  if ((DialogState = dsInsert) or (DialogState = dsEdit)) then
  DisableControls([spbContractNumberSelect], False);

  if ( DialogState = dsEdit) then
  if ENServicesFromSideObjectObj.statusRef.code <> ENSERVICESFROMSIDEOBJECTSTATUS_DRAFT then
     DisableControls([spbContractNumberSelect] );

  // при редактировании лочим всегда
  // договор изменится при редактировании заявки
  // if (DialogState = dsEdit) then
  // DisableControls([spbContractNumberSelect], ENServicesFromSideObjectObj.finDocID <> Low_int);

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    DisableControls([edtName]);

    edtCode.Text := IntToStr(ENServicesFromSideObjectObj.code);
    edtNumberProject.Text := ENServicesFromSideObjectObj.numberProject;
    edtContractNumber.Text := ENServicesFromSideObjectObj.contractNumber;

    if ENServicesFromSideObjectObj.contractDate <> nil then
    begin
      edtContractDate.DateTime:=EncodeDate(ENServicesFromSideObjectObj.contractDate.Year,ENServicesFromSideObjectObj.contractDate.Month,ENServicesFromSideObjectObj.contractDate.Day);
      edtContractDate.checked := true;
    end
    else
    begin
      edtContractDate.DateTime:=SysUtils.Date;
      edtContractDate.checked := false;
    end;

    edtName.Text := ENServicesFromSideObjectObj.name;
    edtPartnerCode.Text := ENServicesFromSideObjectObj.partnerCode; 
    edtFinDocCode.Text := ENServicesFromSideObjectObj.finDocCode; 

    if ( ENServicesFromSideObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesFromSideObjectObj.finDocID)
    else
       edtFinDocID.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENServicesFromSideObjectObj.commentGen);


    if ENServicesFromSideObjectObj.dateEdit <> nil then
    begin
      edtDateEdit.DateTime:=EncodeDate(ENServicesFromSideObjectObj.dateEdit.Year,ENServicesFromSideObjectObj.dateEdit.Month,ENServicesFromSideObjectObj.dateEdit.Day);
      edtDateEdit.checked := true;
    end
    else
    begin
      edtDateEdit.DateTime:=SysUtils.Date;
      edtDateEdit.checked := false;
    end;

    edtENDepartmentDepartmentName.Text := ENServicesFromSideObjectObj.department.name;
    //edtENElementElementName.Text := ENServicesFromSideObjectObj.element.name;

    TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
    servicesFromSideShortObj := TempENServicesFromSideObject.getShortObjectWithBillAndPaySum(ENServicesFromSideObjectObj.code);



    mmoBillAndPayments.Lines.Add('Сума по рахункам:');
    if servicesFromSideShortObj.bill_sum <> nil then
    mmoBillAndPayments.Lines.Add(servicesFromSideShortObj.bill_sum.DecimalString)
    else
    mmoBillAndPayments.Lines.Add('0');

    mmoBillAndPayments.Lines.Add('Сума по сплатам:');
    if servicesFromSideShortObj.pay_sum <> nil then
    mmoBillAndPayments.Lines.Add(servicesFromSideShortObj.pay_sum.DecimalString)
    else
    mmoBillAndPayments.Lines.Add('0');

  end;
end;



procedure TfrmENServicesFromSideObjectConsolidEdit.actAddPlanPriconnectionExecute(
  Sender: TObject);
var
  TempEnPlanwork: ENPlanWorkControllerSoapPort;
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;


  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  tcFilter , tcServicesFilter: ENTechConditionsServicesFilter;
  tcList: ENTechConditionsServicesShortList;

  frmShowENServicesConnection : TfrmENServicesConnectionShow;
	servicesFilter : ENServicesObjectFilter;
	servicesObjectCode : Integer;
  tcServicesArr: ENTechConditionsServicesController.ArrayOfInteger;

  TempServicesObject: ENServicesObjectControllerSoapPort;
  ENServicesConnectionObj: ENServicesObject;
                                
begin

  servicesFilter := ENServicesObjectFilter.Create;
	SetNullXSProps(servicesFilter);
	SetNullIntProps(servicesFilter);
	servicesFilter.contractKindRef := ENServicesContractKindRef.Create;
	servicesFilter.contractKindRef.code := ENConsts.SERVICES_CONTRACT_KIND_SERVICES;
  servicesFilter.contractTypeRef := ENServicesContractTypeRef.Create;
  servicesFilter.contractTypeRef.code :=  ENConsts.ENSERVICESOBJECTTYPE_CONNECTION;
	frmShowENServicesConnection := TfrmENServicesConnectionShow.Create(Application,fmNormal, servicesFilter);

  DisableActions([frmShowENServicesConnection.actNoFilter]);
    try
      with frmShowENServicesConnection do
        if ShowModal = mrOk then begin

          try
            servicesObjectCode := StrToInt(GetReturnValue(sgENServicesObject,0));
          except on EConvertError do Exit;
          end;
          //edtServicesName.Text := GetReturnValue(sgENServicesObject,1) + ' | ' + GetReturnValue(sgENServicesObject,5);

          // Вытягиваем связанный объект ENTechConditionsServices
          // if priconnections then
          // begin
               tcServicesFilter := ENTechConditionsServicesFilter.Create;
               SetNullIntProps(tcServicesFilter);
               SetNullXSProps(tcServicesFilter);
               tcServicesFilter.conditionSQL := 'code in ' +
                 '(select so2tc.techcondservrefcode from enservicesobject2techcondtnsservices so2tc ' +
                 ' where so2tc.servicesobjectrefcode = ' + IntToStr(servicesObjectCode) + ')';

               TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
               tcServicesArr := TempENTechConditionsServices.getScrollableFilteredCodeArray(tcServicesFilter, 0, -1);
               if High(tcServicesArr) > -1 then
               begin

                 ENTechConditionsServicesObj := TempENTechConditionsServices.getObject(tcServicesArr[0]);

                 TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
                 ENServicesConnectionObj := TempServicesObject.getObject(servicesObjectCode);
                 // LoadENTechConditionsServices;
               end;
               ///// insrtplan
            if ENTechConditionsServicesObj = nil then
              raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

            if ENTechConditionsServicesObj.code = LOW_INT then
              raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

            if getContragentsCount() = 0 then
            begin
              Application.MessageBox(PChar('Спочатку потрібно ввести Замовників!'),
                                     PChar('Увага!'), MB_ICONWARNING);
              Exit;
            end;

            if ENServicesConnectionObj.contractDateServices = nil then
            begin
              Application.MessageBox(PChar('Спочатку введіть дату договору!'),
                                     PChar('Увага!'), MB_ICONWARNING);

              Exit;
            end;

            TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

            frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsInsert);

            try
              frmENPlanWorkEdit.isTechConditions := True;
              frmENPlanWorkEdit.isServicesFromSide := True;
              frmENPlanWorkEdit.ServicesFromSideCode := ENServicesFromSideObjectObj.code;

              frmENPlanWorkEdit.techCondServicesType := ENTechConditionsServicesObj.techCondServicesType.code;
              if ENTechConditionsServicesObj.connectionKindRef.code <> low(Integer) then
                frmENPlanWorkEdit.connectionKind :=
                  ENTechConditionsServicesObj.connectionKindRef.code
              else
                frmENPlanWorkEdit.connectionKind := ENCONNECTIONKIND_GENERAL_CONNECTION;

              frmENPlanWorkEdit.techCondServicesObjCode := ENTechConditionsServicesObj.code;

              frmENPlanWorkEdit.ENPlanWorkObj := ENPlanWork.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.kind := ENPlanWorkKind.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.kind.code := ENPLANWORKKIND_CURRENT;
              frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT -1;
              frmENPlanWorkEdit.cbPlanWorkKind.Enabled := False;

              frmENPlanWorkEdit.ENPlanWorkObj.monthGen := ENTechConditionsServicesObj.contractDate.Month;
              frmENPlanWorkEdit.edtMonthGen.ItemIndex := ENTechConditionsServicesObj.contractDate.Month - 1;

              frmENPlanWorkEdit.ENPlanWorkObj.dateStart := TXSDate.Create;
              //frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENTechConditionsServicesObj.contractDate.Year, ENTechConditionsServicesObj.contractDate.Month, 1)));
              frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENServicesConnectionObj.contractDateServices.Year,
                                                                                        ENServicesConnectionObj.contractDateServices.Month, 1)));

              frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := ENServicesConnectionObj.department.code; //ENTechConditionsServicesObj.department.code;
              frmENPlanWorkEdit.edtDepartment.Text := ENServicesConnectionObj.department.name; //ENTechConditionsServicesObj.department.name;

              frmENPlanWorkEdit.ENPlanWorkObj.budgetRef := ENDepartmentRef.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.budgetRef.code := ENBUDGET_VRTUVD;
              frmENPlanWorkEdit.edtENBudgetName.Text := 'ВРТУВД';

              frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_VRTUVD;
              frmENPlanWorkEdit.edtResponsibility.Text := 'ВРТУВД';

              frmENPlanWorkEdit.ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.formRef.code := ENPLANWORKFORM_NOPLANNED;
              frmENPlanWorkEdit.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_NOPLANNED - 1;


              frmENPlanWorkEdit.ENPlanWorkObj.priConnectionNumber := ENServicesConnectionObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;
              frmENPlanWorkEdit.edtPriConnectionNumber.Text := ENServicesConnectionObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;

              frmENPlanWorkEdit.edtServicesFromSide.Text:= ENServicesFromSideObjectObj.contractNumber;
              frmENPlanWorkEdit.ENPlanWorkObj.servicesFSideCnNum := ENServicesFromSideObjectObj.contractNumber;
              frmENPlanWorkEdit.ENPlanWorkObj.servicesFSideFinId := ENServicesFromSideObjectObj.findocid;

              ///// Генерим примечание
              TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

              // Чтобы получить красивый список Заказчиков (через зпт.), дернем лист
              tcFilter := ENTechConditionsServicesFilter.Create;
              SetNullIntProps(tcFilter);
              SetNullXSProps(tcFilter);
              tcFilter.code := ENTechConditionsServicesObj.code;

              tcList := TempENTechConditionsServices.getScrollableFilteredList(tcFilter, 0, 1); // по коду будет только 1
              if tcList.totalCount > 0 then
              begin

                 frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' +  ENServicesConnectionObj.contractNumberServices +
                                                               ' від ' + XSDate2String(ENServicesConnectionObj.contractDateServices) + ' р.' +
                                                               ' (' + tcList.list[0].contragentName + ')';

                 frmENPlanWorkEdit.edtCommentGen.Text := frmENPlanWorkEdit.ENPlanWorkObj.commentGen;
              end;
              /////

              if frmENPlanWorkEdit.ShowModal = mrOk then
              begin

                actUpdatePlanExecute(Sender);
              end;



            finally
            end;


        end;
    finally
          frmShowENServicesConnection.Free;
       end;


end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actBindPlan2ServicesFromSideExecute(
  Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  planFilter : ENPlanWorkFilter;
  plan : ENPlanWork;
  frmENPlanWorkShow : TfrmENPlanWorkShow;


  TempENServFromSide2PlanWork: ENServFromSide2PlanWorkControllerSoapPort;
  ENServFromSide2PlanWorkList: ENServFromSide2PlanWorkShortList;
  TempENServFromSide2PlanWorkFilter : ENServFromSide2PlanWorkFilter;
  ENServFromSide2PlanWorkObj : ENServFromSide2PlanWork;
begin
  inherited;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  planFilter.conditionSQL := ' enplanwork.code not in ( select qq.planrefcode from enservfromside2planwrk qq where qq.planrefcode = enplanwork.code  ) and  enplanwork.typerefcode in ( ' + IntToStr(ENConsts.ENPLANWORKTYPE_SERVICES_FROM_SIDE) +
  ','+ IntToStr( ENConsts.ENPLANWORKTYPE_SERVICES_FROM_SIDE) + ')';
  planFilter.servicesFSideCnNum:= ENServicesFromSideObjectObj.contractNumber;
  planFilter.orderBySQL := 'enplanwork.datestart desc';

  try
    frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);

    DisableActions([frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actDelete,
        frmENPlanWorkShow.actNoFilter, frmENPlanWorkShow.actAddPlanItems]);

   frmENPlanWorkShow.sgENPlanWork.PopupMenu := pmPlans;
   // frmENPlanWorkShow.viewPlanWork := 1;
    frmENPlanWorkShow.isFiltered := True;

    if frmENPlanWorkShow.ShowModal = mrOk then
    begin
      plan := TempENPlanWork.getObject(StrToInt(frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,0)));
      if (plan <> nil) then begin
        TempENServFromSide2PlanWork := HTTPRIOENServFromSide2PlanWork as ENServFromSide2PlanWorkControllerSoapPort;
        ENServFromSide2PlanWorkObj := ENServFromSide2PlanWork.Create;
        ENServFromSide2PlanWorkObj.planRef := ENPlanWorkRef.Create;
        ENServFromSide2PlanWorkObj.planRef.code := plan.code;
        ENServFromSide2PlanWorkObj.servFromSideRef := ENServicesFromSideObjectRef.Create;
        ENServFromSide2PlanWorkObj.servFromSideRef.code := ENServicesFromSideObjectObj.code;

        TempENServFromSide2PlanWork.add(ENServFromSide2PlanWorkObj);
      end;

      actUpdatePlanExecute(Sender);
    end;
  finally
    frmENPlanWorkShow.Free;
    frmENPlanWorkShow:=nil;
  end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actCreatePrihodExecute(
  Sender: TObject);
var ObjCode : Integer;
TempRQFKOrder: RQFKOrderControllerSoapPort;
TempENPlanWork : ENPlanWorkControllerSoapPort;
obj : RQFKOrder;

finishedPlansFilterObj : ENPlanWorkFilter;
finishedPlansList : ENPlanWorkShortList;
sumWithoutVat, sumVat, sumVatCalculated, ndsPercent : Single;
begin

    try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;

	 if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Складений" у накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin

        TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
        obj := TempRQFKOrder.getObject(ObjCode);


        if obj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
        begin
          {SUPP-5149 Проверка на планы со статусом работы завершены}
          TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
          finishedPlansFilterObj := ENPlanWorkFilter.Create;
          SetNullXSProps(finishedPlansFilterObj);
          SetNullIntProps(finishedPlansFilterObj);
          finishedPlansFilterObj.status := ENPlanWorkStatus.Create;
          finishedPlansFilterObj.status.code := ENConsts.ENPLANWORKSTATUS_WORKS_FINISHED;
          finishedPlansFilterObj.conditionSQL := ' EXISTS ( ' +
                        ' select i.code from enestimateitem i where i.planrefcode = ENPLANWORK.CODE and i.code in ( ' +
                        ' select o2e.estimateitemcode from rqfkorderitem2enstmttm o2e where o2e.fkorderitemrefcode in (' +
                        ' select oi.code from rqfkorderitem oi where oi.fkorderrefcode = ' + IntToStr(ObjCode) + ')))';
          finishedPlansList := TempENPlanWork.getScrollableFilteredList(finishedplansFilterObj, 0, -1);
          if finishedPlansList.totalCount > 0 then
          begin
                if Application.MessageBox(PChar('План, що зв''язаний з цим ордером, знаходиться у статусі "Роботи завершені". Чи бажаєте ви перезатрведити план для складання ордеру (потім здійсниться повторне переведення плану у статус "Роботи завершенні") ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then TempRQFKOrder.createActFromServicesFS(ObjCode, True) Else Exit;
          end
          else
            TempRQFKOrder.createActFromServicesFS(ObjCode);
        end;


         actRQFKOrderUpdateExecute(Sender);
    end;

end;



procedure TfrmENServicesFromSideObjectConsolidEdit.actDeleteBindPlan2ServicesFromSideExecute(
  Sender: TObject);
Var TempENServFromSide2PlanWork: ENServFromSide2PlanWorkControllerSoapPort;
    s2pFilter : ENServFromSide2PlanWorkFilter;
    planCode, ObjCode: Integer;
    s2pCodesList: ENServFromSide2PlanWorkController.ArrayOfInteger;

begin

 try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServFromSide2PlanWork := HTTPRIOENServFromSide2PlanWork as ENServFromSide2PlanWorkControllerSoapPort;

  s2pFilter := ENServFromSide2PlanWorkFilter.Create;
  SetNullIntProps(s2pFilter);
  SetNullXSProps(s2pFilter);
  s2pFilter.planRef:= ENPlanWorkRef.Create;
  s2pFilter.planRef.code := planCode;
  s2pFilter.servFromSideRef:= ENServicesFromSideObjectRef.Create;
  s2pFilter.servFromSideRef.code := ENServicesFromSideObjectObj.code;

  s2pCodesList:= TempENServFromSide2PlanWork.getScrollableFilteredCodeArray(s2pFilter,0,-1);

  if High(s2pCodesList) > -1 then
     begin
      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Зв’язок договору послуг підряду з планами)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            TempENServFromSide2PlanWork.remove(s2pCodesList[0]);
            actUpdatePlanExecute(Sender);
        end;
     end;
  
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actDeletePlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
  ObjCode, eType : Integer;
  tPlan : ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (План робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

      TempENPlanWork.remove(ObjCode);
      actUpdatePlanExecute(Sender);

      sgENPlanWork.RowCount:= 2;




      sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actEditPlanExecute(
  Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan: ENPlanWork;
  ObjCode: Integer;
  act: ENAct;
  servicesObjectCode : Integer;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  ENServicesConnectionObj : ENServicesObject;
begin
  begin
    try
      ObjCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
    except
      on EConvertError do Exit;
    end;

    tPlan := DMReports.getPlanByCode(ObjCode);

    if tPlan = nil then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;


    if (tPlan.kind.code = ENPLANWORKKIND_FACT) then
    begin
      act := DMReports.getActByPlan(ObjCode);
      if (act.code <> LOW_INT) then
      begin
        Application.MessageBox(PChar('Цей факт включено до Акту!'),
          PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;

    if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED) then
    begin
      try
        TempENPlanWork.editPreConfirm(tPlan.code);
      except
        Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;

    if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
        //and
        //not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
    then
    begin
      Application.MessageBox(PChar('План затверджений!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    if (tPlan.kind.code = ENPLANWORKKIND_CALCULATION) then
    begin
      Application.MessageBox(PChar('Кошторис не редагується!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
    try
      //SUPP-4339

       ENServicesConnectionObj := DMReports.getServicesObjectByPlanCodeElementAndEnTechCond(objCode);
    if ENServicesConnectionObj <> nil then
    begin
      
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesConnectionObj.contractTypeRef.code =  ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;
    end;
      
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

      if frmENPlanWorkEdit.ShowModal = mrOk then
      begin
        actUpdatePlanExecute(Sender);
      end;
    finally
      frmENPlanWorkEdit.Free;
      frmENPlanWorkEdit:=nil;
    end;
  end; 
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQFKOrderInsertExecute(
  Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
    frmRQInvoiceShow : TfrmRQInvoiceShow;
    invoiceFilter : RQInvoiceFilter;
    objCode : Integer;

begin

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsInsert);

  try
    frmRQFKOrderEdit.RQFKOrderObj:=RQFKOrder.Create;

    frmRQFKOrderEdit.RQFKOrderObj.warrantDate:= TXSDate.Create;

    frmRQFKOrderEdit.RQFKOrderObj.kind := RQFKOrderKind.Create;

    frmRQFKOrderEdit.RQFKOrderObj.kind.code := RQFKORDER_KIND_SERVICES_FROM_SIDE;



      if frmRQFKOrderEdit.ShowModal = mrOk then
      begin
        if frmRQFKOrderEdit.RQFKOrderObj<>nil then

           actRQFKOrderUpdateExecute(Sender);
      end;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQFKOrderItemUpdateExecute(
  Sender: TObject);
var
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  i: Integer;
  RQFKOrderItemList: RQFKOrderItemShortList;
  itemFilter: RQFKOrderItemFilter;
  orderCode, itemLastCount : Integer;

begin
  ClearGrid(sgRQFKOrderItem);

  try
    orderCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
  except
   on EConvertError do Exit;
  end;


  TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

     itemfilter := RQFKOrderItemFilter.Create;
     SetNullIntProps(itemfilter);
     SetNullXSProps(itemfilter);
     itemFilter.fkOrderRef := RQFKOrderRef.Create;
     itemFilter.fkOrderRef.code := orderCode;

  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(itemFilter,0,-1);

  itemLastCount:=High(RQFKOrderItemList.list);

  if itemLastCount > -1 then
     sgRQFKOrderItem.RowCount:=itemLastCount+2
  else
     sgRQFKOrderItem.RowCount:=2;

   with sgRQFKOrderItem do
    for i:=0 to itemLastCount do
      begin
        // Application.ProcessMessages;
        if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;
        Cells[2, i+1] := RQFKOrderItemList.list[i].measurementName;
        Cells[3, i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
        Cells[4, i+1] := RQFKOrderItemList.list[i].nomenclatureName;
        Cells[5, i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;
        if RQFKOrderItemList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
        begin
          Cells[6,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
        end;

        if RQFKOrderItemList.list[i].priceWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;

        if RQFKOrderItemList.list[i].sumWithoutNds = nil then
          Cells[8,i+1] := ''
        else
        begin
          Cells[8,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
        end;

        if (RQFKOrderItemList.list[i].weight = nil) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQFKOrderItemList.list[i].weight.DecimalString;

        Cells[10,i+1] := RQFKOrderItemList.list[i].fundingTypeStr;

        sgRQFKOrderItem.RowCount:=i+2;
      end;
   sgRQFKOrderItem.Row:=1;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQFKOrderUpdateExecute(
  Sender: TObject);
Var i, j: Integer;
   TempRQFKOrder: RQFKOrderControllerSoapPort;
  FilterObject : RQFKOrderFilter;
  RQFKOrderList: RQFKOrderShortList;
  isSentMaterials : String;
begin
 for i:=1 to sgRQFKOrder.RowCount-1 do
   for j:=0 to sgRQFKOrder.ColCount-1 do
     sgRQFKOrder.Cells[j,i]:='';
  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
  SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);

  btnAddChecked.Visible := False;
  //DisableActions([actAddChecked], not (isTransportRoutes));
  //btnAddChecked.Visible := isTransportRoutes;


    sgRQFKOrder.ColumnHeaders[4] := 'Код постачальника';
    sgRQFKOrder.ColumnHeaders[5] := 'Постачальник';
    sgRQFKOrder.ColWidths[9] := 0;

  if RQFKORDER_KIND_SERVICES_FROM_SIDE = RQFKORDER_KIND_SERVICES_FROM_SIDE then
  begin
    sgRQFKOrder.ColWidths[5] := 400;
    sgRQFKOrder.ColumnHeaders[6] := 'сума (без ПДВ)';
    sgRQFKOrder.ColWidths[7] := 0;
    sgRQFKOrder.ColWidths[10] := 0;
    sgRQFKOrder.ColWidths[11] := 0;
    sgRQFKOrder.ColWidths[12] := 0;
    sgRQFKOrder.ColWidths[13] := 0;
    sgRQFKOrder.ColWidths[14] := 0;
    sgRQFKOrder.ColWidths[15] := 0;
    sgRQFKOrder.ColWidths[16] := 0;
  end;

   sgRQFKOrder.ColumnHeaders[20] := ' ';


  ColCount:=10000;
  TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FilterObject.conditionSQL:= ' rqfkorder.code in (select fkordercode from rqfkorder2planfact qq where qq.plancode in (select sp.planrefcode from enservfromside2planwrk sp where sp.servfromsiderefcode = '+IntToStr(ENServicesFromSideObjectObj.code) +' ))';
  FilterObject.orderBySQL := 'dategen desc, statuscode desc, RQFKORDER.code desc';

  RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilter(FilterObject),0,ColCount);

  LastCount:=High(RQFKOrderList.list);

  if LastCount > -1 then
     sgRQFKOrder.RowCount:=LastCount+2
  else
     sgRQFKOrder.RowCount:=2;

   with sgRQFKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;


        isSentMaterials := '';


        if RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderList.list[i].numberDoc;
        if RQFKOrderList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

		    if RQFKOrderList.list[i].datePosting = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQFKOrderList.list[i].datePosting);

          Cells[4,i+1] := RQFKOrderList.list[i].orgOkpo;


          Cells[5,i+1] := RQFKOrderList.list[i].orgName;

          Cells[6,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString;

          Cells[7,i+1] := RQFKOrderList.list[i].molOutName;


        Cells[8, i+1] := RQFKOrderList.list[i].statusName + isSentMaterials;
        if (Assigned(RQFKOrderList.list[i].checkedByAccountant))
		  and (RQFKOrderList.list[i].checkedByAccountant.AsBoolean = true) then
          Cells[9,i+1] := 'Так'
        else
          Cells[9,i+1] := '';

		if (Assigned(RQFKOrderList.list[i].sumWithoutNds)) then
          Cells[10,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else
          Cells[10,i+1] := '';

        Cells[11,i+1] := RQFKOrderList.list[i].expeditorCode;
        Cells[12,i+1] := RQFKOrderList.list[i].expeditorName;

        Cells[13,i+1] := RQFKOrderList.list[i].warrantNumber;
        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);
        Cells[15,i+1] := RQFKOrderList.list[i].warrantFIO;

        if RQFKOrderList.list[i].totalWeight = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := RQFKOrderList.list[i].totalWeight.DecimalString;

        Cells[17,i+1] := RQFKOrderList.list[i].userAdd;

        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[19,i+1] := RQFKOrderList.list[i].userGen;

        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

        if RQFKOrderList.list[i].dateDelivery = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDate2String(RQFKOrderList.list[i].dateDelivery);

        Objects[0, i+1] := RQFKOrderList.list[i];

        LastRow:=i+1;
        sgRQFKOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrder.Row:=1;

   actRQFKOrderItemUpdateExecute(Sender);


   


end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actInsertPlanExecute(
  Sender: TObject);
var
  TempEnPlanwork: ENPlanWorkControllerSoapPort;
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;


  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  tcFilter: ENTechConditionsServicesFilter;
  tcList: ENTechConditionsServicesShortList;
begin
  if DialogState = dsInsert then Exit;

  {if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if ENTechConditionsServicesObj.code = LOW_INT then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if getContragentsCount() = 0 then
  begin
    Application.MessageBox(PChar('Спочатку потрібно ввести Замовників!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if ENServicesConnectionObj.contractDateServices = nil then
  begin
    Application.MessageBox(PChar('Спочатку введіть дату договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    if edtContractDateServices.CanFocus then edtContractDateServices.SetFocus;
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsInsert);

  try
    frmENPlanWorkEdit.isTechConditions := True;

    frmENPlanWorkEdit.techCondServicesType := ENTechConditionsServicesObj.techCondServicesType.code;
    if ENTechConditionsServicesObj.connectionKindRef.code <> low(Integer) then
      frmENPlanWorkEdit.connectionKind :=
        ENTechConditionsServicesObj.connectionKindRef.code
    else
      frmENPlanWorkEdit.connectionKind := ENCONNECTIONKIND_GENERAL_CONNECTION;

    frmENPlanWorkEdit.techCondServicesObjCode := ENTechConditionsServicesObj.code;

    frmENPlanWorkEdit.ENPlanWorkObj := ENPlanWork.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.kind := ENPlanWorkKind.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.kind.code := ENPLANWORKKIND_CURRENT;
    frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT -1;
    frmENPlanWorkEdit.cbPlanWorkKind.Enabled := False;

    frmENPlanWorkEdit.ENPlanWorkObj.monthGen := ENTechConditionsServicesObj.contractDate.Month;
    frmENPlanWorkEdit.edtMonthGen.ItemIndex := ENTechConditionsServicesObj.contractDate.Month - 1;

    frmENPlanWorkEdit.ENPlanWorkObj.dateStart := TXSDate.Create;
    //frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENTechConditionsServicesObj.contractDate.Year, ENTechConditionsServicesObj.contractDate.Month, 1)));
    frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENServicesConnectionObj.contractDateServices.Year,
                                                                              ENServicesConnectionObj.contractDateServices.Month, 1)));

    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := ENServicesConnectionObj.department.code; //ENTechConditionsServicesObj.department.code;
    frmENPlanWorkEdit.edtDepartment.Text := ENServicesConnectionObj.department.name; //ENTechConditionsServicesObj.department.name;

    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef.code := ENBUDGET_VRTUVD;
    frmENPlanWorkEdit.edtENBudgetName.Text := 'ВРТУВД';

    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_VRTUVD;
    frmENPlanWorkEdit.edtResponsibility.Text := 'ВРТУВД';

    frmENPlanWorkEdit.ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.formRef.code := ENPLANWORKFORM_NOPLANNED;
    frmENPlanWorkEdit.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_NOPLANNED - 1;


    frmENPlanWorkEdit.ENPlanWorkObj.priConnectionNumber := ENServicesConnectionObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;
    frmENPlanWorkEdit.edtPriConnectionNumber.Text := ENServicesConnectionObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;




    ///// Генерим примечание
    TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

    // Чтобы получить красивый список Заказчиков (через зпт.), дернем лист
    tcFilter := ENTechConditionsServicesFilter.Create;
    SetNullIntProps(tcFilter);
    SetNullXSProps(tcFilter);
    tcFilter.code := ENTechConditionsServicesObj.code;

    tcList := TempENTechConditionsServices.getScrollableFilteredList(tcFilter, 0, 1); // по коду будет только 1
    if tcList.totalCount > 0 then
    begin




       frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' +  ENServicesConnectionObj.contractNumberServices +
                                                     ' від ' + XSDate2String(ENServicesConnectionObj.contractDateServices) + ' р.' +
                                                     ' (' + tcList.list[0].contragentName + ')';

       frmENPlanWorkEdit.edtCommentGen.Text := frmENPlanWorkEdit.ENPlanWorkObj.commentGen;
    end;
    /////

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      //actUpdatePlanExecute(Sender);
      actUpdateExecute(Sender);
    end;



  finally
  end; }
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actMoveToFKExecute(
  Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    obj : RQFKOrder;
    buhDate: TXSDate;
    dtBuhDate, dtDocDate: TDateTime;
    ObjCode:Integer;
    rio : THTTPRIO;
begin

    try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте провести в ФК накладну ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempRQFKOrder := rio as RQFKOrderControllerSoapPort;
    obj := TempRQFKOrder.getObject(ObjCode);
    if (obj = nil) then Exit;

    dtDocDate := EncodeDate(obj.dateGen.Year, obj.dateGen.Month, obj.dateGen.Day);
    if Assigned(obj.datePosting) then begin
      dtBuhDate := EncodeDate(obj.datePosting.Year, obj.datePosting.Month, obj.datePosting.Day);
      if dtDocDate > dtBuhDate then begin
               if Application.MessageBox(PChar('Дата проведення ордеру (''' + DateToStr(dtBuhDate) + ''') меньша ' +
                                        ' ніж дата документу (''' + DateToStr(dtDocDate) + ''').' + Chr(10) +
                                        'Ви дійсно бажаєте продовжити?'),
                                        PChar('Увага !'), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
                Exit;
            end;
    end;

   

    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then
      TempRQFKOrder.moveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT then
      TempRQFKOrder.moveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
      TempRQFKOrder.moveRashodOperative2Tranzit(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
      TempRQFKOrder.moveRashodMeasurementChange(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
      TempRQFKOrder.moveRashodE2E(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP then
      TempRQFKOrder.moveRashodInFKLoadMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA then
      TempRQFKOrder.moveRashodInFKLoadMNMA(obj.code)
    else
    /////
    if obj.kind.code = RQFKORDER_KIND_MBP then
      TempRQFKOrder.moveRashodInFKMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_MNMA then
      TempRQFKOrder.moveRashodInFKMNMA(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MNMA then
      TempRQFKOrder.moveRashodOutInFKMNMA(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
      TempRQFKOrder.moveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET then
      TempRQFKOrder.movePrihodBufetInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_BUFET then
      TempRQFKOrder.moveRashodBufetInFK(obj.code)
    /////
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT then
      TempRQFKOrder.moveRashodReturnInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_GIFT then
      TempRQFKOrder.moveRashodGiftInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE then
      TempRQFKOrder.moveRashodToStorageInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_ZONE_CHANGING then
      TempRQFKOrder.moveZoneChangingInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_OUT_FUEL then
      TempRQFKOrder.moveOutFuelInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_OUT then
      TempRQFKOrder.moveAvarOutInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_IN then
      TempRQFKOrder.moveAvarInInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_OS_EXPL then
    begin
      buhDate := TempRQFKOrder.getCurrentBuhDate();

      if buhDate <> nil then
      begin
        dtBuhDate := EncodeDateTime(buhDate.Year, buhDate.Month, 1, 0, 0, 0, 0);
        dtDocDate := EncodeDateTime(obj.dateGen.Year, obj.dateGen.Month, 1, 0, 0, 0, 0);

        if dtDocDate < dtBuhDate then
        begin
          if Application.MessageBox(PChar('Місяць дати ОЗ-1 (' + DateToStr(dtDocDate) + ') менший, ' + #13#10 +
                                          'ніж поточний бух. місяць (' + DateToStr(dtBuhDate) + ').' + #13#10#13#10 +
                                          'Провести введення в експлуатацію поточною бух. датою?'),
                                    PChar('Увага !'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
            Exit;
        end;
      end;

      TempRQFKOrder.moveOSExplToFK(obj.code)
    end

    else
    if obj.kind.code = RQFKORDER_KIND_OS_MOVEMENT then
    begin
      buhDate := TempRQFKOrder.getCurrentBuhDate();

      if buhDate <> nil then
      begin
        dtBuhDate := EncodeDateTime(buhDate.Year, buhDate.Month, 1, 0, 0, 0, 0);
        dtDocDate := EncodeDateTime(obj.dateGen.Year, obj.dateGen.Month, 1, 0, 0, 0, 0);

        if dtDocDate < dtBuhDate then
        begin
          if Application.MessageBox(PChar('Місяць дати ОЗ-1 (' + DateToStr(dtDocDate) + ') менший, ' + #13#10 +
                                          'ніж поточний бух. місяць (' + DateToStr(dtBuhDate) + ').' + #13#10#13#10 +
                                          'Провести внутрішнє переміщення поточною бух. датою?'),
                                    PChar('Увага !'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
            Exit;
        end;
      end;

      TempRQFKOrder.moveOSMovementToFK(obj.code)
    end

    else
      ShowMessage('Ошибка в типе Ордера ...');

     actRQFKOrderUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actOrderItemisNOPAIDExecute(
  Sender: TObject);
var
  orderitemArr : ArrayOfRQOrderItemShort;
  TempRQOrderItem :  RQOrderitemControllerSoapPort;

 i, count, c: Integer ;
 state, isSel : Boolean;
begin
  inherited;
 TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

 setLength(orderitemArr,0);

 state := false;
  isSel := false;
  count := 0;

  for i:=1 to sgRQOrderItem.RowCount - 1 do
  begin
     sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку заявки !!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно пометить строки как не оплаченые ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgRQOrderItem.RowCount - 1 do
    begin
      sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
      if state then
        begin
        try
        count := High(orderitemArr)+1;
        setLength(orderitemArr,count+1);
        orderitemArr[count] := RQOrderItemShort.Create;
        orderitemArr[count].code := StrToInt(sgRQOrderItem.Cells[0,i]);
        except
        on EConvertError do Exit;
        end;
      end;
    end;
       TempRQOrderItem.nopaid(orderitemArr);
    end;
    actRQOrderUpdateExecute(Sender);

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQOrderItemIsPAIDExecute(
  Sender: TObject);
var
  orderitemArr : ArrayOfRQOrderItemShort;
  TempRQOrderItem :  RQOrderitemControllerSoapPort;

 i, count, c: Integer ;
 state, isSel : Boolean;
begin
  inherited;
 TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

 setLength(orderitemArr,0);

 state := false;
  isSel := false;
  count := 0;

  for i:=1 to sgRQOrderItem.RowCount - 1 do
  begin
     sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку заявки !!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно пометить строки как оплаченые ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgRQOrderItem.RowCount - 1 do
    begin
      sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
      if state then
        begin
        try
        count := High(orderitemArr)+1;
        setLength(orderitemArr,count+1);
        orderitemArr[count] := RQOrderItemShort.Create;
        orderitemArr[count].code := StrToInt(sgRQOrderItem.Cells[0,i]);;
        except
        on EConvertError do Exit;
        end;
      end;
    end;
       TempRQOrderItem.paid(orderitemArr);
    end;
    actOrderItemisNOPAIDExecute(Sender);

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQOrderItemUpdateExecute(
  Sender: TObject);
var 
  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderList: RQOrderShortList;

  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;

  RQOrderFilterObj : RQOrderFilter;
  RQOrderItemFilterObj : RQOrderItemFilter;
  i , ObjCode :Integer;
begin

  TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
   on EConvertError do Exit;
  end;


  if PageControl1.ActivePage = tsRQOrder then
      begin
        ClearGrids([ sgRQOrderItem]);        
        SetGridHeaders(RQOrderItemHeaders, sgRQOrderItem.ColumnHeaders);

        TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
        TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

        RQOrderItemFilterObj := RQOrderItemFilter.Create;
        SetNullIntProps(RQOrderItemFilterObj);
        SetNullXSProps(RQOrderItemFilterObj);        
        RQOrderItemFilterObj.orderRef := RQOrderRef.Create;
        RQOrderItemFilterObj.orderRef.code := ObjCode;
        RQOrderItemFilterObj.conditionSQL :=
         ' RQORDERITEM.code in ( select oi2ei.orderitemcode from rqorderitem2enestimttm oi2ei , enestimateitem ei , enservfromside2planwrk sp ' +
         ' where oi2ei.estimateitemcode=ei.code ' +
         ' and ei.planrefcode=sp.planrefcode' +
         ' and sp.servfromsiderefcode = '+ IntToStr(ENServicesFromSideObjectObj.code)+')' ;



       { RQOrderItemFilterObj.conditionSQL := ' rqorderitem.code in (select oi.code from rqorder o , rqorderitem oi , rqorderitem2enestimttm o2e , enestimateitem e ' +
         ' where o.code = oi.orderrefcode '+
         ' and oi.code = o2e.orderitemcode '+
         ' and o2e.estimateitemcode = e.code '+
         ' and e.planrefcode in (  SELECT pp.code FROM ENPLANWORK PP where pp.elementrefcode =  ' + IntToStr(ENServicesFromSideObjectObj.element.code) +
         ' union  select ppp.code from enplanwork ppp where ppp.servicesfsidecnnum = ' +chr(39) + ENServicesFromSideObjectObj.contractNumber + chr(39) +
         ' union  select s2p.planrefcode from  enservfromside2planwrk s2p where s2p.servfromsiderefcode = '+ IntToStr(ENServicesFromSideObjectObj.code)+' ) ) ' ;
        }
        RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilterObj, 0, -1);


        ////// СТРОКА ЗАЯВКИ
        if High(RQOrderItemList.list) > -1 then
           sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2
        else
           sgRQOrderItem.RowCount:=2;

         with sgRQOrderItem do
          for i:=0 to High(RQOrderItemList.list) do
            begin
              Application.ProcessMessages;
              if RQOrderItemList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderItemList.list[i].code)
              else
              Cells[0,i+1] := '';

              Cells[1,i+1] := IntToStr(i + 1);
              Cells[2,i+1] := RQOrderItemList.list[i].ddsCodesTxtCode;

              //AddCheckBox(3, i+1, false, false);

              Cells[3,i+1] :=  RQOrderItemList.list[i].materialName + ' (код ДК: ' + RQOrderItemList.list[i].materialIdentId + ')';
              Cells[4,i+1] :=  RQOrderItemList.list[i].measurementName;

              //Cells[5,i+1] := RQOrderItemList.list[i].materialNameTxt;
              //Cells[6,i+1] := RQOrderItemList.list[i].measurementNameTxt;


              if RQOrderItemList.list[i].countFact = nil then
                Cells[5,i+1] := ''
              else
                //Cells[5,i+1] := RQOrderItemList.list[i].countFact.DecimalString;
                Cells[5,i+1] := SeparateThousands(RQOrderItemList.list[i].countFact.DecimalString);

              Alignments[5, i + 1] := taRightJustify;

              if RQOrderItemList.list[i].priceWithNds = nil then
                Cells[6,i+1] := ''
              else
                //Cells[6,i+1] := RQOrderItemList.list[i].priceWithNds.DecimalString;
                Cells[6,i+1] := SeparateThousands(RQOrderItemList.list[i].priceWithNds.DecimalString);

              Alignments[6, i + 1] := taRightJustify;
              Colors[6, i + 1] := $0080FF80;

              /////
              //itemSum := 0;

              if RQOrderItemList.list[i].sumGen = nil then
                Cells[7,i+1] := ''
              else begin
                //Cells[7,i+1] := RQOrderItemList.list[i].sumGen.DecimalString;
                Cells[7,i+1] := SeparateThousands(RQOrderItemList.list[i].sumGen.DecimalString);
                {try
                  itemSum := StrToFloat(RQOrderItemList.list[i].sumGen.DecimalString);
                except
                  itemSum := 0;
                end;}
              end;

              Alignments[7, i + 1] := taRightJustify;

              //totalSum := totalSum + itemSum;
              /////


              if RQOrderItemList.list[i].deliveryTime = LOW_INT then
                 Cells[8, i+1] := ''
              else
                Cells[8, i+1] := IntToStr(RQOrderItemList.list[i].deliveryTime);


              if RQOrderItemList.list[i].plannedDatePays = nil then
                  Cells[9, i+1] := ''
              else
                  Cells[9, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDatePays.Year,RQOrderItemList.list[i].plannedDatePays.Month,RQOrderItemList.list[i].plannedDatePays.Day) );

              if RQOrderItemList.list[i].plannedDateDelivery = nil then
                  Cells[10, i+1] := ''
              else
                  Cells[10, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDateDelivery.Year,RQOrderItemList.list[i].plannedDateDelivery.Month,RQOrderItemList.list[i].plannedDateDelivery.Day) );

              {
              if RQOrderItemList.list[i].priceWithoutNds = nil then
                Cells[7,i+1] := ''
              else
                Cells[7,i+1] := RQOrderItemList.list[i].priceWithoutNds.DecimalString;
              if RQOrderItemList.list[i].nds = nil then
                Cells[8,i+1] := ''
              else
                Cells[8,i+1] := RQOrderItemList.list[i].nds.DecimalString;
              if RQOrderItemList.list[i].sumWithoutNds = nil then
                Cells[9,i+1] := ''
              else
                Cells[9,i+1] := RQOrderItemList.list[i].sumWithoutNds.DecimalString;
              if RQOrderItemList.list[i].sumNds = nil then
                Cells[10,i+1] := ''
              else
                Cells[10,i+1] := RQOrderItemList.list[i].sumNds.DecimalString;
              }

              if RQOrderItemList.list[i].countGen = nil then
                Cells[11,i+1] := ''
              else
                Cells[11,i+1] := RQOrderItemList.list[i].countGen.DecimalString;

              Cells[12,i+1] := RQOrderItemList.list[i].orgName;

              if RQOrderItemList.list[i].contractDate <> nil then
                Cells[13, i+1] := RQOrderItemList.list[i].contractNumber + ' від ' + DateToStr ( EncodeDate(RQOrderItemList.list[i].contractDate.Year,RQOrderItemList.list[i].contractDate.Month,RQOrderItemList.list[i].contractDate.Day) )
              else begin
                ///// 23.12.10
                // Разрешаем вводить руками (не выбирая из ФК)!
                //Cells[13, i+1] := '';
                Cells[13, i+1] := RQOrderItemList.list[i].contractNumber;
              end;


              Cells[14,i+1] := RQOrderItemList.list[i].commentGen;
              //Cells[8,i+1] := RQOrderItemList.list[i].userGen;

              //LastRow:=i+1;
              sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2;

          end;
       //ColCount:=ColCount+1;
       sgRQOrderItem.Row:=1;
      end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQOrderUpdateExecute(
  Sender: TObject);
  var 
  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderList: RQOrderShortList;

  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;

  RQOrderFilterObj : RQOrderFilter;
  RQOrderItemFilterObj : RQOrderItemFilter;
  i:Integer;
begin

  if PageControl1.ActivePage = tsRQOrder then
      begin
        ClearGrids([sgRQOrder, sgRQOrderItem]);
        SetGridHeaders(RQOrderHeaders, sgRQOrder.ColumnHeaders);
        SetGridHeaders(RQOrderItemHeaders, sgRQOrderItem.ColumnHeaders);

        TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
        TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

        if ENServicesFromSideObjectObj = nil then Exit;
        if ENServicesFromSideObjectObj.element = nil then Exit;
        if ENServicesFromSideObjectObj.element.code = LOW_INT then Exit;

        RQOrderFilterObj := RQOrderFilter.Create;
        SetNullXSProps(RQOrderFilterObj);
        SetNullIntProps(RQOrderFilterObj);
        RQOrderFilterObj.conditionSQL := ' rqorder.code in (select o.code from rqorder o , rqorderitem oi , rqorderitem2enestimttm o2e , enestimateitem e ' + 
         ' where o.code = oi.orderrefcode '+
         ' and oi.code = o2e.orderitemcode '+
         ' and o2e.estimateitemcode = e.code '+
         ' and e.planrefcode in ( select s2p.planrefcode from  enservfromside2planwrk s2p where s2p.servfromsiderefcode = '+ IntToStr(ENServicesFromSideObjectObj.code)+' ) ) ' ;

        RQOrderFilterObj.orderBySQL := ' rqorder.code desc  ';

        RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilterObj, 0, -1);

        LastCount:=High(RQOrderList.list);

        if LastCount > -1 then
           sgRQOrder.RowCount:=LastCount+2
        else
           sgRQOrder.RowCount:=2;

         with sgRQOrder do
          for i:=0 to LastCount do
            begin

              if RQOrderList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
              else
              Cells[0,i+1] := '';
              Cells[1,i+1] := RQOrderList.list[i].numberDoc;
              Cells[2,i+1] := RQOrderList.list[i].numberProject;
              if RQOrderList.list[i].orderPeriod = nil then
                Cells[3,i+1] := ''
              else
                //Cells[3,i+1] := XSDate2String(RQOrderList.list[i].orderPeriod);
                Cells[3,i+1] := MonthesNames[RQOrderList.list[i].orderPeriod.Month] + ' ' +
                                IntToStr(RQOrderList.list[i].orderPeriod.Year) + ' р.';

              if RQOrderList.list[i].dateGen = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDate2String(RQOrderList.list[i].dateGen);

              Cells[5, i + 1] := RQOrderList.list[i].departmentRefShortName;
              Cells[6, i + 1] := RQOrderList.list[i].rqOrderFormName;
              Cells[7, i + 1] := RQOrderList.list[i].rqOrderTypeName;
              Cells[8, i + 1] := RQOrderList.list[i].rqOrderResourceName;
              Cells[9, i + 1] := RQOrderList.list[i].budgetRefShortName;

              Colors[9, i + 1] := clYellow;

              if RQOrderList.list[i].sumGen <> nil then
                //Cells[10, i + 1] := RQOrderList.list[i].sumGen.DecimalString
                Cells[10, i + 1] := SeparateThousands(RQOrderList.list[i].sumGen.DecimalString)
              else
                Cells[10, i + 1] := '0.00';

              Alignments[10, i + 1] := taRightJustify;
              Colors[10, i + 1] := $0080FF80;

              Cells[11, i + 1] := RQOrderList.list[i].statusRefName;

              Cells[12, i + 1] := RQOrderList.list[i].userGen;
      {
              Application.ProcessMessages;
              if RQOrderList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
              else
              Cells[0,i+1] := '';
              Cells[1,i+1] := RQOrderList.list[i].numberDoc;
              Cells[2,i+1] := RQOrderList.list[i].numberProject;
              if RQOrderList.list[i].orderPeriod = nil then
                Cells[3,i+1] := ''
              else
                Cells[3,i+1] := XSDate2String(RQOrderList.list[i].orderPeriod);
              if RQOrderList.list[i].dateGen = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDate2String(RQOrderList.list[i].dateGen);
              Cells[5,i+1] := RQOrderList.list[i].userGen;
      }
              sgRQOrder.RowCount:=i+2;
            end;
         sgRQOrder.Row:=1;


         actRQOrderItemUpdateExecute(sender);

      end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQOrderViewExecute(
  Sender: TObject);
Var TempRQOrder: RQOrderControllerSoapPort;
    ObjCode : Integer;
begin
 TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
   on EConvertError do Exit;
  end;

  frmRQOrderEdit:=TfrmRQOrderEdit.Create(Application, dsView);
  try
    frmRQOrderEdit.RQOrderObj := TempRQOrder.getObject(ObjCode);
    frmRQOrderEdit.ShowModal;
  finally
    frmRQOrderEdit.Free;
    frmRQOrderEdit:=nil;
  end;
end;


procedure TfrmENServicesFromSideObjectConsolidEdit.actUnCreatePrihodExecute(
  Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    obj : RQFKOrder;
    ObjCode:Integer;
begin

   try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити складання накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  obj := TempRQFKOrder.getObject(ObjCode);

 if obj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
    TempRQFKOrder.unCreateActFromServicesFS(ObjCode);

    actRQFKOrderUpdateExecute(Sender);
end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actUnMoveToFKExecute(
  Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    obj : RQFKOrder;
    ObjCode: Integer;
    rio : THTTPRIO;
begin
   try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення у ФК накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQFKOrder := rio as RQFKOrderControllerSoapPort;
    obj := TempRQFKOrder.getObject(ObjCode);
    if (obj = nil) then Exit;

    if obj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA then
      TempRQFKOrder.unMovePrihodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then
      TempRQFKOrder.unMoveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT then
      TempRQFKOrder.unMoveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
      TempRQFKOrder.unMoveRashodOperative2Tranzit(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
      TempRQFKOrder.unMoveRashodMeasurementChange(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
      TempRQFKOrder.unMoveRashodE2E(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP then
      TempRQFKOrder.unMoveRashodInFKLoadMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA then
      TempRQFKOrder.unMoveRashodInFKLoadMNMA(obj.code)
    else
    /////
    if obj.kind.code = RQFKORDER_KIND_MBP then
      TempRQFKOrder.unMoveRashodInFKMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_MNMA then
      TempRQFKOrder.unMoveRashodInFKMNMA(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MNMA then
      TempRQFKOrder.unMoveRashodOutInFKMNMA(obj.code)
    /////
    else
    if obj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
      TempRQFKOrder.unMoveRashodInFK(obj.code)
    else
    /////
    if obj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET then
      TempRQFKOrder.unMovePrihodBufetInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_BUFET then
      TempRQFKOrder.unMoveRashodBufetInFK(obj.code)
    /////

    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT then
      TempRQFKOrder.unMoveRashodReturnInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_GIFT then
      TempRQFKOrder.unMoveRashodGiftInFK(obj.code)

    else
    if obj.kind.code = RQFKORDER_KIND_OS_EXPL then
      TempRQFKOrder.unMoveOSExplInFK(obj.code)

    else
    if obj.kind.code = RQFKORDER_KIND_OS_MOVEMENT then
      TempRQFKOrder.unMoveOSMovementInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE then
      TempRQFKOrder.unMoveRashodToStorageInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_ZONE_CHANGING then
      TempRQFKOrder.unMoveZoneChangingInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_OUT_FUEL then
      TempRQFKOrder.unMoveOutFuelInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_OUT then
      TempRQFKOrder.unMoveAvarOutInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_IN then
      TempRQFKOrder.unMoveAvarInInFK(obj.code)
    else
      ShowMessage('Ошибка в типе Ордера ...');

     actRQFKOrderUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actUpdateBillExecute(
  Sender: TObject);
  var
  TempRQBill : RQBillControllerSoapPort;
  billCode : Integer;
  RQBillList: RQBillShortList;
  RQBillFilterObj: RQBillFilter;
  state, selected : Boolean;
  i,j : Integer;
  strOrderItemsCodes :String;
begin
  if PageControl1.ActivePage = tsBill then
  begin

      for i := 1 to sgRQOrderItem.RowCount - 1 do
      begin
        sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
        if selected then break;
      end;

      strOrderItemsCodes := '';
      state := false;

      for i := 1 to sgRQOrderItem.RowCount - 1 do
      begin
        sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);
        if state then
          AddListPos(strOrderItemsCodes, sgRQOrderItem.Cells[0, i]);
      end;

      //totalSum := 0;
      FormatSettings.DecimalSeparator := '.';

      SetGridHeaders(RQBillHeaders, sgRQBill.ColumnHeaders);

      for i:=1 to sgRQBill.RowCount-1 do
        for j:=0 to sgRQBill.ColCount-1 do
          sgRQBill.Cells[j,i]:='';
      sgRQBill.RowCount := 2;

      RQBillFilterObj := RQBillFilter.Create;
      SetNullIntProps(RQBillFilterObj);
      SetNullXSProps(RQBillFilterObj);

      if (strOrderItemsCodes <> '') then
      RQBillFilterObj.conditionSQL :=
         'RQBILL.CODE in (select distinct bi.billrefcode from rqbillitem bi where bi.code in ( ' +
         ' select b2o.billitemrefcode from rqbillitem2orderitem b2o ' +
         ' where b2o.orderitemrefcode in (' + strOrderItemsCodes + ')))'
      else
      RQBillFilterObj.conditionSQL :=
       'rqbill.code in (select bi.billrefcode from rqbillitem2enestimattm bi2e , rqbillitem bi , enestimateitem e  ' +
        ' where bi2e.estimateitemcode=e.code '+
        ' and bi2e.billitemcode=bi.code '+
        ' and e.planrefcode in ( select s2p.planrefcode from  enservfromside2planwrk s2p ' + 
        ' where s2p.servfromsiderefcode = '+ IntToStr(ENServicesFromSideObjectObj.code)+' ) ) ';

      TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;

      RQBillList := TempRQBill.getScrollableFilteredList(RQBillFilterObj, 0, -1);

      if High(RQBillList.list) > -1 then
         sgRQBill.RowCount := High(RQBillList.list) + 2
      else
         sgRQBill.RowCount := 2;



      with sgRQBill do
        for i := 0 to High(RQBillList.list) do
        begin
          Application.ProcessMessages;

          if RQBillList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQBillList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := RQBillList.list[i].numberDoc;
          Cells[2,i+1] := RQBillList.list[i].numberProject;
          if RQBillList.list[i].dateGen = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := XSDate2String(RQBillList.list[i].dateGen);


          if RQBillList.list[i].sumGen = nil then
            Cells[4,i+1] := ''
          else begin
            Cells[4,i+1] := SeparateThousands(RQBillList.list[i].sumGen.DecimalString);
          end;

         
          Alignments[4, i + 1] := taRightJustify;
          Colors[4, i + 1] := $0080FF80;

          Cells[5,i+1] := RQBillList.list[i].orgName;

          if RQBillList.list[i].contractDate <> nil then
            Cells[6, i+1] := RQBillList.list[i].contractNumber + ' від ' + DateToStr(EncodeDate(RQBillList.list[i].contractDate.Year,RQBillList.list[i].contractDate.Month,RQBillList.list[i].contractDate.Day))
          else
            Cells[6, i+1] := '';

          Cells[7,i+1] := RQBillList.list[i].statusRefName;

          Cells[8,i+1] := RQBillList.list[i].state;

          Cells[9,i+1] := RQBillList.list[i].userGen;

          sgRQBill.RowCount := i + 2;
        end;

    sgRQBill.Row := 1;

    
  end;
  // END ---------------------- tsRQBills

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actUpdatePlanExecute(
  Sender: TObject);
var
LastCount, n,i : Integer;
ENPlanWorkList : ENPlanWorkShortList;
planFilter : ENPlanWorkFilter;
begin
    sgENPlanWork.Clear;
    SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);


    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    if ENServicesFromSideObjectObj = nil then Exit;
    if ENServicesFromSideObjectObj.element = nil then Exit;
    if ENServicesFromSideObjectObj.element.code = LOW_INT then Exit;

    //planfilter.elementRef:= ENElementRef.Create;
    // planfilter.elementRef.code:= ENServicesFromSideObjectObj.element.code;
    /// !!!!! после заполнения связки переделать фильтр по номеру договора услуги ENPLANWORK.servicesfsidecnnum т.к тормозит
    //planfilter.conditionSQL := ' (ENPLANWORK.elementrefcode = '+ IntToStr(ENServicesFromSideObjectObj.element.code)
    //+ ' or  ENPLANWORK.servicesfsidefinid =  ' + IntTOStr(ENServicesFromSideObjectObj.finDocID) +')' ;
    // planfilter.conditionSQL := ' ENPLANWORK.CODE in ( ' +
    planFilter.orderBySQL := ' code desc , monthgen desc ';



    ENPlanWorkList := Self.getPlansList(planFilter);
    if ENPlanWorkList = nil then Exit;



    LastCount := High(ENPlanWorkList.list);

    if LastCount > -1 then
      sgENPlanWork.RowCount := LastCount + 2
    else
      sgENPlanWork.RowCount := 2;

    with sgENPlanWork do
      for i := 0 to LastCount do
        begin
          Application.ProcessMessages;

          n := 0;

          if ENPlanWorkList.list[i].code <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code)
          else
            Cells[n,i+1] := '';
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
          inc(n);

          if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
            //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
            Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].dateStart = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
          inc(n);


          Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
          inc(n);

          Cells[n,i+1] := '';

          //if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
          if ENPlanWorkList.list[i].yearOriginal > 0 then
          begin
            //if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
            if ENPlanWorkList.list[i].monthOriginal > 0 then
              Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                              IntToStr(ENPlanWorkList.list[i].yearOriginal);
          end
          else
            Cells[n,i+1] := '';
          inc(n);
          /////

          Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
          inc(n);

          if ENPlanWorkList.list[i].dateEdit = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
          inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].info_oz1;
            Cells[n,i+1] := ENPlanWorkList.list[i].info_oz2;
            Cells[n,i+1] := ENPlanWorkList.list[i].info_dfdocdecree;
          inc(n);


          //Objects[0,i+1] := ENPlanWorkShort.Create;
          //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

          //LastRow := i + 1;
          sgENPlanWork.RowCount := i + 2; //LastRow + 1;
        end;
     //ColCount:=ColCount+1;
     sgENPlanWork.Row := 1;

     //sgENPlanWorkClick(Sender);
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPayUpdateExecute(
  Sender: TObject);
var
TempRQPayDocItem : RQPayDocItemControllerSoapPort;
RQPayDocItemList : RQPayDocItemShortList;
RQPayDocItemFilterObj : RQPayDocItemFilter;
TempRQBill: RQBillControllerSoapPort;
billCode , i : Integer;
begin
  inherited;

  TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
   try
     billCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
   except
   on EConvertError do Exit;
  end;
        ClearGrids([sgRQPayDocItem]);
        SetGridHeaders(RQPayDocItemHeaders, sgRQPayDocItem.ColumnHeaders);

        TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;

        RQPayDocItemFilterObj := RQPayDocItemFilter.Create;
        SetNullIntProps(RQPayDocItemFilterObj);
        SetNullXSProps(RQPayDocItemFilterObj);
        RQPayDocItemFilterObj.conditionSQL := 'rqpaydocitem.code in '
                    +'(select p2b.paydocitemcode from rqpaydocitem2billitem p2b '
                    +'  where p2b.billitemcode in (select bi.code from rqbillitem bi '
                    +'  where bi.billrefcode = ' + IntToStr(billCode) + '))';
        RQPayDocItemList := TempRQPayDocItem.getScrollableFilteredList(RQPayDocItemFilterObj, 0, -1);


        ////// СТРОКИ
        if High(RQPayDocItemList.list) > -1 then
           sgRQPayDocItem.RowCount:=High(RQPayDocItemList.list)+2
        else
           sgRQPayDocItem.RowCount:=2;

        with sgRQPayDocItem do
          for i:=0 to High(RQPayDocItemList.list) do
            begin
              Application.ProcessMessages;

            if RQPayDocItemList.list[i].billItemSumWithNds.DecimalString = RQPayDocItemList.list[i].summaFact.DecimalString then
               sgRQPayDocItem.RowColor[i + 1] := clYellow;

              if RQPayDocItemList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQPayDocItemList.list[i].code)
              else
              Cells[0,i+1] := '';

              Cells[1,i+1] :=  RQPayDocItemList.list[i].payDocRefNumberGen;

              if RQPayDocItemList.list[i].payDocRefDateGen = nil then
                Cells[2,i+1] := ''
              else
                Cells[2,i+1] := XSDate2String(RQPayDocItemList.list[i].payDocRefDateGen);

              Cells[3,i+1] :=  RQPayDocItemList.list[i].payDocRefPayOrder;
              Cells[4,i+1] :=  RQPayDocItemList.list[i].materialName;
              Cells[5,i+1] :=  RQPayDocItemList.list[i].measurementName;

              if RQPayDocItemList.list[i].countFact = nil then
                Cells[6,i+1] := ''
              else
                Cells[6,i+1] := SeparateThousands(RQPayDocItemList.list[i].countFact.DecimalString);

              if RQPayDocItemList.list[i].billItemSummaGen = nil then
                Cells[7,i+1] := ''
              else
                Cells[7,i+1] := RQPayDocItemList.list[i].billItemSummaGen.DecimalString;

              if RQPayDocItemList.list[i].billItemSumWithNds = nil then
                Cells[8,i+1] := ''
              else
                Cells[8,i+1] := RQPayDocItemList.list[i].billItemSumWithNds.DecimalString;

              if RQPayDocItemList.list[i].summaFact = nil then
                Cells[9,i+1] := ''
              else
                Cells[9,i+1] := RQPayDocItemList.list[i].summaFact.DecimalString;

              sgRQPayDocItem.RowCount:=High(RQPayDocItemList.list)+2;
          end;
       sgRQPayDocItem.Row:=1;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanCopyPlanExecute(
  Sender: TObject);
var objCode: Integer;
    condition: String;
    FilterObject : ENPlanWorkFilter;
begin
  // Пока даем копировать только при вызове списка планов из главной формы, а не во всяких диалоговых формах
  {if FormMode <> fmChild then Exit;}

  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  frmENPlanWorkCopyEdit := TfrmENPlanWorkCopyEdit.Create(Application, dsInsert);
  try
    frmENPlanWorkCopyEdit.oldPlanCode := objCode;

    if frmENPlanWorkCopyEdit.ShowModal = mrOk then
    begin

      // Откроем только что добавленный план сразу на редактирование
      if frmENPlanWorkCopyEdit.newPlanCode <> LOW_INT then
      begin
        {FilterObject.Free;
        FilterObject := nil;}

        ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
        SetNullIntProps(ENPlanWorkFilterObj);
        SetNullXSProps(ENPlanWorkFilterObj);

        ENPlanWorkFilterObj.code := frmENPlanWorkCopyEdit.newPlanCode;

        ///// А надо ли это?? Пока оставим
        FilterObject := ENPlanWorkFilter.Create;
        {if outerCondition <> '' then
        begin
          condition := ENPlanWorkFilterObj.conditionSQL;
          AddCondition(condition, outerCondition);
          ENPlanWorkFilterObj.conditionSQL := condition;
        end;}
        ////
        FilterObject := ENPlanWorkFilterObj;

        {isFiltered := True;}
        actUpdatePlanExecute(Sender);

        ENPlanWorkFilterObj := nil;
        sgENPlanWork.Row := 1;

        
        actPlanEditExecute(actPlanCopyPlan);

        Exit;
      end; 


      actUpdatePlanExecute(Sender);

    end; 

  finally
    frmENPlanWorkCopyEdit.Free;
    frmENPlanWorkCopyEdit := nil;
  end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanDeleteExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
  ObjCode, eType : Integer;
  tPlan : ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;


  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (План робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

      TempENPlanWork.remove(ObjCode);
      actUpdatePlanExecute(Sender);
      sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanEditExecute(
  Sender: TObject);
var
  ObjCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  act : ENAct;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
    Exit;

  if (tPlan.kind.code = ENPLANWORKKIND_FACT) then
    begin
      act := DMReports.getActByPlan(ObjCode);
      if (act.code <> LOW_INT) then
        begin
          Application.MessageBox(PChar('Цей факт включено до Акту!'),
            PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;
    end;

  //ShowMessage(ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName);
  //if Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
    begin
      try
        TempENPlanWork.editPreConfirm(tPlan.code);
      except
        Application.MessageBox(
          PChar('Цей план можуть коригувати тільки у ХОЕ!'),
          PChar('Увага'), MB_ICONWARNING);
        Exit;
      end;
    end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD,
    ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  //and not (tPlan.kind.code in [ENPLANWORKKIND_CURRENT])
  then
    begin
      Application.MessageBox(PChar('План затверджений !'),
        PChar('Увага'), MB_ICONWARNING);
      Exit;
    end;

   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);

  try


    if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT)
    and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
      frmENPlanWorkEdit.isTransport := true;

    if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
      frmENPlanWorkEdit.isSiz := true;

    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(
        StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
    except
      on EConvertError do Exit;
    end;


    if frmENPlanWorkEdit.ShowModal = mrOk then
      begin
        //TempENPlanWork.save(ENPlanWorkObj);
        //UpdateGrid(Sender);

        if sgENPlanWork.RowCount > 100 then
          sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
        else
          sgENPlanWork.RowCount:= 2;

          ColCount := ColCount - 99;

          actUpdatePlanExecute(Sender);

      end;
        sgENPlanWork.Row := sgENPlanWork.RowCount - 1;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanFinishPlanWorkExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code = ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('Цей план вже знаходиться в статусі "Роботи завершені"!'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести план у статус "Роботи завершені" ?' + #13#10 +
                                  'Зверніть увагу, що весь Транзит з цього плану буде автоматично переведений в Опер. запас!'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.finishPlanWork(tPlan.code);

    Application.MessageBox(PChar('План переведено у статус "Роботи завершені"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    actUpdatePlanExecute(Sender);
  end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanMoveExecute(
  Sender: TObject);
Var
  TempPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
  objCode : Integer;
  plan : ENPlanWork;
begin
 

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
  end;

  plan := DMReports.getPlanByCode(objCode);
  if plan = nil then Exit;

  // переносить можно ТОЛЬКО текущие НЕУТВЕРЖДЕННЫЕ (без НПЗ)
  if not ((plan.kind.code = ENPLANWORKKIND_CURRENT) and ((plan.status.code = ENPLANWORKSTATUS_GOOD) or (plan.status.code = ENPLANWORKSTATUS_LOCKED))) then
//  if  not ( plan.status.code in [ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED]) then
  begin
      Application.MessageBox(PChar('переносить можно ТОЛЬКО текущие планы (без НПЗ) !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  ENPlanWorkMoveHistoryObj := ENPlanWorkMoveHistory.Create;
  SetNullIntProps(ENPlanWorkMoveHistoryObj);
  SetNullXSProps(ENPlanWorkMoveHistoryObj);
  ENPlanWorkMoveHistoryObj.planRef := ENPlanWorkRef.Create;
  ENPlanWorkMoveHistoryObj.planRef.code := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  ENPlanWorkMoveHistoryObj.reason := ENPlanWorkMoveReason.Create;

  frmENPlanWorkMoveHistoryEdit:=TfrmENPlanWorkMoveHistoryEdit.Create(Application, dsInsert);
  try
    frmENPlanWorkMoveHistoryEdit.ShowModal;
    actUpdatePlanExecute(Sender);
  finally
    frmENPlanWorkMoveHistoryEdit.Free;
    frmENPlanWorkMoveHistoryEdit:=nil;
  end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanSaveAddInfoExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;

  ObjCode: Integer;
  
  ///// 05.08.10 ВРЕМЕННО !!!
  TempUser: UserControllerSoapPort;
  UserObj: User;
  allowEdit: Boolean;
  /////

begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkAddInfoEdit:=TfrmENPlanWorkAddInfoEdit.Create(Application, dsEdit);
  frmENPlanWorkAddInfoEdit.Caption := 'Зміна дат виконання';
  try
    ///// 05.08.10 ВРЕМЕННО !!!
    allowEdit := false;
    
    if (tPlan.departmentRef.code = 15) or (tPlan.departmentRef.code = 16) then
    begin
      TempUser := HTTPRIOAuth as UserControllerSoapPort;
      UserObj := TempUser.getCurrent;
      if ((tPlan.departmentRef.code = 15) and (UserObj.domain = 'root.gor')) or
         ((tPlan.departmentRef.code = 16) and (UserObj.domain = 'root.kal')) then
        allowEdit := true;
    end;

     if tPlan.kind.code = ENPLANWORKKIND_NPZ then
     begin
        ///// 05.08.10 ВРЕМЕННО !!!
        if not allowEdit then
        begin
        /////
          if (tPlan.finExecutor <> nil) then
          begin
              if (tPlan.finExecutor.code > LOW_INT) then
              begin
                  ShowMessage('На цьому плані вже є виконавець ...');
                  exit;
              end;
          end
          else
          begin
                  ShowMessage('На цьому плані вже є виконавець ...');
                  exit;
          end;
        /////
        end;
        /////
        frmENPlanWorkAddInfoEdit.DisableControls( [frmENPlanWorkAddInfoEdit.edtDateStart, frmENPlanWorkAddInfoEdit.edtDateFinal]);
     end;

    


     try
       frmENPlanWorkAddInfoEdit.planObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    if frmENPlanWorkAddInfoEdit.ShowModal= mrOk then
      begin
       

          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;

            ColCount := ColCount - 99;

            actUpdatePlanExecute(Sender);
            
      end;
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  finally
    frmENPlanWorkAddInfoEdit.Free;
    frmENPlanWorkAddInfoEdit := nil;
  end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanSaveFinexecutDepartmentExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;

  ObjCode: Integer;
  
  ///// 05.08.10 ВРЕМЕННО !!!
  TempUser: UserControllerSoapPort;
  UserObj: User;
  allowEdit: Boolean;
  /////

begin


  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  //tPlan := DMReports.getPlanByCode( StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;


  frmENPlanWorkAddInfoEdit:=TfrmENPlanWorkAddInfoEdit.Create(Application, dsEdit);
  frmENPlanWorkAddInfoEdit.Caption := 'Зміна виконавця робіт';
  frmENPlanWorkAddInfoEdit.HideControls( [frmENPlanWorkAddInfoEdit.edtDateStart, frmENPlanWorkAddInfoEdit.edtDateFinal ,
                                             frmENPlanWorkAddInfoEdit.lblDateStart  , frmENPlanWorkAddInfoEdit.lblDateFinal , frmENPlanWorkAddInfoEdit.gbPlanMOL]);
  frmENPlanWorkAddInfoEdit.isChangeExecutorDepartment:= True;
  frmENPlanWorkAddInfoEdit.gbPlanMOL.Visible := False;

  try
    ///// 05.08.10 ВРЕМЕННО !!!
    allowEdit := false;

    if (tPlan.departmentRef.code = 15) or (tPlan.departmentRef.code = 16) then
    begin
      TempUser := HTTPRIOAuth as UserControllerSoapPort;
      UserObj := TempUser.getCurrent;
      if ((tPlan.departmentRef.code = 15) and (UserObj.domain = 'root.gor')) or
         ((tPlan.departmentRef.code = 16) and (UserObj.domain = 'root.kal')) then
        allowEdit := true;
    end;
    /////


     try
       frmENPlanWorkAddInfoEdit.planObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    if frmENPlanWorkAddInfoEdit.ShowModal= mrOk then
      begin


          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;

            ColCount := ColCount - 99;
            actUpdatePlanExecute(Sender);

      end;

           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  finally
    frmENPlanWorkAddInfoEdit.Free;
    frmENPlanWorkAddInfoEdit := nil;
  end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanUndoFinishPlanWorkExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  //tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]));
  tPlan := DMReports.getPlanByCode(ObjCode);
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code <> ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('Цей план НЕ знаходиться в статусі "Роботи завершені"!'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ВІДМІНИТИ переведення плану в статус "Роботи завершені" ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.undoFinishPlanWork(tPlan.code);

    Application.MessageBox(PChar('План повернено у статус "Затверджений"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    actUpdatePlanExecute(Sender);
  end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actPlanViewExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode : Integer;
TempENServicesObject: ENServicesObjectControllerSoapPort;

TempENTechCond2PlanWork: ENTechCond2PlanWorkControllerSoapPort;
TempENTechCond2PlanWorkList : ENTechCond2PlanWorkShortList;
TempENTechCond2PlanWorkFilter : ENTechCond2PlanWorkFilter;
TempENTechCondCode : Integer;
servicesObjectCode : Integer;
ENServicesConnectionObj : ENServicesObject;

begin

      try
        objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
      except
        on EConvertError do Exit;
      end;


  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
      exit;
  end;



   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;



   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

    //SUPP-4339
//    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
//
//    TempENTechCond2PlanWorkFilter.planRef := ENPlanWorkRef.Create;
//    TempENTechCond2PlanWorkFilter.planRef.code :=  objCode;
//    TempENTechCond2PlanWorkList := TempENTechCond2PlanWork.getScrollableFilteredList(TempENTechCond2PlanWorkFilter,0,-1);
//    if TempENTechCond2PlanWorkList.totalCount > 0 then
//     begin
//         TempENTechCondCode:= TempENTechCond2PlanWorkList.list[0].techConServicesRefCode;
//
//
//     end;

    ENServicesConnectionObj := DMReports.getServicesObjectByPlanCodeElementAndEnTechCond(objCode);
    if ENServicesConnectionObj <> nil then
    begin

      frmENPlanWorkEdit.isPriconnection := (
        ENServicesConnectionObj.contractTypeRef.code =  ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;
    end;


   try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
     except
       on EConvertError do Exit;
     end;

     frmENPlanWorkEdit.ShowModal;

   finally
     frmENPlanWorkEdit.Free;
     frmENPlanWorkEdit:=nil;
   end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actViewBillExecute(
  Sender: TObject);
 var
  TempRQBill : RQBillControllerSoapPort;
  billCode : Integer;
begin
  // -------------- tsRQBill
  if PageControl1.ActivePage = tsBill then
  begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    try
      billCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
    except
      on EConvertError do Exit;
    end;

    frmRQBillEdit := TfrmRQBillEdit.Create(Application, dsView);
    try
      frmRQBillEdit.RQBillObj := TempRQBill.getObject(billCode);
      frmRQBillEdit.ShowModal;
    finally
      frmRQBillEdit.Free;
      frmRQBillEdit:=nil;
    end;
  end;
  // END -------------- tsRQBill

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.actRQFKOrderViewExecute(
  Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  frmRQFKOrderEditView : TfrmRQFKOrderEdit;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEditView:=TfrmRQFKOrderEdit.Create(Application, dsView);

  try
    try
      frmRQFKOrderEditView.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmRQFKOrderEditView.ShowModal = mrOk)
          and (frmRQFKOrderEditView.RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
      begin
        actRQFKOrderUpdateExecute(Sender);
      end;

  finally
    frmRQFKOrderEditView.Free;
    frmRQFKOrderEditView:=nil;
  end;
end;


procedure TfrmENServicesFromSideObjectConsolidEdit.actViewPlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode : Integer;
TempENServicesObject: ENServicesObjectControllerSoapPort;

TempENTechCond2PlanWork: ENTechCond2PlanWorkControllerSoapPort;
TempENTechCond2PlanWorkList : ENTechCond2PlanWorkShortList;
TempENTechCond2PlanWorkFilter : ENTechCond2PlanWorkFilter;
TempENTechCondCode : Integer;
servicesObjectCode : Integer;
ENServicesConnectionObj : ENServicesObject;

begin

      try
        objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
      except
        on EConvertError do Exit;
      end;


  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
      exit;
  end;



   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;



   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

    //SUPP-4339
//    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
//
//    TempENTechCond2PlanWorkFilter.planRef := ENPlanWorkRef.Create;
//    TempENTechCond2PlanWorkFilter.planRef.code :=  objCode;
//    TempENTechCond2PlanWorkList := TempENTechCond2PlanWork.getScrollableFilteredList(TempENTechCond2PlanWorkFilter,0,-1);
//    if TempENTechCond2PlanWorkList.totalCount > 0 then
//     begin
//         TempENTechCondCode:= TempENTechCond2PlanWorkList.list[0].techConServicesRefCode;
//
//
//     end;

    ENServicesConnectionObj := DMReports.getServicesObjectByPlanCodeElementAndEnTechCond(objCode);
    if ENServicesConnectionObj <> nil then
    begin
      
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesConnectionObj.contractTypeRef.code =  ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;
    end;


   try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
     except
       on EConvertError do Exit;
     end;

     frmENPlanWorkEdit.ShowModal;

   finally
     frmENPlanWorkEdit.Free;
     frmENPlanWorkEdit:=nil;
   end;

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtCommentGen]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;


     ENServicesFromSideObjectObj.contractNumber := edtContractNumber.Text; 

     if edtcontractDate.checked then
     begin 
       if ENServicesFromSideObjectObj.contractDate = nil then
          ENServicesFromSideObjectObj.contractDate := TXSDate.Create;
       ENServicesFromSideObjectObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENServicesFromSideObjectObj.contractDate := nil;

     ENServicesFromSideObjectObj.name := edtName.Text; 

     ENServicesFromSideObjectObj.partnerCode := edtPartnerCode.Text; 

     ENServicesFromSideObjectObj.finDocCode := edtFinDocCode.Text; 

     if ( edtFinDocID.Text <> '' ) then
       ENServicesFromSideObjectObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENServicesFromSideObjectObj.finDocID := Low(Integer) ;

     ENServicesFromSideObjectObj.commentGen := edtCommentGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENServicesFromSideObjectObj.dateEdit = nil then
          ENServicesFromSideObjectObj.dateEdit := TXSDate.Create;
       ENServicesFromSideObjectObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENServicesFromSideObjectObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      ENServicesFromSideObjectObj.code:=low(Integer);
      TempENServicesFromSideObject.add(ENServicesFromSideObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesFromSideObject.save(ENServicesFromSideObjectObj);
    end;
  end;
end;


procedure TfrmENServicesFromSideObjectConsolidEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesFromSideObjectObj.department = nil then ENServicesFromSideObjectObj.department := ENDepartment.Create();
               //ENServicesFromSideObjectObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
//               /edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesFromSideObjectConsolidEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesFromSideObjectObj.element = nil then ENServicesFromSideObjectObj.element := ENElement.Create();
               ENServicesFromSideObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesFromSideObjectConsolidEdit.sgENPlanWorkDblClick(
  Sender: TObject);
begin
  inherited;
   actViewPlanExecute(sender);
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.sgRQBillClick(
  Sender: TObject);
begin
  inherited;
   actPayUpdateExecute(Sender);
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.sgRQBillDblClick(
  Sender: TObject);
var
  TempRQBill : RQBillControllerSoapPort;
  billCode : Integer;
begin
  // -------------- tsRQBill
  if PageControl1.ActivePage = tsBill then
  begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    try
      billCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
    except
      on EConvertError do Exit;
    end;

    frmRQBillEdit := TfrmRQBillEdit.Create(Application, dsView);
    try
      frmRQBillEdit.RQBillObj := TempRQBill.getObject(billCode);
      frmRQBillEdit.ShowModal;
    finally
      frmRQBillEdit.Free;
      frmRQBillEdit:=nil;
    end;
  end;
  // END -------------- tsRQBill

end;

procedure TfrmENServicesFromSideObjectConsolidEdit.sgRQFKOrderClick(
  Sender: TObject);
begin
  inherited;
   actRQFKOrderItemUpdateExecute(Sender);
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.sgRQOrderClick(
  Sender: TObject);
begin
  inherited;
    actRQOrderItemUpdateExecute(sender);
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.sgRQOrderDblClick(
  Sender: TObject);
begin
  inherited;
    actRQOrderViewExecute(Sender);
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.sgRQOrderItemDblClick(
  Sender: TObject);
  var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  TempRQOrder: RQOrderControllerSoapPort;
  ObjCode:Integer;
  RQOrderObj:RQOrder;
begin
  inherited;

   TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
   on EConvertError do Exit;
  end;


   RQOrderObj := TempRQOrder.getObject(ObjCode);

   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
       try
         RQOrderItemSObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
       except
        on EConvertError do Exit;
       end;

      frmRQOrderItemServicesEdit := TfrmRQOrderItemServicesEdit.Create(Application, dsView);
      frmRQOrderItemServicesEdit.Temporder := RQOrderObj;
       try
        frmRQOrderItemServicesEdit.orderKindCode := RQOrderObj.kindRef.code;
        frmRQOrderItemServicesEdit.ShowModal;
       finally
        frmRQOrderItemServicesEdit.Free;
        frmRQOrderItemServicesEdit:=nil
       end;
end;

procedure TfrmENServicesFromSideObjectConsolidEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   //f.conditionSQL := 'a.io_flag = ''B'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';
   f.conditionSQL := 'a.io_flag = ''B''';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                edtContractDate.Checked := true;
                edtName.Text := GetReturnValue(sgFINServicesObject, 3);
                edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
                edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
                edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                DisableControls([edtName, edtCommentGen]);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


function TfrmENServicesFromSideObjectConsolidEdit.getPlansList(filter : ENPlanWorkFilter) : ENPlanWorkShortList;
var
  strServicesFromSidePlanCodes: String;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  list : ENPlanWorkShortList;

begin
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  if not Assigned(filter) then begin
    filter := ENPlanWorkFilter.Create;
    SetNullIntProps(filter);
    SetNullXSProps(filter);
  end;

    list := nil;

    strServicesFromSidePlanCodes := '-1';
    if ENServicesFromSideObjectObj <> nil then
      if ENServicesFromSideObjectObj.code <> LOW_INT then
         strServicesFromSidePlanCodes := DMReports.getStrCodePlanFromENServicesFromSide2enplanwork(ENServicesFromSideObjectObj.code);

    if strServicesFromSidePlanCodes <> '-1' then
     begin
       if  filter.conditionSQL = '' then
       filter.conditionSQL := 'enplanwork.code in (' + strServicesFromSidePlanCodes + ')'
       else
       filter.conditionSQL := filter.conditionSQL + ' and enplanwork.code in (' + strServicesFromSidePlanCodes + ')'
     end;

     if ((filter.conditionSQL = '') and (filter.code = LOW_INT) and (filter.dateStart = nil )
                                    and (filter.dateFinal = nil) and (filter.servicesFSideFinId = LOW_INT)
                                    and (filter.servicesFSideCnNum = '' )  ) then begin
           Result := nil;
           exit;
     end;



    list := TempENPlanWork.getScrollableFilteredListServicesFromSide(filter, 0, -1);

    Result := list;
end;


procedure TfrmENServicesFromSideObjectConsolidEdit.miAddPlanClick(
  Sender: TObject);
var
  TempEnPlanwork: ENPlanWorkControllerSoapPort;
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;


  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  tcFilter , tcServicesFilter: ENTechConditionsServicesFilter;
  tcList: ENTechConditionsServicesShortList;

  frmShowENServicesConnection : TfrmENServicesConnectionShow;
	servicesFilter : ENServicesObjectFilter;
	servicesObjectCode : Integer;
  tcServicesArr: ENTechConditionsServicesController.ArrayOfInteger;

  TempServicesObject: ENServicesObjectControllerSoapPort;
  ENServicesConnectionObj: ENServicesObject;

  f, tmpF : ENElementFilter;
  TempENElement: ENElementControllerSoapPort;
begin

  servicesFilter := ENServicesObjectFilter.Create;
	SetNullXSProps(servicesFilter);
	SetNullIntProps(servicesFilter);
	servicesFilter.contractKindRef := ENServicesContractKindRef.Create;
	servicesFilter.contractKindRef.code := ENConsts.SERVICES_CONTRACT_KIND_SERVICES;
  servicesFilter.contractTypeRef := ENServicesContractTypeRef.Create;
  servicesFilter.contractTypeRef.code :=  ENConsts.ENSERVICESOBJECTTYPE_CONNECTION;
	frmShowENServicesConnection := TfrmENServicesConnectionShow.Create(Application,fmNormal, servicesFilter);

  DisableActions([frmShowENServicesConnection.actNoFilter]);
    try
      
            TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

            frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsInsert);

            try

              frmENPlanWorkEdit.isServicesFromSide := True;
              frmENPlanWorkEdit.ServicesFromSideCode := ENServicesFromSideObjectObj.code;
              frmENPlanWorkEdit.techCondServicesObjCode := LOW_INT;

              
              frmENPlanWorkEdit.ENPlanWorkObj := ENPlanWork.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.kind := ENPlanWorkKind.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.kind.code := ENPLANWORKKIND_CURRENT;
              frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT -1;
              frmENPlanWorkEdit.cbPlanWorkKind.Enabled := False;

//              frmENPlanWorkEdit.edtMonthGen.ItemIndex := -1;
//              frmENPlanWorkEdit.ENPlanWorkObj.monthGen := Low(Integer); 
//              
//              frmENPlanWorkEdit.ENPlanWorkObj.dateStart := TXSDate.Create;
//              frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(SysUtils.Date + 1));
//              frmENPlanWorkEdit.ENPlanWorkObj.dateFinal := TXSDate.Create;
//              frmENPlanWorkEdit.ENPlanWorkObj.dateFinal.XSToNative(GetXSDate(SysUtils.Date + 1));

//              frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
//              frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := ENServicesConnectionObj.department.code; //ENTechConditionsServicesObj.department.code;
//              frmENPlanWorkEdit.edtDepartment.Text := ENServicesConnectionObj.department.name; //ENTechConditionsServicesObj.department.name;

//              frmENPlanWorkEdit.ENPlanWorkObj.budgetRef := ENDepartmentRef.Create;
//              frmENPlanWorkEdit.ENPlanWorkObj.budgetRef.code := ENBUDGET_VRTUVD;
//              frmENPlanWorkEdit.edtENBudgetName.Text := 'ВРТУВД';
//
//              frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create;
//              frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_VRTUVD;
//              frmENPlanWorkEdit.edtResponsibility.Text := 'ВРТУВД';

              frmENPlanWorkEdit.ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.formRef.code := ENPLANWORKFORM_NOPLANNED;
              frmENPlanWorkEdit.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_NOPLANNED - 1;


//              f := ENElementFilter.Create;
//              SetNullIntProps(f);
//              SetNullXSProps(f);
//              f.orderBySQL := 'typerefcode';
//              f.code := ENServicesFromSideObjectObj.element.code;

              //TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
              frmENPlanWorkEdit.ENPlanWorkObj.elementRef := ENElementRef.Create;
              frmENPlanWorkEdit.ENPlanWorkObj.elementRef.code := ENServicesFromSideObjectObj.element.code;
              frmENPlanWorkEdit.edtServicesFromSide.Text:= ENServicesFromSideObjectObj.contractNumber;
              frmENPlanWorkEdit.ENPlanWorkObj.servicesFSideCnNum := ENServicesFromSideObjectObj.contractNumber;
              frmENPlanWorkEdit.ENPlanWorkObj.servicesFSideFinId := ENServicesFromSideObjectObj.findocid;
              frmENPlanWorkEdit.edtENElementName.Text := ENServicesFromSideObjectObj.name;
              frmENPlanWorkEdit.edtInvNumber.Text := ENServicesFromSideObjectObj.contractNumber;



              if frmENPlanWorkEdit.ShowModal = mrOk then
              begin

                actUpdatePlanExecute(Sender);
              end;



            finally
            end;


        
    finally
          frmShowENServicesConnection.Free;
       end;


end;

function TfrmENServicesFromSideObjectConsolidEdit.getContragentsCount: Integer;
var
  TempENContragent: ENContragentControllerSoapPort;
  contragentsFilter: ENContragentFilter;
  contragentsArr: ENContragentController.ArrayOfInteger;
begin
  Result := 0;

  if ENTechConditionsServicesObj = nil then
    Exit;

  if ENTechConditionsServicesObj.code = LOW_INT then
    Exit;

  TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;

  contragentsFilter := ENContragentFilter.Create;
  SetNullIntProps(contragentsFilter);
  SetNullXSProps(contragentsFilter);

  contragentsFilter.techCondServicesRef := ENTechConditionsServicesRef.Create;
  contragentsFilter.techCondServicesRef.code := ENTechConditionsServicesObj.code; //techConditionsServicesCode;

  contragentsArr := TempENContragent.getScrollableFilteredCodeArray(contragentsFilter, 0, -1);

  Result := High(contragentsArr) + 1;
end;




procedure TfrmENServicesFromSideObjectConsolidEdit.PageControl1Change(
  Sender: TObject);
begin
  inherited;
     if PageControl1.ActivePage = tsPlans then
        actUpdatePlanExecute(Sender);
     if PageControl1.ActivePage = tsRQOrder then
        actRQOrderUpdateExecute(Sender);
     if PageControl1.ActivePage = tsBill then
     begin
        actUpdateBillExecute(Sender);
        actPayUpdateExecute(Sender);
     end;
     if PageControl1.ActivePage = tsRqFkOrder then
        actRQFKOrderUpdateExecute(Sender);
    
end;




end.
