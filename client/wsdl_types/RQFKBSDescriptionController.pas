unit RQFKBSDescriptionController;

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

  RQFKBSDescription            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKBSDescriptionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKBSDescription = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  RQFKBSDescriptionFilter = class(TRemotable)
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

  RQFKBSDescriptionFilter = class(RQFKBSDescription)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKBSDescriptionShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQFKBSDescriptionShort = array of RQFKBSDescriptionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKBSDescriptionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKBSDescriptionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKBSDescriptionShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKBSDescriptionController/message/
  // soapAction: http://ksoe.org/RQFKBSDescriptionController/action/RQFKBSDescriptionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKBSDescriptionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKBSDescriptionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKBSDescriptionControllerSoapPort = interface(IInvokable)
  ['{10fd10fd-10fd-10fd-10fd-10fd10fd10fd}']
    function  add(const aRQFKBSDescription: RQFKBSDescription): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKBSDescription: RQFKBSDescription); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKBSDescription; stdcall;
    function  getList: RQFKBSDescriptionShortList; stdcall;
    function  getFilteredList(const aRQFKBSDescriptionFilter: RQFKBSDescriptionFilter): RQFKBSDescriptionShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKBSDescriptionShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKBSDescriptionFilter: RQFKBSDescriptionFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKBSDescriptionShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKBSDescriptionShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKBSDescriptionFilter: RQFKBSDescriptionFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor RQFKBSDescriptionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKBSDescription, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBSDescription');
  RemClassRegistry.RegisterXSClass(RQFKBSDescriptionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBSDescriptionRef');
  RemClassRegistry.RegisterXSClass(RQFKBSDescriptionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBSDescriptionFilter');
  RemClassRegistry.RegisterXSClass(RQFKBSDescriptionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBSDescriptionShort');
  RemClassRegistry.RegisterXSClass(RQFKBSDescriptionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKBSDescriptionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKBSDescriptionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKBSDescriptionShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKBSDescriptionControllerSoapPort), 'http://ksoe.org/RQFKBSDescriptionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKBSDescriptionControllerSoapPort), 'http://ksoe.org/RQFKBSDescriptionController/action/RQFKBSDescriptionController.%operationName%');


end.
