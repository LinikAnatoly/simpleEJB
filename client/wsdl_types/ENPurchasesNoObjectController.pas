unit ENPurchasesNoObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDepartmentController 
   //,ENDepartmentController
   ,ENElementController 
   ,ENPurchasesNoObjectTypeController 
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

  ENPurchasesNoObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesNoObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesNoObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fbudget : ENDepartment;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
//???
    FtypeRef : ENPurchasesNoObjectTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property budget : ENDepartment read Fbudget write Fbudget; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property element : ENElement read Felement write Felement; 
    property typeRef : ENPurchasesNoObjectTypeRef read FtypeRef write FtypeRef; 
  end;
  
{
  ENPurchasesNoObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fbudget : ENDepartment;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
//???
    FtypeRef : ENPurchasesNoObjectTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property budget : ENDepartment read Fbudget write Fbudget; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property element : ENElement read Felement write Felement; 
    property typeRef : ENPurchasesNoObjectTypeRef read FtypeRef write FtypeRef; 
  end;
}

  ENPurchasesNoObjectFilter = class(ENPurchasesNoObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPurchasesNoObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbudgetCode : Integer; 
    FbudgetShortName : WideString;
    FbudgetDateStart : TXSDate;
    FbudgetDateFinal : TXSDate;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FelementCode : Integer; 
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property budgetCode : Integer read FbudgetCode write FbudgetCode; 
    property budgetShortName : WideString read FbudgetShortName write FbudgetShortName; 
    property budgetDateStart : TXSDate read FbudgetDateStart write FbudgetDateStart; 
    property budgetDateFinal : TXSDate read FbudgetDateFinal write FbudgetDateFinal; 
    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
  end;

  ArrayOfENPurchasesNoObjectShort = array of ENPurchasesNoObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPurchasesNoObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPurchasesNoObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPurchasesNoObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPurchasesNoObjectController/message/
  // soapAction: http://ksoe.org/ENPurchasesNoObjectController/action/ENPurchasesNoObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPurchasesNoObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPurchasesNoObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPurchasesNoObjectControllerSoapPort = interface(IInvokable)
  ['{13c913c9-13c9-13c9-13c9-13c913c913c9}']
    function  add(const aENPurchasesNoObject: ENPurchasesNoObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPurchasesNoObject: ENPurchasesNoObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENPurchasesNoObject; stdcall;
    function  getList: ENPurchasesNoObjectShortList; stdcall;
    function  getFilteredList(const aENPurchasesNoObjectFilter: ENPurchasesNoObjectFilter): ENPurchasesNoObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesNoObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENPurchasesNoObjectFilter: ENPurchasesNoObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesNoObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesNoObjectShortList; stdcall;
  end; 


implementation

  destructor ENPurchasesNoObject.Destroy;
  begin
    if Assigned(Fbudget) then
      budget.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENPurchasesNoObjectFilter.Destroy;
  begin
    if Assigned(Fbudget) then
      budget.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENPurchasesNoObjectFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPurchasesNoObjectShort.Destroy;
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
  
  destructor ENPurchasesNoObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPurchasesNoObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObject');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectRef');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectFilter');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectShort');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPurchasesNoObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPurchasesNoObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPurchasesNoObjectControllerSoapPort), 'http://ksoe.org/ENPurchasesNoObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPurchasesNoObjectControllerSoapPort), 'http://ksoe.org/ENPurchasesNoObjectController/action/ENPurchasesNoObjectController.%operationName%');


end.
