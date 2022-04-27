unit ENSignerController;

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

  ENSigner            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSignerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSigner = class(TRemotable)
  private
    Fcode : Integer;
    FsignerPosition : WideString;
    FsignerFio : WideString;
    FsignatureImagePath : WideString;
    FcommentGen : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property signerPosition : WideString read FsignerPosition write FsignerPosition;
    property signerFio : WideString read FsignerFio write FsignerFio;
    property signatureImagePath : WideString read FsignatureImagePath write FsignatureImagePath;
    property commentGen : WideString read FcommentGen write FcommentGen;
  end;

{
  ENSignerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FsignerPosition : WideString;
    FsignerFio : WideString;
    FsignatureImagePath : WideString;
    FcommentGen : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property signerPosition : WideString read FsignerPosition write FsignerPosition;
    property signerFio : WideString read FsignerFio write FsignerFio;
    property signatureImagePath : WideString read FsignatureImagePath write FsignatureImagePath;
    property commentGen : WideString read FcommentGen write FcommentGen;
  end;
}

  ENSignerFilter = class(ENSigner)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSignerShort = class(TRemotable)
  private
    Fcode : Integer;
    FsignerPosition : WideString;
    FsignerFio : WideString;
    FsignatureImagePath : WideString;
    FcommentGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property signerPosition : WideString read FsignerPosition write FsignerPosition;
    property signerFio : WideString read FsignerFio write FsignerFio;
    property signatureImagePath : WideString read FsignatureImagePath write FsignatureImagePath;
    property commentGen : WideString read FcommentGen write FcommentGen;

  end;

  ArrayOfENSignerShort = array of ENSignerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSignerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSignerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSignerShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSignerController/message/
  // soapAction: http://ksoe.org/ENSignerController/action/ENSignerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSignerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSignerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSignerControllerSoapPort = interface(IInvokable)
  ['{4F4DCA04-13A0-41CE-B43A-F2F45E6656B8}']
    function add(const aENSigner: ENSigner): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSigner: ENSigner); stdcall;
    function getObject(const anObjectCode: Integer): ENSigner; stdcall;
    function getList: ENSignerShortList; stdcall;
    function getFilteredList(const aENSignerFilter: ENSignerFilter): ENSignerShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSignerShortList; stdcall;
    function getScrollableFilteredList(const aENSignerFilter: ENSignerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSignerShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSignerShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSignerFilter: ENSignerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSignerShort; stdcall;
  end;


implementation



  destructor ENSignerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSigner, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSigner');
  RemClassRegistry.RegisterXSClass(ENSignerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSignerRef');
  RemClassRegistry.RegisterXSClass(ENSignerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSignerFilter');
  RemClassRegistry.RegisterXSClass(ENSignerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSignerShort');
  RemClassRegistry.RegisterXSClass(ENSignerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSignerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSignerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSignerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSignerControllerSoapPort), 'http://ksoe.org/ENSignerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSignerControllerSoapPort), 'http://ksoe.org/ENSignerController/action/ENSignerController.%operationName%');


end.
