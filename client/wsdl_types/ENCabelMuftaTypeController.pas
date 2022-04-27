unit ENCabelMuftaTypeController;

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

  ENCabelMuftaType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelMuftaTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelMuftaType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENCabelMuftaTypeFilter = class(TRemotable)
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

  ENCabelMuftaTypeFilter = class(ENCabelMuftaType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCabelMuftaTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENCabelMuftaTypeShort = array of ENCabelMuftaTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCabelMuftaTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCabelMuftaTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCabelMuftaTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCabelMuftaTypeController/message/
  // soapAction: http://ksoe.org/ENCabelMuftaTypeController/action/ENCabelMuftaTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCabelMuftaTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCabelMuftaTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCabelMuftaTypeControllerSoapPort = interface(IInvokable)
  ['{38863886-3886-3886-3886-388638863886}']
    function  add(const aENCabelMuftaType: ENCabelMuftaType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCabelMuftaType: ENCabelMuftaType); stdcall;
    function  getObject(const anObjectCode: Integer): ENCabelMuftaType; stdcall;
    function  getList: ENCabelMuftaTypeShortList; stdcall;
    function  getFilteredList(const aENCabelMuftaTypeFilter: ENCabelMuftaTypeFilter): ENCabelMuftaTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCabelMuftaTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENCabelMuftaTypeFilter: ENCabelMuftaTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCabelMuftaTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCabelMuftaTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCabelMuftaTypeFilter: ENCabelMuftaTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENCabelMuftaTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCabelMuftaType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelMuftaType');
  RemClassRegistry.RegisterXSClass(ENCabelMuftaTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelMuftaTypeRef');
  RemClassRegistry.RegisterXSClass(ENCabelMuftaTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelMuftaTypeFilter');
  RemClassRegistry.RegisterXSClass(ENCabelMuftaTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelMuftaTypeShort');
  RemClassRegistry.RegisterXSClass(ENCabelMuftaTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelMuftaTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCabelMuftaTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCabelMuftaTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCabelMuftaTypeControllerSoapPort), 'http://ksoe.org/ENCabelMuftaTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCabelMuftaTypeControllerSoapPort), 'http://ksoe.org/ENCabelMuftaTypeController/action/ENCabelMuftaTypeController.%operationName%');


end.
