unit ENPurchasesNoObjectTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  ENPurchasesNoObjectType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesNoObjectTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesNoObjectType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENPurchasesNoObjectTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
}

  ENPurchasesNoObjectTypeFilter = class(ENPurchasesNoObjectType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPurchasesNoObjectTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPurchasesNoObjectTypeShort = array of ENPurchasesNoObjectTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPurchasesNoObjectTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPurchasesNoObjectTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPurchasesNoObjectTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPurchasesNoObjectTypeController/message/
  // soapAction: http://ksoe.org/ENPurchasesNoObjectTypeController/action/ENPurchasesNoObjectTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPurchasesNoObjectTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPurchasesNoObjectTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPurchasesNoObjectTypeControllerSoapPort = interface(IInvokable)
  ['{c118c118-c118-c118-c118-c118c118c118}']
    function  add(const aENPurchasesNoObjectType: ENPurchasesNoObjectType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPurchasesNoObjectType: ENPurchasesNoObjectType); stdcall;
    function  getObject(const anObjectCode: Integer): ENPurchasesNoObjectType; stdcall;
    function  getList: ENPurchasesNoObjectTypeShortList; stdcall;
    function  getFilteredList(const aENPurchasesNoObjectTypeFilter: ENPurchasesNoObjectTypeFilter): ENPurchasesNoObjectTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesNoObjectTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENPurchasesNoObjectTypeFilter: ENPurchasesNoObjectTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesNoObjectTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesNoObjectTypeShortList; stdcall;
  end; 


implementation


  
  destructor ENPurchasesNoObjectTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectType');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectTypeRef');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectTypeShort');
  RemClassRegistry.RegisterXSClass(ENPurchasesNoObjectTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesNoObjectTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPurchasesNoObjectTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPurchasesNoObjectTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPurchasesNoObjectTypeControllerSoapPort), 'http://ksoe.org/ENPurchasesNoObjectTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPurchasesNoObjectTypeControllerSoapPort), 'http://ksoe.org/ENPurchasesNoObjectTypeController/action/ENPurchasesNoObjectTypeController.%operationName%');


end.
