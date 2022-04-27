unit ENConsumerCategoryController;

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

  ENConsumerCategory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConsumerCategoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConsumerCategory = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENConsumerCategoryFilter = class(TRemotable)
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

  ENConsumerCategoryFilter = class(ENConsumerCategory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENConsumerCategoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConsumerCategoryShort = array of ENConsumerCategoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConsumerCategoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConsumerCategoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConsumerCategoryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConsumerCategoryController/message/
  // soapAction: http://ksoe.org/ENConsumerCategoryController/action/ENConsumerCategoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConsumerCategoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConsumerCategoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConsumerCategoryControllerSoapPort = interface(IInvokable)
  ['{16581658-1658-1658-1658-165816581658}']
    function  add(const aENConsumerCategory: ENConsumerCategory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConsumerCategory: ENConsumerCategory); stdcall;
    function  getObject(const anObjectCode: Integer): ENConsumerCategory; stdcall;
    function  getList: ENConsumerCategoryShortList; stdcall;
    function  getFilteredList(const aENConsumerCategoryFilter: ENConsumerCategoryFilter): ENConsumerCategoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConsumerCategoryShortList; stdcall;
    function  getScrollableFilteredList(const aENConsumerCategoryFilter: ENConsumerCategoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConsumerCategoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConsumerCategoryShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENConsumerCategoryFilter: ENConsumerCategoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENConsumerCategoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConsumerCategory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConsumerCategory');
  RemClassRegistry.RegisterXSClass(ENConsumerCategoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConsumerCategoryRef');
  RemClassRegistry.RegisterXSClass(ENConsumerCategoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConsumerCategoryFilter');
  RemClassRegistry.RegisterXSClass(ENConsumerCategoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConsumerCategoryShort');
  RemClassRegistry.RegisterXSClass(ENConsumerCategoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConsumerCategoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConsumerCategoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConsumerCategoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConsumerCategoryControllerSoapPort), 'http://ksoe.org/ENConsumerCategoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConsumerCategoryControllerSoapPort), 'http://ksoe.org/ENConsumerCategoryController/action/ENConsumerCategoryController.%operationName%');


end.
