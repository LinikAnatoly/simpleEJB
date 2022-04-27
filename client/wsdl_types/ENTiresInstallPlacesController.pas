unit ENTiresInstallPlacesController;

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

  ENTiresInstallPlaces            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTiresInstallPlacesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTiresInstallPlaces = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTiresInstallPlacesFilter = class(TRemotable)
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

  ENTiresInstallPlacesFilter = class(ENTiresInstallPlaces)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTiresInstallPlacesShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTiresInstallPlacesShort = array of ENTiresInstallPlacesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTiresInstallPlacesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTiresInstallPlacesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTiresInstallPlacesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTiresInstallPlacesController/message/
  // soapAction: http://ksoe.org/ENTiresInstallPlacesController/action/ENTiresInstallPlacesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTiresInstallPlacesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTiresInstallPlacesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTiresInstallPlacesControllerSoapPort = interface(IInvokable)
  ['{75d675d6-75d6-75d6-75d6-75d675d675d6}']
    function  add(const aENTiresInstallPlaces: ENTiresInstallPlaces): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTiresInstallPlaces: ENTiresInstallPlaces); stdcall;
    function  getObject(const anObjectCode: Integer): ENTiresInstallPlaces; stdcall;
    function  getList: ENTiresInstallPlacesShortList; stdcall;
    function  getFilteredList(const aENTiresInstallPlacesFilter: ENTiresInstallPlacesFilter): ENTiresInstallPlacesShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTiresInstallPlacesShortList; stdcall;
    function  getScrollableFilteredList(const aENTiresInstallPlacesFilter: ENTiresInstallPlacesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTiresInstallPlacesShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTiresInstallPlacesShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTiresInstallPlacesFilter: ENTiresInstallPlacesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTiresInstallPlacesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTiresInstallPlaces, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallPlaces');
  RemClassRegistry.RegisterXSClass(ENTiresInstallPlacesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallPlacesRef');
  RemClassRegistry.RegisterXSClass(ENTiresInstallPlacesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallPlacesFilter');
  RemClassRegistry.RegisterXSClass(ENTiresInstallPlacesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallPlacesShort');
  RemClassRegistry.RegisterXSClass(ENTiresInstallPlacesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallPlacesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTiresInstallPlacesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTiresInstallPlacesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTiresInstallPlacesControllerSoapPort), 'http://ksoe.org/ENTiresInstallPlacesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTiresInstallPlacesControllerSoapPort), 'http://ksoe.org/ENTiresInstallPlacesController/action/ENTiresInstallPlacesController.%operationName%');


end.
