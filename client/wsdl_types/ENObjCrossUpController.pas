unit ENObjCrossUpController;

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

  ENObjCrossUp            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENObjCrossUpRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENObjCrossUp = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENObjCrossUpFilter = class(TRemotable)
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

  ENObjCrossUpFilter = class(ENObjCrossUp)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENObjCrossUpShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENObjCrossUpShort = array of ENObjCrossUpShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENObjCrossUpShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENObjCrossUpShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENObjCrossUpShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENObjCrossUpController/message/
  // soapAction: http://ksoe.org/ENObjCrossUpController/action/ENObjCrossUpController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENObjCrossUpControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENObjCrossUpController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENObjCrossUpControllerSoapPort = interface(IInvokable)
  ['{11c011c0-11c0-11c0-11c0-11c011c011c0}']
    function  add(const aENObjCrossUp: ENObjCrossUp): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENObjCrossUp: ENObjCrossUp); stdcall;
    function  getObject(const anObjectCode: Integer): ENObjCrossUp; stdcall;
    function  getList: ENObjCrossUpShortList; stdcall;
    function  getFilteredList(const aENObjCrossUpFilter: ENObjCrossUpFilter): ENObjCrossUpShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENObjCrossUpShortList; stdcall;
    function  getScrollableFilteredList(const aENObjCrossUpFilter: ENObjCrossUpFilter; const aFromPosition: Integer; const aQuantity: Integer): ENObjCrossUpShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENObjCrossUpShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENObjCrossUpFilter: ENObjCrossUpFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENObjCrossUpShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENObjCrossUp, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossUp');
  RemClassRegistry.RegisterXSClass(ENObjCrossUpRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossUpRef');
  RemClassRegistry.RegisterXSClass(ENObjCrossUpFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossUpFilter');
  RemClassRegistry.RegisterXSClass(ENObjCrossUpShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossUpShort');
  RemClassRegistry.RegisterXSClass(ENObjCrossUpShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossUpShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENObjCrossUpShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENObjCrossUpShort');

  InvRegistry.RegisterInterface(TypeInfo(ENObjCrossUpControllerSoapPort), 'http://ksoe.org/ENObjCrossUpController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENObjCrossUpControllerSoapPort), 'http://ksoe.org/ENObjCrossUpController/action/ENObjCrossUpController.%operationName%');


end.
