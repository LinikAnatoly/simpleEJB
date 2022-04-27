unit SystemOperationsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
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

  SystemOperations            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SystemOperationsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SystemOperations = class(TRemotable)
  private
    Fcode : Integer;
  published
    property code : Integer read Fcode write Fcode;
  end;

{
  SystemOperationsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
  end;
}

  SystemOperationsFilter = class(SystemOperations)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SystemOperationsShort = class(TRemotable)
  private
    Fcode : Integer;
  published
    property  code : Integer read Fcode write Fcode;

  end;

  ArrayOfSystemOperationsShort = array of SystemOperationsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SystemOperationsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSystemOperationsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSystemOperationsShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/SystemOperationsController/message/
  // soapAction: http://ksoe.org/SystemOperationsController/action/SystemOperationsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SystemOperationsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SystemOperationsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SystemOperationsControllerSoapPort = interface(IInvokable)
  ['{70879D00-EE19-49E3-B184-D527441371E2}']

    //** отправка расчетных листов для сотрудников на e-mail */
	  procedure sendingPaySheetsForEmployees(); stdcall;

    //** перезагрузка сервисов - Billing */
  	procedure restartBillingService(); stdcall;

  end;



implementation



  destructor SystemOperationsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SystemOperations, 'http://ksoe.org/EnergyproControllerService/type/', 'SystemOperations');
  RemClassRegistry.RegisterXSClass(SystemOperationsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SystemOperationsRef');
  RemClassRegistry.RegisterXSClass(SystemOperationsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SystemOperationsFilter');
  RemClassRegistry.RegisterXSClass(SystemOperationsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SystemOperationsShort');
  RemClassRegistry.RegisterXSClass(SystemOperationsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SystemOperationsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSystemOperationsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSystemOperationsShort');

  InvRegistry.RegisterInterface(TypeInfo(SystemOperationsControllerSoapPort), 'http://ksoe.org/SystemOperationsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SystemOperationsControllerSoapPort), 'http://ksoe.org/SystemOperationsController/action/SystemOperationsController.%operationName%');


end.
