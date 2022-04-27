unit ENCustomer04Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns,
  EnergyProController, EnergyProController2, AddressController;

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

  ENCustomer04            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCustomer04Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCustomer04 = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Faddress : WideString;
    Fphone : WideString;
//???
    FaddressRef : AddressRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property address : WideString read Faddress write Faddress;
    property phone : WideString read Fphone write Fphone;
    property addressRef : AddressRef read FaddressRef write FaddressRef; 
  end;
  
{
  ENCustomer04Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Faddress : WideString;
    Fphone : WideString;
//???
    FaddressRef : AddressRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property address : WideString read Faddress write Faddress;
    property phone : WideString read Fphone write Fphone;
    property addressRef : AddressRef read FaddressRef write FaddressRef; 
  end;
}

  ENCustomer04Filter = class(ENCustomer04)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCustomer04Short = class(TRemotable)
  private
    Fcode: Integer;
    Fname: WideString;
    Faddress: WideString;
    Fphone : WideString;
    FaddressRefCode : Integer;
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
  published
    property code: Integer read Fcode write Fcode;
    property name: WideString read Fname write Fname;
    property address : WideString read Faddress write Faddress;
    property phone : WideString read Fphone write Fphone;
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
  end;

  ArrayOfENCustomer04Short = array of ENCustomer04Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCustomer04ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCustomer04Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCustomer04Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCustomer04Controller/message/
  // soapAction: http://ksoe.org/ENCustomer04Controller/action/ENCustomer04Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCustomer04ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCustomer04Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCustomer04ControllerSoapPort = interface(IInvokable)
  ['{1b901b90-1b90-1b90-1b90-1b901b901b90}']
    function  add(const aENCustomer04: ENCustomer04): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCustomer04: ENCustomer04); stdcall;
    function  getObject(const anObjectCode: Integer): ENCustomer04; stdcall;
    function  getList: ENCustomer04ShortList; stdcall;
    function  getFilteredList(const aENCustomer04Filter: ENCustomer04Filter): ENCustomer04ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCustomer04ShortList; stdcall;
    function  getScrollableFilteredList(const aENCustomer04Filter: ENCustomer04Filter; const aFromPosition: Integer; const aQuantity: Integer): ENCustomer04ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCustomer04ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCustomer04Filter: ENCustomer04Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENCustomer04.Destroy;
  begin
    if Assigned(FaddressRef) then
      addressRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENCustomer04Filter.Destroy;
  begin
    if Assigned(FaddressRef) then
      addressRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENCustomer04Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENCustomer04ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCustomer04, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomer04');
  RemClassRegistry.RegisterXSClass(ENCustomer04Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomer04Ref');
  RemClassRegistry.RegisterXSClass(ENCustomer04Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomer04Filter');
  RemClassRegistry.RegisterXSClass(ENCustomer04Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomer04Short');
  RemClassRegistry.RegisterXSClass(ENCustomer04ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomer04ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCustomer04Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCustomer04Short');

  InvRegistry.RegisterInterface(TypeInfo(ENCustomer04ControllerSoapPort), 'http://ksoe.org/ENCustomer04Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCustomer04ControllerSoapPort), 'http://ksoe.org/ENCustomer04Controller/action/ENCustomer04Controller.%operationName%');


end.
