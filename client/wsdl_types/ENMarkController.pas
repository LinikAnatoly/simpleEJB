unit ENMarkController;

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

  ENMark            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMarkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMark = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENMarkFilter = class(TRemotable)
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

  ENMarkFilter = class(ENMark)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMarkShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENMarkShort = array of ENMarkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMarkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMarkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMarkShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMarkController/message/
  // soapAction: http://ksoe.org/ENMarkController/action/ENMarkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMarkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMarkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMarkControllerSoapPort = interface(IInvokable)
  ['{1df21df2-1df2-1df2-1df2-1df21df21df2}']
    function  add(const aENMark: ENMark): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMark: ENMark); stdcall;
    function  getObject(const anObjectCode: Integer): ENMark; stdcall;
    function  getList: ENMarkShortList; stdcall;
    function  getFilteredList(const aENMarkFilter: ENMarkFilter): ENMarkShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMarkShortList; stdcall;
    function  getScrollableFilteredList(const aENMarkFilter: ENMarkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMarkShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMarkShortList; stdcall;
  end; 


implementation


  
  destructor ENMarkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMark, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMark');
  RemClassRegistry.RegisterXSClass(ENMarkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkRef');
  RemClassRegistry.RegisterXSClass(ENMarkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkFilter');
  RemClassRegistry.RegisterXSClass(ENMarkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkShort');
  RemClassRegistry.RegisterXSClass(ENMarkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMarkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMarkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMarkControllerSoapPort), 'http://ksoe.org/ENMarkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMarkControllerSoapPort), 'http://ksoe.org/ENMarkController/action/ENMarkController.%operationName%');


end.
