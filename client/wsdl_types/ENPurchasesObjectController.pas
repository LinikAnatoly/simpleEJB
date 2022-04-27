unit ENPurchasesObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPurchasesObjectReasonController 
   ,ENElementTypeController 
   ,ENDepartmentController 
   //,ENDepartmentController 
   ,ENElementController 
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

  ENPurchasesObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FexpandMaterialsIP : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FpurchasesReason : ENPurchasesObjectReason;
//???
    FelementTypeRef : ENElementTypeRef;
//???
    Fbudget : ENDepartment;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  expandMaterialsIP : Integer read FexpandMaterialsIP write FexpandMaterialsIP;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property purchasesReason : ENPurchasesObjectReason read FpurchasesReason write FpurchasesReason; 
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef; 
    property budget : ENDepartment read Fbudget write Fbudget; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property element : ENElement read Felement write Felement; 
  end;

  ENPurchasesObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FexpandMaterialsIP : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FpurchasesReason : ENPurchasesObjectReason;
//???
    FelementTypeRef : ENElementTypeRef;
//???
    Fbudget : ENDepartment;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  expandMaterialsIP : Integer read FexpandMaterialsIP write FexpandMaterialsIP;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property purchasesReason : ENPurchasesObjectReason read FpurchasesReason write FpurchasesReason; 
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef; 
    property budget : ENDepartment read Fbudget write Fbudget; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property element : ENElement read Felement write Felement; 
  end;


  ENPurchasesObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FexpandMaterialsIP : Integer;
    FpurchasesReasonCode : Integer; 
    FpurchasesReasonName : WideString;
    FelementTypeRefCode : Integer; 
    FelementTypeRefName : WideString;
    FbudgetCode : Integer; 
    FbudgetShortName : WideString;
    FbudgetDateStart : TXSDate;
    FbudgetDateFinal : TXSDate;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FelementCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  expandMaterialsIP : Integer read FexpandMaterialsIP write FexpandMaterialsIP;

    property purchasesReasonCode : Integer read FpurchasesReasonCode write FpurchasesReasonCode; 
    property purchasesReasonName : WideString read FpurchasesReasonName write FpurchasesReasonName; 
    property elementTypeRefCode : Integer read FelementTypeRefCode write FelementTypeRefCode; 
    property elementTypeRefName : WideString read FelementTypeRefName write FelementTypeRefName; 
    property budgetCode : Integer read FbudgetCode write FbudgetCode; 
    property budgetShortName : WideString read FbudgetShortName write FbudgetShortName; 
    property budgetDateStart : TXSDate read FbudgetDateStart write FbudgetDateStart; 
    property budgetDateFinal : TXSDate read FbudgetDateFinal write FbudgetDateFinal; 
    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENPurchasesObjectShort = array of ENPurchasesObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPurchasesObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPurchasesObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPurchasesObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPurchasesObjectController/message/
  // soapAction: http://ksoe.org/ENPurchasesObjectController/action/ENPurchasesObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPurchasesObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPurchasesObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPurchasesObjectControllerSoapPort = interface(IInvokable)
  ['{105f105f-105f-105f-105f-105f105f105f}']
    function  add(const aENPurchasesObject: ENPurchasesObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPurchasesObject: ENPurchasesObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENPurchasesObject; stdcall;
    function  getList: ENPurchasesObjectShortList; stdcall;
    function  getFilteredList(const aENPurchasesObjectFilter: ENPurchasesObjectFilter): ENPurchasesObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENPurchasesObjectFilter: ENPurchasesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesObjectShortList; stdcall;
  end; 


implementation

  destructor ENPurchasesObject.Destroy;
  begin
    if Assigned(FpurchasesReason) then
      purchasesReason.Free;
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    if Assigned(Fbudget) then
      budget.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
  
  destructor ENPurchasesObjectFilter.Destroy;
  begin
    if Assigned(FpurchasesReason) then
      purchasesReason.Free;
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    if Assigned(Fbudget) then
      budget.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
  
  destructor ENPurchasesObjectShort.Destroy;
  begin
    if Assigned(FbudgetDateStart) then
      budgetDateStart.Free;
    if Assigned(FbudgetDateFinal) then
      budgetDateFinal.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor ENPurchasesObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPurchasesObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObject');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectRef');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectFilter');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectShort');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPurchasesObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPurchasesObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPurchasesObjectControllerSoapPort), 'http://ksoe.org/ENPurchasesObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPurchasesObjectControllerSoapPort), 'http://ksoe.org/ENPurchasesObjectController/action/ENPurchasesObjectController.%operationName%');


end.
