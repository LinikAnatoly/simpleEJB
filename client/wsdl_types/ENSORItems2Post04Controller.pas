unit ENSORItems2Post04Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPost04OKSNController
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

  ENSORItems2Post04            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSORItems2Post04Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSORItems2Post04 = class(TRemotable)
  private
    Fcode : Integer;
//???
    Fpost04Ref : ENPost04OKSNRef;
//???
    FsorItemRef : ENSORentItemsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property post04Ref : ENPost04OKSNRef read Fpost04Ref write Fpost04Ref;
    property sorItemRef : ENSORentItemsRef read FsorItemRef write FsorItemRef;
  end;

{
  ENSORItems2Post04Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    Fpost04Ref : ENPost04OKSNRef;
//???
    FsorItemRef : ENSORentItemsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property post04Ref : ENPost04OKSNRef read Fpost04Ref write Fpost04Ref;
    property sorItemRef : ENSORentItemsRef read FsorItemRef write FsorItemRef;
  end;
}

  ENSORItems2Post04Filter = class(ENSORItems2Post04)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSORItems2Post04Short = class(TRemotable)
  private
    Fcode : Integer;
    Fpost04RefCode : Integer;
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
    Fpost04Name : WideString;
    Fline04Name : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property post04RefCode : Integer read Fpost04RefCode write Fpost04RefCode;
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

    property post04Name : WideString read Fpost04Name write Fpost04Name;
    property line04Name : WideString read Fline04Name write Fline04Name;

  end;

  ArrayOfENSORItems2Post04Short = array of ENSORItems2Post04Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSORItems2Post04ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSORItems2Post04Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSORItems2Post04Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSORItems2Post04Controller/message/
  // soapAction: http://ksoe.org/ENSORItems2Post04Controller/action/ENSORItems2Post04Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSORItems2Post04ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSORItems2Post04Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSORItems2Post04ControllerSoapPort = interface(IInvokable)
  ['{FCB19933-A1D1-49F6-9368-62CEAFFFF8C6}']
    function add(const aENSORItems2Post04: ENSORItems2Post04): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSORItems2Post04: ENSORItems2Post04); stdcall;
    function getObject(const anObjectCode: Integer): ENSORItems2Post04; stdcall;
    function getList: ENSORItems2Post04ShortList; stdcall;
    function getFilteredList(const aENSORItems2Post04Filter: ENSORItems2Post04Filter): ENSORItems2Post04ShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSORItems2Post04ShortList; stdcall;
    function getScrollableFilteredList(const aENSORItems2Post04Filter: ENSORItems2Post04Filter; const aFromPosition: Integer; const aQuantity: Integer): ENSORItems2Post04ShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSORItems2Post04ShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSORItems2Post04Filter: ENSORItems2Post04Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSORItems2Post04Short; stdcall;
  end;


implementation

  destructor ENSORItems2Post04.Destroy;
  begin
    if Assigned(Fpost04Ref) then
      post04Ref.Free;
    if Assigned(FsorItemRef) then
      sorItemRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSORItems2Post04Filter.Destroy;
  begin
    if Assigned(Fpost04Ref) then
      post04Ref.Free;
    if Assigned(FsorItemRef) then
      sorItemRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSORItems2Post04Filter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSORItems2Post04Short.Destroy;
  begin
    if Assigned(FsorItemRefJointLineLenght) then
      sorItemRefJointLineLenght.Free;
    if Assigned(FsorItemRefDateEdit) then
      sorItemRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENSORItems2Post04ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSORItems2Post04, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post04');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post04Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post04Ref');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post04Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post04Filter');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post04Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post04Short');
  RemClassRegistry.RegisterXSClass(ENSORItems2Post04ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSORItems2Post04ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSORItems2Post04Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSORItems2Post04Short');

  InvRegistry.RegisterInterface(TypeInfo(ENSORItems2Post04ControllerSoapPort), 'http://ksoe.org/ENSORItems2Post04Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSORItems2Post04ControllerSoapPort), 'http://ksoe.org/ENSORItems2Post04Controller/action/ENSORItems2Post04Controller.%operationName%');


end.
