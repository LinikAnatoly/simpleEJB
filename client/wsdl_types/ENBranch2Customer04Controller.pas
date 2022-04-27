unit ENBranch2Customer04Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENBranchController 
   ,ENCustomer04Controller 
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

  ENBranch2Customer04            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranch2Customer04Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranch2Customer04 = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Faddress: WideString;
//???
    FbranchRef : ENBranchRef;
    FcurrentAutomat: TXSDecimal;
//???
    Fcustomer04Ref : ENCustomer04Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property currentAutomat : TXSDecimal read FcurrentAutomat write FcurrentAutomat;
    property branchRef : ENBranchRef read FbranchRef write FbranchRef;
    property customer04Ref : ENCustomer04Ref read Fcustomer04Ref write Fcustomer04Ref;
  end;
  
{
  ENBranch2Customer04Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcurrentAutomat : TXSDecimal;
//???
    FbranchRef : ENBranchRef;
//???
    Fcustomer04Ref : ENCustomer04Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property currentAutomat : TXSDecimal read FcurrentAutomat write FcurrentAutomat; 
    property branchRef : ENBranchRef read FbranchRef write FbranchRef; 
    property customer04Ref : ENCustomer04Ref read Fcustomer04Ref write Fcustomer04Ref; 
  end;
}

  ENBranch2Customer04Filter = class(ENBranch2Customer04)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENBranch2Customer04Short = class(TRemotable)
  private
    Fcode: Integer;
    Fname: WideString;
    FcurrentAutomat: TXSDecimal;
    FbranchRefCode: Integer;
    FbranchRefName: WideString;
    FbranchRefBasicConsumer: WideString;
    FbranchRefNumberGen: WideString;
    Fcustomer04RefCode: Integer;
    Fcustomer04RefName: WideString;
    FaddressRefCode: Integer;
    FlocationHouse: WideString;
    FlocationApp: WideString;
    FprovinceCode: Integer;
    FprovinceName: WideString;
    FregionCode: Integer;
    FregionName: WideString;
    FcityCode: Integer;
    FcityName: WideString;
    FdistrictCode: Integer;
    FdistrictName: WideString;
    FstreetCode: Integer;
    FstreetName: WideString;
    FcityTypeCode: Integer;
    FcityTypeName: WideString;
    FstreetTypeCode: Integer;
    FstreetTypeName: WideString;
    Faddress: WideString;
    Fphone: WideString;
  public
    destructor Destroy; override;
  published
    property code: Integer read Fcode write Fcode;
    property name: WideString read Fname write Fname;
    property currentAutomat: TXSDecimal read FcurrentAutomat write FcurrentAutomat;
    property branchRefCode: Integer read FbranchRefCode write FbranchRefCode;
    property branchRefName: WideString read FbranchRefName write FbranchRefName;
    property branchRefBasicConsumer: WideString read FbranchRefBasicConsumer write FbranchRefBasicConsumer;
    property branchRefNumberGen: WideString read FbranchRefNumberGen write FbranchRefNumberGen;
    property customer04RefCode: Integer read Fcustomer04RefCode write Fcustomer04RefCode;
    property customer04RefName: WideString read Fcustomer04RefName write Fcustomer04RefName;
    property addressRefCode: Integer read FaddressRefCode write FaddressRefCode;
    property locationHouse: WideString read FlocationHouse write FlocationHouse;
    property locationApp: WideString read FlocationApp write FlocationApp;
    property provinceCode: Integer read FprovinceCode write FprovinceCode;
    property provinceName: WideString read FprovinceName write FprovinceName;
    property regionCode: Integer read FregionCode write FregionCode;
    property regionName: WideString read FregionName write FregionName;
    property cityCode: Integer read FcityCode write FcityCode;
    property cityName: WideString read FcityName write FcityName;
    property districtCode: Integer read FdistrictCode write FdistrictCode;
    property districtName: WideString read FdistrictName write FdistrictName;
    property streetCode: Integer read FstreetCode write FstreetCode;
    property streetName: WideString read FstreetName write FstreetName;
    property cityTypeCode: Integer read FcityTypeCode write FcityTypeCode;
    property cityTypeName: WideString read FcityTypeName write FcityTypeName;
    property streetTypeCode: Integer read FstreetTypeCode write FstreetTypeCode;
    property streetTypeName: WideString read FstreetTypeName write FstreetTypeName;
    property address: WideString read Faddress write Faddress;
    property phone: WideString read Fphone write Fphone;
  end;

  ArrayOfENBranch2Customer04Short = array of ENBranch2Customer04Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBranch2Customer04ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBranch2Customer04Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBranch2Customer04Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBranch2Customer04Controller/message/
  // soapAction: http://ksoe.org/ENBranch2Customer04Controller/action/ENBranch2Customer04Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBranch2Customer04ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBranch2Customer04Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBranch2Customer04ControllerSoapPort = interface(IInvokable)
  ['{18bf18bf-18bf-18bf-18bf-18bf18bf18bf}']
    function  add(const aENBranch2Customer04: ENBranch2Customer04): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBranch2Customer04: ENBranch2Customer04); stdcall;
    function  getObject(const anObjectCode: Integer): ENBranch2Customer04; stdcall;
    function  getList: ENBranch2Customer04ShortList; stdcall;
    function  getFilteredList(const aENBranch2Customer04Filter: ENBranch2Customer04Filter): ENBranch2Customer04ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBranch2Customer04ShortList; stdcall;
    function  getScrollableFilteredList(const aENBranch2Customer04Filter: ENBranch2Customer04Filter; const aFromPosition: Integer; const aQuantity: Integer): ENBranch2Customer04ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBranch2Customer04ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENBranch2Customer04Filter: ENBranch2Customer04Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENBranch2Customer04.Destroy;
  begin
    if Assigned(FcurrentAutomat) then
      currentAutomat.Free;
    if Assigned(FbranchRef) then
      branchRef.Free;
    if Assigned(Fcustomer04Ref) then
      customer04Ref.Free;
    inherited Destroy;
  end;

{  
  destructor ENBranch2Customer04Filter.Destroy;
  begin
    if Assigned(FcurrentAutomat) then
      currentAutomat.Free;
    if Assigned(FbranchRef) then
      branchRef.Free;
    if Assigned(Fcustomer04Ref) then
      customer04Ref.Free;
    inherited Destroy;
  end; 
}

  destructor ENBranch2Customer04Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENBranch2Customer04Short.Destroy;
  begin
    if Assigned(FcurrentAutomat) then
      currentAutomat.Free;
    inherited Destroy;
  end; 
  
  destructor ENBranch2Customer04ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBranch2Customer04, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch2Customer04');
  RemClassRegistry.RegisterXSClass(ENBranch2Customer04Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch2Customer04Ref');
  RemClassRegistry.RegisterXSClass(ENBranch2Customer04Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch2Customer04Filter');
  RemClassRegistry.RegisterXSClass(ENBranch2Customer04Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch2Customer04Short');
  RemClassRegistry.RegisterXSClass(ENBranch2Customer04ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch2Customer04ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBranch2Customer04Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBranch2Customer04Short');

  InvRegistry.RegisterInterface(TypeInfo(ENBranch2Customer04ControllerSoapPort), 'http://ksoe.org/ENBranch2Customer04Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBranch2Customer04ControllerSoapPort), 'http://ksoe.org/ENBranch2Customer04Controller/action/ENBranch2Customer04Controller.%operationName%');


end.
