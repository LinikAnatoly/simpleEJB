unit ENPlanWorkItem2PlanWorkItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkItem2PlanWorkItemTypeController 
   ,ENPlanWorkItemController 
   //,ENPlanWorkItemController 
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

  ENPlanWorkItem2PlanWorkItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2PlanWorkItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2PlanWorkItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FtypeRef : ENPlanWorkItem2PlanWorkItemTypeRef;
//???
    FplanItemInRef : ENPlanWorkItemRef;
//???
    FplanItemOutRef : ENPlanWorkItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENPlanWorkItem2PlanWorkItemTypeRef read FtypeRef write FtypeRef; 
    property planItemInRef : ENPlanWorkItemRef read FplanItemInRef write FplanItemInRef; 
    property planItemOutRef : ENPlanWorkItemRef read FplanItemOutRef write FplanItemOutRef; 
  end;
  
{
  ENPlanWorkItem2PlanWorkItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FtypeRef : ENPlanWorkItem2PlanWorkItemTypeRef;
//???
    FplanItemInRef : ENPlanWorkItemRef;
//???
    FplanItemOutRef : ENPlanWorkItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENPlanWorkItem2PlanWorkItemTypeRef read FtypeRef write FtypeRef; 
    property planItemInRef : ENPlanWorkItemRef read FplanItemInRef write FplanItemInRef; 
    property planItemOutRef : ENPlanWorkItemRef read FplanItemOutRef write FplanItemOutRef; 
  end;
}

  ENPlanWorkItem2PlanWorkItemFilter = class(ENPlanWorkItem2PlanWorkItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWorkItem2PlanWorkItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FplanItemInRefCode : Integer; 
    FplanItemInRefCountGen : TXSDecimal;
    FplanItemInRefTimeGen : TXSDecimal;
    FplanItemInRefUserGen : WideString;
    FplanItemInRefDateEdit : TXSDate;
    FplanItemOutRefCode : Integer; 
    FplanItemOutRefCountGen : TXSDecimal;
    FplanItemOutRefTimeGen : TXSDecimal;
    FplanItemOutRefUserGen : WideString;
    FplanItemOutRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property planItemInRefCode : Integer read FplanItemInRefCode write FplanItemInRefCode; 
    property planItemInRefCountGen : TXSDecimal read FplanItemInRefCountGen write FplanItemInRefCountGen; 
    property planItemInRefTimeGen : TXSDecimal read FplanItemInRefTimeGen write FplanItemInRefTimeGen; 
    property planItemInRefUserGen : WideString read FplanItemInRefUserGen write FplanItemInRefUserGen; 
    property planItemInRefDateEdit : TXSDate read FplanItemInRefDateEdit write FplanItemInRefDateEdit; 
    property planItemOutRefCode : Integer read FplanItemOutRefCode write FplanItemOutRefCode; 
    property planItemOutRefCountGen : TXSDecimal read FplanItemOutRefCountGen write FplanItemOutRefCountGen; 
    property planItemOutRefTimeGen : TXSDecimal read FplanItemOutRefTimeGen write FplanItemOutRefTimeGen; 
    property planItemOutRefUserGen : WideString read FplanItemOutRefUserGen write FplanItemOutRefUserGen; 
    property planItemOutRefDateEdit : TXSDate read FplanItemOutRefDateEdit write FplanItemOutRefDateEdit; 
  end;

  ArrayOfENPlanWorkItem2PlanWorkItemShort = array of ENPlanWorkItem2PlanWorkItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkItem2PlanWorkItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkItem2PlanWorkItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkItem2PlanWorkItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkItem2PlanWorkItemController/message/
  // soapAction: http://ksoe.org/ENPlanWorkItem2PlanWorkItemController/action/ENPlanWorkItem2PlanWorkItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkItem2PlanWorkItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkItem2PlanWorkItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkItem2PlanWorkItemControllerSoapPort = interface(IInvokable)
  ['{9fac9fac-9fac-9fac-9fac-9fac9fac9fac}']
    function  add(const aENPlanWorkItem2PlanWorkItem: ENPlanWorkItem2PlanWorkItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkItem2PlanWorkItem: ENPlanWorkItem2PlanWorkItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkItem2PlanWorkItem; stdcall;
    function  getList: ENPlanWorkItem2PlanWorkItemShortList; stdcall;
    function  getFilteredList(const aENPlanWorkItem2PlanWorkItemFilter: ENPlanWorkItem2PlanWorkItemFilter): ENPlanWorkItem2PlanWorkItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2PlanWorkItemShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkItem2PlanWorkItemFilter: ENPlanWorkItem2PlanWorkItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2PlanWorkItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2PlanWorkItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWorkItem2PlanWorkItemFilter: ENPlanWorkItem2PlanWorkItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENPlanWorkItem2PlanWorkItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FplanItemInRef) then
      planItemInRef.Free;
    if Assigned(FplanItemOutRef) then
      planItemOutRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENPlanWorkItem2PlanWorkItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FplanItemInRef) then
      planItemInRef.Free;
    if Assigned(FplanItemOutRef) then
      planItemOutRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENPlanWorkItem2PlanWorkItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPlanWorkItem2PlanWorkItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FplanItemInRefCountGen) then
      planItemInRefCountGen.Free;
    if Assigned(FplanItemInRefTimeGen) then
      planItemInRefTimeGen.Free;
    if Assigned(FplanItemInRefDateEdit) then
      planItemInRefDateEdit.Free;
    if Assigned(FplanItemOutRefCountGen) then
      planItemOutRefCountGen.Free;
    if Assigned(FplanItemOutRefTimeGen) then
      planItemOutRefTimeGen.Free;
    if Assigned(FplanItemOutRefDateEdit) then
      planItemOutRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENPlanWorkItem2PlanWorkItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItem');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkItem2PlanWorkItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkItem2PlanWorkItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkItem2PlanWorkItemControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2PlanWorkItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkItem2PlanWorkItemControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2PlanWorkItemController/action/ENPlanWorkItem2PlanWorkItemController.%operationName%');


end.
