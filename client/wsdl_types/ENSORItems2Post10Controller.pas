unit ENSORItems2Post10Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPost10OKSNController
   ,ENSORentItemsController
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

  ENSORItems2Post10            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSORItems2Post10Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSORItems2Post10 = class(TRemotable)
  private
    Fcode : Integer;
//???
    Fpost10Ref : ENPost10OKSNRef;
//???
    FsorItemRef : ENSORentItemsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property post10Ref : ENPost10OKSNRef read Fpost10Ref write Fpost10Ref;
    property sorItemRef : ENSORentItemsRef read FsorItemRef write FsorItemRef;
  end;

{
  ENSORItems2Post10Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    Fpost10Ref : ENPost10OKSNRef;
//???
    FsorItemRef : ENSORentItemsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property post10Ref : ENPost10OKSNRef read Fpost10Ref write Fpost10Ref;
    property sorItemRef : ENSORentItemsRef read FsorItemRef write FsorItemRef;
  end;
}

  ENSORItems2Post10Filter = class(ENSORItems2Post10)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSORItems2Post10Short = class(TRemotable)
  private
    Fcode : Integer;
    Fpost10RefCode : Integer;
    FsorItemRefCode : Integer;
    FsorItemRefLocalityName : WideString;
    FsorItemRefAddress : WideString;
    FsorItemRefPylonNumbers : WideString;
    FsorItemRefJointLineLenght : TXSDecimal;
    FsorItemRefLinePurpose : WideString;
    FsorItemRefJointLineCableMark : WideString;
    FsorItemRefBranchLineName : WideString;
    FsorItemRefUserGen : WideString;
    FsorItemRefDateEdit : TXSDateTime;
    Fpost10Name : WideString;
    Fline10Name : WideString;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property post10RefCode : Integer read Fpost10RefCode write Fpost10RefCode;
    property sorItemRefCode : Integer read FsorItemRefCode write FsorItemRefCode;
    property sorItemRefLocalityName : WideString read FsorItemRefLocalityName write FsorItemRefLocalityName;
    property sorItemRefAddress : WideString read FsorItemRefAddress write FsorItemRefAddress;
    property sorItemRefPylonNumbers : WideString read FsorItemRefPylonNumbers write FsorItemRefPylonNumbers;
    property sorItemRefJointLineLenght : TXSDecimal read FsorItemRefJointLineLenght write FsorItemRefJointLineLenght;
    property sorItemRefLinePurpose : WideString read FsorItemRefLinePurpose write FsorItemRefLinePurpose;
    property sorItemRefJointLineCableMark : WideString read FsorItemRefJointLineCableMark write FsorItemRefJointLineCableMark;
    property sorItemRefBranchLineName : WideString read FsorItemRefBranchLineName write FsorItemRefBranchLineName;
    property sorItemRefUserGen : WideString read FsorItemRefUserGen write FsorItemRefUserGen;
    property sorItemRefDateEdit : TXSDateTime read FsorItemRefDateEdit write FsorItemRefDateEdit;

    property post10Name : WideString read Fpost10Name write Fpost10Name;
    property line10Name : WideString read Fline10Name write Fline10Name;
  end;

  ArrayOfENSORItems2Post10Short = array of ENSORItems2Post10Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSORItems2Post10ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSORItems2Post10Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSORItems2Post10Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSORItems2Post10Controller/message/
  // soapAction: http://ksoe.org/ENSORItems2Post10Controller/action/ENSORItems2Post10Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSORItems2Post10ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSORItems2Post10Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSORItems2Post10ControllerSoapPort = interface(IInvokable)
  ['{141E556E-11B1-45FF-9ADB-A4016E1393D3}']
    function add(const aENSORItems2Post10: ENSORItems2Post10): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSORItems2Post10: ENSORItems2Post10); stdcall;
    function getObject(const anObjectCode: Integer): ENSORItems2Post10; stdcall;
    function getList: ENSORItems2Post10ShortList; stdcall;
    function getFilteredList(const aENSORItems2Post10Filter: ENSORItems2Post10Filter): ENSORItems2Post10ShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSORItems2Post10ShortList; stdcall;
    function getScrollableFilteredList(const aENSORItems2Post10Filter: ENSORItems2Post10Filter; const aFromPosition: Integer; const aQuantity: Integer): ENSORItems2Post10ShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSORItems2Post10ShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSORItems2Post10Filter: ENSORItems2Post10Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSORItems2Post10Short; stdcall;
  end;


implementation

  destructor ENSORItems2Post10.Destroy;
  begin
    if Assigned(Fpost10Ref) then
      post10Ref.Free;
    if Assigned(FsorItemRef) then
      sorItemRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSORItems2Post10Filter.Destroy;
  begin
    if Assigned(Fpost10Ref) then
      post10Ref.Free;
    if Assigned(FsorItemRef) then
      sorItemRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSORItems2Post10Filter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSORItems2Post10Short.Destroy;
  begin
    if Assigned(FsorItemRefJointLineLenght) then
      sorItemRefJointLineLenght.Free;
    if Assigned(FsorItemRefDateEdit) then
      sorItemRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENSORItems2Post10ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSORItems2Post10, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post10');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post10Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post10Ref');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post10Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post10Filter');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post10Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post10Short');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post10ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post10ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSORItems2Post10Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSORItems2Post10Short');

  InvRegistry.RegisterInterface(TypeInfo(ENSORItems2Post10ControllerSoapPort), 'http://ksoe.org/ENSORItems2Post10Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSORItems2Post10ControllerSoapPort), 'http://ksoe.org/ENSORItems2Post10Controller/action/ENSORItems2Post10Controller.%operationName%');


end.
