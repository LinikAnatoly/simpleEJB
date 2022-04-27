unit ENObjCrossDownController;

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

  ENObjCrossDown            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENObjCrossDownRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENObjCrossDown = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENObjCrossDownFilter = class(TRemotable)
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

  ENObjCrossDownFilter = class(ENObjCrossDown)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENObjCrossDownShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENObjCrossDownShort = array of ENObjCrossDownShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENObjCrossDownShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENObjCrossDownShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENObjCrossDownShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENObjCrossDownController/message/
  // soapAction: http://ksoe.org/ENObjCrossDownController/action/ENObjCrossDownController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENObjCrossDownControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENObjCrossDownController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENObjCrossDownControllerSoapPort = interface(IInvokable)
  ['{13ef13ef-13ef-13ef-13ef-13ef13ef13ef}']
    function  add(const aENObjCrossDown: ENObjCrossDown): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENObjCrossDown: ENObjCrossDown); stdcall;
    function  getObject(const anObjectCode: Integer): ENObjCrossDown; stdcall;
    function  getList: ENObjCrossDownShortList; stdcall;
    function  getFilteredList(const aENObjCrossDownFilter: ENObjCrossDownFilter): ENObjCrossDownShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENObjCrossDownShortList; stdcall;
    function  getScrollableFilteredList(const aENObjCrossDownFilter: ENObjCrossDownFilter; const aFromPosition: Integer; const aQuantity: Integer): ENObjCrossDownShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENObjCrossDownShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENObjCrossDownFilter: ENObjCrossDownFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENObjCrossDownShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENObjCrossDown, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossDown');
  RemClassRegistry.RegisterXSClass(ENObjCrossDownRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossDownRef');
  RemClassRegistry.RegisterXSClass(ENObjCrossDownFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossDownFilter');
  RemClassRegistry.RegisterXSClass(ENObjCrossDownShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossDownShort');
  RemClassRegistry.RegisterXSClass(ENObjCrossDownShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjCrossDownShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENObjCrossDownShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENObjCrossDownShort');

  InvRegistry.RegisterInterface(TypeInfo(ENObjCrossDownControllerSoapPort), 'http://ksoe.org/ENObjCrossDownController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENObjCrossDownControllerSoapPort), 'http://ksoe.org/ENObjCrossDownController/action/ENObjCrossDownController.%operationName%');


end.
