unit ENFamilyRelationController;

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

  ENFamilyRelation            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFamilyRelationRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFamilyRelation = class(TRemotable)
  private
    Fcode : Integer;
    Frelation : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property relation : WideString read Frelation write Frelation;
  end;

{
  ENFamilyRelationFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Frelation : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property relation : WideString read Frelation write Frelation;
  end;
}

  ENFamilyRelationFilter = class(ENFamilyRelation)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFamilyRelationShort = class(TRemotable)
  private
    Fcode : Integer;
    Frelation : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property relation : WideString read Frelation write Frelation;

  end;

  ArrayOfENFamilyRelationShort = array of ENFamilyRelationShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFamilyRelationShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFamilyRelationShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFamilyRelationShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFamilyRelationController/message/
  // soapAction: http://ksoe.org/ENFamilyRelationController/action/ENFamilyRelationController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFamilyRelationControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFamilyRelationController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFamilyRelationControllerSoapPort = interface(IInvokable)
  ['{700D9FFE-FE0F-4744-8219-DF4F0A4279A3}']
    function add(const aENFamilyRelation: ENFamilyRelation): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFamilyRelation: ENFamilyRelation); stdcall;
    function getObject(const anObjectCode: Integer): ENFamilyRelation; stdcall;
    function getList: ENFamilyRelationShortList; stdcall;
    function getFilteredList(const aENFamilyRelationFilter: ENFamilyRelationFilter): ENFamilyRelationShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFamilyRelationShortList; stdcall;
    function getScrollableFilteredList(const aENFamilyRelationFilter: ENFamilyRelationFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFamilyRelationShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFamilyRelationShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFamilyRelationFilter: ENFamilyRelationFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFamilyRelationShort; stdcall;
  end;


implementation



  destructor ENFamilyRelationShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFamilyRelation, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilyRelation');
  RemClassRegistry.RegisterXSClass(ENFamilyRelationRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilyRelationRef');
  RemClassRegistry.RegisterXSClass(ENFamilyRelationFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilyRelationFilter');
  RemClassRegistry.RegisterXSClass(ENFamilyRelationShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilyRelationShort');
  RemClassRegistry.RegisterXSClass(ENFamilyRelationShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilyRelationShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFamilyRelationShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFamilyRelationShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFamilyRelationControllerSoapPort), 'http://ksoe.org/ENFamilyRelationController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFamilyRelationControllerSoapPort), 'http://ksoe.org/ENFamilyRelationController/action/ENFamilyRelationController.%operationName%');


end.
