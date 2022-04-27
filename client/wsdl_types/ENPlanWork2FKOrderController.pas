unit ENPlanWork2FKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
   ,RQFKOrderController 
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENPlanWork2FKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2FKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2FKOrder = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;
  
{
  ENPlanWork2FKOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;
}

  ENPlanWork2FKOrderFilter = class(ENPlanWork2FKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWork2FKOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefYearOriginal : Integer; 
    FplanRefMonthOriginal : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
    FfkOrderRefCode : Integer; 
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefDateShipment : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefSumWithoutNds : TXSDecimal;
    FfkOrderRefSumNds : TXSDecimal;
    FfkOrderRefNdsPercent : Integer; 
    FfkOrderRefDateAdd : TXSDateTime;	
    FfkOrderRefUserAdd : WideString;
    FfkOrderRefDateEdit : TXSDateTime;	
    FfkOrderRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart; 
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefYearOriginal : Integer read FplanRefYearOriginal write FplanRefYearOriginal; 
    property planRefMonthOriginal : Integer read FplanRefMonthOriginal write FplanRefMonthOriginal; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber; 
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder; 
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber; 
    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode; 
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc; 
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen; 
    property fkOrderRefDateShipment : TXSDate read FfkOrderRefDateShipment write FfkOrderRefDateShipment; 
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode; 
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName; 
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode; 
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName; 
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode; 
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName; 
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber; 
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate; 
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO; 
    property fkOrderRefSumWithoutNds : TXSDecimal read FfkOrderRefSumWithoutNds write FfkOrderRefSumWithoutNds; 
    property fkOrderRefSumNds : TXSDecimal read FfkOrderRefSumNds write FfkOrderRefSumNds; 
    property fkOrderRefNdsPercent : Integer read FfkOrderRefNdsPercent write FfkOrderRefNdsPercent; 
    property fkOrderRefDateAdd : TXSDateTime read FfkOrderRefDateAdd write FfkOrderRefDateAdd; 
    property fkOrderRefUserAdd : WideString read FfkOrderRefUserAdd write FfkOrderRefUserAdd; 
    property fkOrderRefDateEdit : TXSDateTime read FfkOrderRefDateEdit write FfkOrderRefDateEdit; 
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen; 
  end;

  ArrayOfENPlanWork2FKOrderShort = array of ENPlanWork2FKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWork2FKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWork2FKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWork2FKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWork2FKOrderController/message/
  // soapAction: http://ksoe.org/ENPlanWork2FKOrderController/action/ENPlanWork2FKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWork2FKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWork2FKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWork2FKOrderControllerSoapPort = interface(IInvokable)
  ['{6fe46fe4-6fe4-6fe4-6fe4-6fe46fe46fe4}']
    function  add(const aENPlanWork2FKOrder: ENPlanWork2FKOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWork2FKOrder: ENPlanWork2FKOrder); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWork2FKOrder; stdcall;
    function  getList: ENPlanWork2FKOrderShortList; stdcall;
    function  getFilteredList(const aENPlanWork2FKOrderFilter: ENPlanWork2FKOrderFilter): ENPlanWork2FKOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2FKOrderShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWork2FKOrderFilter: ENPlanWork2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2FKOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2FKOrderShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWork2FKOrderFilter: ENPlanWork2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENPlanWork2FKOrder.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENPlanWork2FKOrderFilter.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENPlanWork2FKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPlanWork2FKOrderShort.Destroy;
  begin
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanRefDateWorkOrder) then
      planRefDateWorkOrder.Free;
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefDateShipment) then
      fkOrderRefDateShipment.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FfkOrderRefSumWithoutNds) then
      fkOrderRefSumWithoutNds.Free;
    if Assigned(FfkOrderRefSumNds) then
      fkOrderRefSumNds.Free;
    if Assigned(FfkOrderRefDateAdd) then
      fkOrderRefDateAdd.Free;
    if Assigned(FfkOrderRefDateEdit) then
      fkOrderRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENPlanWork2FKOrderShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENPlanWork2FKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2FKOrder');
  RemClassRegistry.RegisterXSClass(ENPlanWork2FKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2FKOrderRef');
  RemClassRegistry.RegisterXSClass(ENPlanWork2FKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2FKOrderFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWork2FKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2FKOrderShort');
  RemClassRegistry.RegisterXSClass(ENPlanWork2FKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2FKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWork2FKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWork2FKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWork2FKOrderControllerSoapPort), 'http://ksoe.org/ENPlanWork2FKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWork2FKOrderControllerSoapPort), 'http://ksoe.org/ENPlanWork2FKOrderController/action/ENPlanWork2FKOrderController.%operationName%');


end.
