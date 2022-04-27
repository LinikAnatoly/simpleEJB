unit ENPlanWork2ClassificationTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
   ,TKClassificationTypeController 
   ,ENConnectionWorkTypeController
   ,TKCalcKindController

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

  ENPlanWork2ClassificationType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2ClassificationTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2ClassificationType = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FmachineHours : TXSDecimal;
    FrelocationKm : TXSDecimal;
    FtransportationLoad : TXSDecimal;
    FisPrintOnKmOrMH : Integer; 
    FcostWorksContractor : TXSDecimal;
    FdateGen : TXSDate;
    FtimeStart : TXSDateTime;	
    FtimeFinal : TXSDateTime;	
    FcodeVirtualBrigade : Integer; 
    FisJobsByTime : Integer; 
    FisVisitClient : Integer;
    FproductionExpensesPercent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
//???
    FconnectionWorkTypeRef : ENConnectionWorkTypeRef;
//???
    FcalcKindRef : TKCalcKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property machineHours : TXSDecimal read FmachineHours write FmachineHours; 
    property relocationKm : TXSDecimal read FrelocationKm write FrelocationKm; 
    property transportationLoad : TXSDecimal read FtransportationLoad write FtransportationLoad; 
    property  isPrintOnKmOrMH : Integer read FisPrintOnKmOrMH write FisPrintOnKmOrMH; 
    property costWorksContractor : TXSDecimal read FcostWorksContractor write FcostWorksContractor; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property  codeVirtualBrigade : Integer read FcodeVirtualBrigade write FcodeVirtualBrigade; 
    property  isJobsByTime : Integer read FisJobsByTime write FisJobsByTime; 
    property  isVisitClient : Integer read FisVisitClient write FisVisitClient; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef; 
    property connectionWorkTypeRef : ENConnectionWorkTypeRef read FconnectionWorkTypeRef write FconnectionWorkTypeRef;
    property productionExpensesPercent : TXSDecimal read FproductionExpensesPercent write FproductionExpensesPercent;
    property calcKindRef : TKCalcKindRef read FcalcKindRef write FcalcKindRef;
  end;


  ENPlanWork2ClassificationTypeFilter = class(ENPlanWork2ClassificationType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWork2ClassificationTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;	
    FmachineHours : TXSDecimal;
    FrelocationKm : TXSDecimal;
    FtransportationLoad : TXSDecimal;
    FisPrintOnKmOrMH : Integer; 
    FcostWorksContractor : TXSDecimal;
    FdateGen : TXSDate;	
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FcodeVirtualBrigade : Integer; 
    FisJobsByTime : Integer; 
    FisVisitClient : Integer; 
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
    FclassificationTypeRefCode : Integer; 
    FclassificationTypeRefName : WideString;
    FclassificationTypeRefKod : WideString;
    FconnectionWorkTypeRefCode : Integer;
    FconnectionWorkTypeRefName : WideString;
    FproductionExpensesPercent : TXSDecimal;
	FcalcKindRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property machineHours : TXSDecimal read FmachineHours write FmachineHours; 
    property relocationKm : TXSDecimal read FrelocationKm write FrelocationKm; 
    property transportationLoad : TXSDecimal read FtransportationLoad write FtransportationLoad; 
    property  isPrintOnKmOrMH : Integer read FisPrintOnKmOrMH write FisPrintOnKmOrMH; 
    property costWorksContractor : TXSDecimal read FcostWorksContractor write FcostWorksContractor;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property  codeVirtualBrigade : Integer read FcodeVirtualBrigade write FcodeVirtualBrigade; 
    property  isJobsByTime : Integer read FisJobsByTime write FisJobsByTime; 
    property  isVisitClient : Integer read FisVisitClient write FisVisitClient; 

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
    property classificationTypeRefCode : Integer read FclassificationTypeRefCode write FclassificationTypeRefCode; 
    property classificationTypeRefName : WideString read FclassificationTypeRefName write FclassificationTypeRefName; 
    property classificationTypeRefKod : WideString read FclassificationTypeRefKod write FclassificationTypeRefKod; 
    property connectionWorkTypeRefCode : Integer read FconnectionWorkTypeRefCode write FconnectionWorkTypeRefCode;
    property connectionWorkTypeRefName : WideString read FconnectionWorkTypeRefName write FconnectionWorkTypeRefName;
    property productionExpensesPercent : TXSDecimal read FproductionExpensesPercent write FproductionExpensesPercent;
	property calcKindRefCode : Integer read FcalcKindRefCode write FcalcKindRefCode;
  end;

  ArrayOfENPlanWork2ClassificationTypeShort = array of ENPlanWork2ClassificationTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWork2ClassificationTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWork2ClassificationTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWork2ClassificationTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWork2ClassificationTypeController/message/
  // soapAction: http://ksoe.org/ENPlanWork2ClassificationTypeController/action/ENPlanWork2ClassificationTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWork2ClassificationTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWork2ClassificationTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWork2ClassificationTypeControllerSoapPort = interface(IInvokable)
  ['{8368896D-20A6-44BD-BDF4-B5ECF3A0F9D7}']
    function  add(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWork2ClassificationType; stdcall;
    function  getList: ENPlanWork2ClassificationTypeShortList; stdcall;
    function  getFilteredList(const aENPlanWork2ClassificationTypeFilter: ENPlanWork2ClassificationTypeFilter): ENPlanWork2ClassificationTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2ClassificationTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWork2ClassificationTypeFilter: ENPlanWork2ClassificationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2ClassificationTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2ClassificationTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWork2ClassificationTypeFilter: ENPlanWork2ClassificationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENPlanWork2ClassificationType.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmachineHours) then
      machineHours.Free;
    if Assigned(FrelocationKm) then
      relocationKm.Free;
    if Assigned(FtransportationLoad) then
      transportationLoad.Free;
    if Assigned(FcostWorksContractor) then
      costWorksContractor.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    if Assigned(FconnectionWorkTypeRef) then
      connectionWorkTypeRef.Free;
    if Assigned(FproductionExpensesPercent) then
      productionExpensesPercent.Free;
    if Assigned(FcalcKindRef) then
      FcalcKindRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENPlanWork2ClassificationTypeFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmachineHours) then
      machineHours.Free;
    if Assigned(FrelocationKm) then
      relocationKm.Free;
    if Assigned(FtransportationLoad) then
      transportationLoad.Free;
    if Assigned(FcostWorksContractor) then
      costWorksContractor.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    if Assigned(FconnectionWorkTypeRef) then
      connectionWorkTypeRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENPlanWork2ClassificationTypeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPlanWork2ClassificationTypeShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmachineHours) then
      machineHours.Free;
    if Assigned(FrelocationKm) then
      relocationKm.Free;
    if Assigned(FtransportationLoad) then
      transportationLoad.Free;
    if Assigned(FcostWorksContractor) then
      costWorksContractor.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
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
    if Assigned(FproductionExpensesPercent) then
      productionExpensesPercent.Free;
    inherited Destroy;
  end; 
  
  destructor ENPlanWork2ClassificationTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWork2ClassificationType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ClassificationType');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ClassificationTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ClassificationTypeRef');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ClassificationTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ClassificationTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ClassificationTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ClassificationTypeShort');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ClassificationTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ClassificationTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWork2ClassificationTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWork2ClassificationTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWork2ClassificationTypeControllerSoapPort), 'http://ksoe.org/ENPlanWork2ClassificationTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWork2ClassificationTypeControllerSoapPort), 'http://ksoe.org/ENPlanWork2ClassificationTypeController/action/ENPlanWork2ClassificationTypeController.%operationName%');


end.
