unit ENDistributionAgreeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENWarrantController
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

  ENDistributionAgree            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDistributionAgreeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDistributionAgree = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDateTime;
    Feic : WideString;
    Fobjectname : WideString;
    Fobjectaddress : WideString;
    Fpower : TXSDecimal;
    Fd2fusename : WideString;
    Fd3countername : WideString;
    Fd3countertype : WideString;
    Fd3amperageratio : TXSDecimal;
    Fd3voltageratio : TXSDecimal;
    Fd3totalratio : TXSDecimal;
    Fd3place : WideString;
    Fd3voltageclass : WideString;
    Fd3workmode : WideString;
    Fd3tarifftype : WideString;
    Fd3accountingtype : WideString;
    Fd5feederlist : WideString;
    Fd6reliabilitypue : WideString;
    Fd6reliabilityguaranteed : WideString;
    Fd6balancesupplier : WideString;
    Fd6balanceclient : WideString;
    Fd6responsibilitysupplier : WideString;
    Fd6responsibilityclient : WideString;
    Fd6balancelimit : WideString;
    Fd7linesource : WideString;
    Fd7attachment : WideString;
    Fd8conditions : WideString;
    Fd8transformertype : WideString;
    Fd8voltagebh : TXSDecimal;
    Fd8voltagehh : TXSDecimal;
    Fd8lossesxx : TXSDecimal;
    Fd8losseskz : TXSDecimal;
    Fd8amperage : TXSDecimal;
    Fd8voltagekz : TXSDecimal;
    Fd8linelength : TXSDecimal;
    Fd8liner : TXSDecimal;
    Fd8linex : TXSDecimal;
    Fd8hours : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property eic : WideString read Feic write Feic;
    property objectname : WideString read Fobjectname write Fobjectname;
    property objectaddress : WideString read Fobjectaddress write Fobjectaddress;
    property power : TXSDecimal read Fpower write Fpower;
    property d2fusename : WideString read Fd2fusename write Fd2fusename;
    property d3countername : WideString read Fd3countername write Fd3countername;
    property d3countertype : WideString read Fd3countertype write Fd3countertype;
    property d3amperageratio : TXSDecimal read Fd3amperageratio write Fd3amperageratio;
    property d3voltageratio : TXSDecimal read Fd3voltageratio write Fd3voltageratio;
    property d3totalratio : TXSDecimal read Fd3totalratio write Fd3totalratio;
    property d3place : WideString read Fd3place write Fd3place;
    property d3voltageclass : WideString read Fd3voltageclass write Fd3voltageclass;
    property d3workmode : WideString read Fd3workmode write Fd3workmode;
    property d3tarifftype : WideString read Fd3tarifftype write Fd3tarifftype;
    property d3accountingtype : WideString read Fd3accountingtype write Fd3accountingtype;
    property d5feederlist : WideString read Fd5feederlist write Fd5feederlist;
    property d6reliabilitypue : WideString read Fd6reliabilitypue write Fd6reliabilitypue;
    property d6reliabilityguaranteed : WideString read Fd6reliabilityguaranteed write Fd6reliabilityguaranteed;
    property d6balancesupplier : WideString read Fd6balancesupplier write Fd6balancesupplier;
    property d6balanceclient : WideString read Fd6balanceclient write Fd6balanceclient;
    property d6responsibilitysupplier : WideString read Fd6responsibilitysupplier write Fd6responsibilitysupplier;
    property d6responsibilityclient : WideString read Fd6responsibilityclient write Fd6responsibilityclient;
    property d6balancelimit : WideString read Fd6balancelimit write Fd6balancelimit;
    property d7linesource : WideString read Fd7linesource write Fd7linesource;
    property d7attachment : WideString read Fd7attachment write Fd7attachment;
    property d8conditions : WideString read Fd8conditions write Fd8conditions;
    property d8transformertype : WideString read Fd8transformertype write Fd8transformertype;
    property d8voltagebh : TXSDecimal read Fd8voltagebh write Fd8voltagebh;
    property d8voltagehh : TXSDecimal read Fd8voltagehh write Fd8voltagehh;
    property d8lossesxx : TXSDecimal read Fd8lossesxx write Fd8lossesxx;
    property d8losseskz : TXSDecimal read Fd8losseskz write Fd8losseskz;
    property d8amperage : TXSDecimal read Fd8amperage write Fd8amperage;
    property d8voltagekz : TXSDecimal read Fd8voltagekz write Fd8voltagekz;
    property d8linelength : TXSDecimal read Fd8linelength write Fd8linelength;
    property d8liner : TXSDecimal read Fd8liner write Fd8liner;
    property d8linex : TXSDecimal read Fd8linex write Fd8linex;
    property d8hours : Integer read Fd8hours write Fd8hours;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;

{
  ENDistributionAgreeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : DateTime;
    Feic : WideString;
    Fobjectname : WideString;
    Fobjectaddress : WideString;
    Fpower : TXSDecimal;
    Fd2fusename : WideString;
    Fd3countername : WideString;
    Fd3countertype : WideString;
    Fd3amperageratio : TXSDecimal;
    Fd3voltageratio : TXSDecimal;
    Fd3totalratio : TXSDecimal;
    Fd3place : WideString;
    Fd3voltageclass : WideString;
    Fd3workmode : WideString;
    Fd3tarifftype : WideString;
    Fd3accountingtype : WideString;
    Fd5feederlist : WideString;
    Fd6reliabilitypue : WideString;
    Fd6reliabilityguaranteed : WideString;
    Fd6balancesupplier : WideString;
    Fd6balanceclient : WideString;
    Fd6responsibilitysupplier : WideString;
    Fd6responsibilityclient : WideString;
    Fd6balancelimit : WideString;
    Fd7linesource : WideString;
    Fd7attachment : WideString;
    Fd8conditions : WideString;
    Fd8transformertype : WideString;
    Fd8voltagebh : TXSDecimal;
    Fd8voltagehh : TXSDecimal;
    Fd8lossesxx : TXSDecimal;
    Fd8losseskz : TXSDecimal;
    Fd8amperage : TXSDecimal;
    Fd8voltagekz : TXSDecimal;
    Fd8linelength : TXSDecimal;
    Fd8liner : TXSDecimal;
    Fd8linex : TXSDecimal;
    Fd8hours : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : DateTime;
    property eic : WideString read Feic write Feic;
    property objectname : WideString read Fobjectname write Fobjectname;
    property objectaddress : WideString read Fobjectaddress write Fobjectaddress;
    property power : TXSDecimal read Fpower write Fpower;
    property d2fusename : WideString read Fd2fusename write Fd2fusename;
    property d3countername : WideString read Fd3countername write Fd3countername;
    property d3countertype : WideString read Fd3countertype write Fd3countertype;
    property d3amperageratio : TXSDecimal read Fd3amperageratio write Fd3amperageratio;
    property d3voltageratio : TXSDecimal read Fd3voltageratio write Fd3voltageratio;
    property d3totalratio : TXSDecimal read Fd3totalratio write Fd3totalratio;
    property d3place : WideString read Fd3place write Fd3place;
    property d3voltageclass : WideString read Fd3voltageclass write Fd3voltageclass;
    property d3workmode : WideString read Fd3workmode write Fd3workmode;
    property d3tarifftype : WideString read Fd3tarifftype write Fd3tarifftype;
    property d3accountingtype : WideString read Fd3accountingtype write Fd3accountingtype;
    property d5feederlist : WideString read Fd5feederlist write Fd5feederlist;
    property d6reliabilitypue : WideString read Fd6reliabilitypue write Fd6reliabilitypue;
    property d6reliabilityguaranteed : WideString read Fd6reliabilityguaranteed write Fd6reliabilityguaranteed;
    property d6balancesupplier : WideString read Fd6balancesupplier write Fd6balancesupplier;
    property d6balanceclient : WideString read Fd6balanceclient write Fd6balanceclient;
    property d6responsibilitysupplier : WideString read Fd6responsibilitysupplier write Fd6responsibilitysupplier;
    property d6responsibilityclient : WideString read Fd6responsibilityclient write Fd6responsibilityclient;
    property d6balancelimit : WideString read Fd6balancelimit write Fd6balancelimit;
    property d7linesource : WideString read Fd7linesource write Fd7linesource;
    property d7attachment : WideString read Fd7attachment write Fd7attachment;
    property d8conditions : WideString read Fd8conditions write Fd8conditions;
    property d8transformertype : WideString read Fd8transformertype write Fd8transformertype;
    property d8voltagebh : TXSDecimal read Fd8voltagebh write Fd8voltagebh;
    property d8voltagehh : TXSDecimal read Fd8voltagehh write Fd8voltagehh;
    property d8lossesxx : TXSDecimal read Fd8lossesxx write Fd8lossesxx;
    property d8losseskz : TXSDecimal read Fd8losseskz write Fd8losseskz;
    property d8amperage : TXSDecimal read Fd8amperage write Fd8amperage;
    property d8voltagekz : TXSDecimal read Fd8voltagekz write Fd8voltagekz;
    property d8linelength : TXSDecimal read Fd8linelength write Fd8linelength;
    property d8liner : TXSDecimal read Fd8liner write Fd8liner;
    property d8linex : TXSDecimal read Fd8linex write Fd8linex;
    property d8hours : Integer read Fd8hours write Fd8hours;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;
}

  ENDistributionAgreeFilter = class(ENDistributionAgree)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDistributionAgreeShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDateTime;
    Feic : WideString;
    Fobjectname : WideString;
    Fobjectaddress : WideString;
    Fpower : TXSDecimal;
    Fd2fusename : WideString;
    Fd3countername : WideString;
    Fd3countertype : WideString;
    Fd3amperageratio : TXSDecimal;
    Fd3voltageratio : TXSDecimal;
    Fd3totalratio : TXSDecimal;
    Fd3place : WideString;
    Fd3voltageclass : WideString;
    Fd3workmode : WideString;
    Fd3tarifftype : WideString;
    Fd3accountingtype : WideString;
    Fd5feederlist : WideString;
    Fd6reliabilitypue : WideString;
    Fd6reliabilityguaranteed : WideString;
    Fd6balancesupplier : WideString;
    Fd6balanceclient : WideString;
    Fd6responsibilitysupplier : WideString;
    Fd6responsibilityclient : WideString;
    Fd6balancelimit : WideString;
    Fd7linesource : WideString;
    Fd7attachment : WideString;
    Fd8conditions : WideString;
    Fd8transformertype : WideString;
    Fd8voltagebh : TXSDecimal;
    Fd8voltagehh : TXSDecimal;
    Fd8lossesxx : TXSDecimal;
    Fd8losseskz : TXSDecimal;
    Fd8amperage : TXSDecimal;
    Fd8voltagekz : TXSDecimal;
    Fd8linelength : TXSDecimal;
    Fd8liner : TXSDecimal;
    Fd8linex : TXSDecimal;
    Fd8hours : Integer;
    FuserGen : WideString;
    FwarrantRefCode : Integer;
    FwarrantRefNumbergen : WideString;
    FwarrantRefName : WideString;
    FwarrantRefWarrantFIO : WideString;
    FwarrantRefWarrantShortFIO : WideString;
    FwarrantRefWarrantPosition : WideString;
    FwarrantRefGenitiveFIO : WideString;
    FwarrantRefGenitivePosition : WideString;
    FwarrantRefPassport : WideString;
    FwarrantRefAddress : WideString;
    FwarrantRefPower : Integer;
    FwarrantRefMaxSum : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property eic : WideString read Feic write Feic;
    property objectname : WideString read Fobjectname write Fobjectname;
    property objectaddress : WideString read Fobjectaddress write Fobjectaddress;
    property power : TXSDecimal read Fpower write Fpower;
    property d2fusename : WideString read Fd2fusename write Fd2fusename;
    property d3countername : WideString read Fd3countername write Fd3countername;
    property d3countertype : WideString read Fd3countertype write Fd3countertype;
    property d3amperageratio : TXSDecimal read Fd3amperageratio write Fd3amperageratio;
    property d3voltageratio : TXSDecimal read Fd3voltageratio write Fd3voltageratio;
    property d3totalratio : TXSDecimal read Fd3totalratio write Fd3totalratio;
    property d3place : WideString read Fd3place write Fd3place;
    property d3voltageclass : WideString read Fd3voltageclass write Fd3voltageclass;
    property d3workmode : WideString read Fd3workmode write Fd3workmode;
    property d3tarifftype : WideString read Fd3tarifftype write Fd3tarifftype;
    property d3accountingtype : WideString read Fd3accountingtype write Fd3accountingtype;
    property d5feederlist : WideString read Fd5feederlist write Fd5feederlist;
    property d6reliabilitypue : WideString read Fd6reliabilitypue write Fd6reliabilitypue;
    property d6reliabilityguaranteed : WideString read Fd6reliabilityguaranteed write Fd6reliabilityguaranteed;
    property d6balancesupplier : WideString read Fd6balancesupplier write Fd6balancesupplier;
    property d6balanceclient : WideString read Fd6balanceclient write Fd6balanceclient;
    property d6responsibilitysupplier : WideString read Fd6responsibilitysupplier write Fd6responsibilitysupplier;
    property d6responsibilityclient : WideString read Fd6responsibilityclient write Fd6responsibilityclient;
    property d6balancelimit : WideString read Fd6balancelimit write Fd6balancelimit;
    property d7linesource : WideString read Fd7linesource write Fd7linesource;
    property d7attachment : WideString read Fd7attachment write Fd7attachment;
    property d8conditions : WideString read Fd8conditions write Fd8conditions;
    property d8transformertype : WideString read Fd8transformertype write Fd8transformertype;
    property d8voltagebh : TXSDecimal read Fd8voltagebh write Fd8voltagebh;
    property d8voltagehh : TXSDecimal read Fd8voltagehh write Fd8voltagehh;
    property d8lossesxx : TXSDecimal read Fd8lossesxx write Fd8lossesxx;
    property d8losseskz : TXSDecimal read Fd8losseskz write Fd8losseskz;
    property d8amperage : TXSDecimal read Fd8amperage write Fd8amperage;
    property d8voltagekz : TXSDecimal read Fd8voltagekz write Fd8voltagekz;
    property d8linelength : TXSDecimal read Fd8linelength write Fd8linelength;
    property d8liner : TXSDecimal read Fd8liner write Fd8liner;
    property d8linex : TXSDecimal read Fd8linex write Fd8linex;
    property  d8hours : Integer read Fd8hours write Fd8hours;
    property userGen : WideString read FuserGen write FuserGen;

    property warrantRefCode : Integer read FwarrantRefCode write FwarrantRefCode;
    property warrantRefNumbergen : WideString read FwarrantRefNumbergen write FwarrantRefNumbergen;
    property warrantRefName : WideString read FwarrantRefName write FwarrantRefName;
    property warrantRefWarrantFIO : WideString read FwarrantRefWarrantFIO write FwarrantRefWarrantFIO;
    property warrantRefWarrantShortFIO : WideString read FwarrantRefWarrantShortFIO write FwarrantRefWarrantShortFIO;
    property warrantRefWarrantPosition : WideString read FwarrantRefWarrantPosition write FwarrantRefWarrantPosition;
    property warrantRefGenitiveFIO : WideString read FwarrantRefGenitiveFIO write FwarrantRefGenitiveFIO;
    property warrantRefGenitivePosition : WideString read FwarrantRefGenitivePosition write FwarrantRefGenitivePosition;
    property warrantRefPassport : WideString read FwarrantRefPassport write FwarrantRefPassport;
    property warrantRefAddress : WideString read FwarrantRefAddress write FwarrantRefAddress;
    property warrantRefPower : Integer read FwarrantRefPower write FwarrantRefPower;
    property warrantRefMaxSum : TXSDecimal read FwarrantRefMaxSum write FwarrantRefMaxSum;
  end;

  ArrayOfENDistributionAgreeShort = array of ENDistributionAgreeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDistributionAgreeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDistributionAgreeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDistributionAgreeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDistributionAgreeController/message/
  // soapAction: http://ksoe.org/ENDistributionAgreeController/action/ENDistributionAgreeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDistributionAgreeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDistributionAgreeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDistributionAgreeControllerSoapPort = interface(IInvokable)
  ['{A1B7F737-CD5C-42BC-ADF8-EA3CB8ADC954}']
    function add(const aENDistributionAgree: ENDistributionAgree): Integer; stdcall;      overload;
    function add(const aENDistributionAgree: ENDistributionAgree; const soCode : Integer): Integer; stdcall;  overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDistributionAgree: ENDistributionAgree); stdcall;
    function getObject(const anObjectCode: Integer): ENDistributionAgree; stdcall;
    function getList: ENDistributionAgreeShortList; stdcall;
    function getFilteredList(const aENDistributionAgreeFilter: ENDistributionAgreeFilter): ENDistributionAgreeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDistributionAgreeShortList; stdcall;
    function getScrollableFilteredList(const aENDistributionAgreeFilter: ENDistributionAgreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDistributionAgreeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDistributionAgreeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDistributionAgreeFilter: ENDistributionAgreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDistributionAgreeShort; stdcall;
  end;


implementation

  destructor ENDistributionAgree.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Fpower) then
      power.Free;
    if Assigned(Fd3amperageratio) then
      d3amperageratio.Free;
    if Assigned(Fd3voltageratio) then
      d3voltageratio.Free;
    if Assigned(Fd3totalratio) then
      d3totalratio.Free;
    if Assigned(Fd8voltagebh) then
      d8voltagebh.Free;
    if Assigned(Fd8voltagehh) then
      d8voltagehh.Free;
    if Assigned(Fd8lossesxx) then
      d8lossesxx.Free;
    if Assigned(Fd8losseskz) then
      d8losseskz.Free;
    if Assigned(Fd8amperage) then
      d8amperage.Free;
    if Assigned(Fd8voltagekz) then
      d8voltagekz.Free;
    if Assigned(Fd8linelength) then
      d8linelength.Free;
    if Assigned(Fd8liner) then
      d8liner.Free;
    if Assigned(Fd8linex) then
      d8linex.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDistributionAgreeFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Fpower) then
      power.Free;
    if Assigned(Fd3amperageratio) then
      d3amperageratio.Free;
    if Assigned(Fd3voltageratio) then
      d3voltageratio.Free;
    if Assigned(Fd3totalratio) then
      d3totalratio.Free;
    if Assigned(Fd8voltagebh) then
      d8voltagebh.Free;
    if Assigned(Fd8voltagehh) then
      d8voltagehh.Free;
    if Assigned(Fd8lossesxx) then
      d8lossesxx.Free;
    if Assigned(Fd8losseskz) then
      d8losseskz.Free;
    if Assigned(Fd8amperage) then
      d8amperage.Free;
    if Assigned(Fd8voltagekz) then
      d8voltagekz.Free;
    if Assigned(Fd8linelength) then
      d8linelength.Free;
    if Assigned(Fd8liner) then
      d8liner.Free;
    if Assigned(Fd8linex) then
      d8linex.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDistributionAgreeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDistributionAgreeShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Fpower) then
      power.Free;
    if Assigned(Fd3amperageratio) then
      d3amperageratio.Free;
    if Assigned(Fd3voltageratio) then
      d3voltageratio.Free;
    if Assigned(Fd3totalratio) then
      d3totalratio.Free;
    if Assigned(Fd8voltagebh) then
      d8voltagebh.Free;
    if Assigned(Fd8voltagehh) then
      d8voltagehh.Free;
    if Assigned(Fd8lossesxx) then
      d8lossesxx.Free;
    if Assigned(Fd8losseskz) then
      d8losseskz.Free;
    if Assigned(Fd8amperage) then
      d8amperage.Free;
    if Assigned(Fd8voltagekz) then
      d8voltagekz.Free;
    if Assigned(Fd8linelength) then
      d8linelength.Free;
    if Assigned(Fd8liner) then
      d8liner.Free;
    if Assigned(Fd8linex) then
      d8linex.Free;
    if Assigned(FwarrantRefMaxSum) then
      warrantRefMaxSum.Free;
    inherited Destroy;
  end;

  destructor ENDistributionAgreeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDistributionAgree, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistributionAgree');
  RemClassRegistry.RegisterXSClass(ENDistributionAgreeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistributionAgreeRef');
  RemClassRegistry.RegisterXSClass(ENDistributionAgreeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistributionAgreeFilter');
  RemClassRegistry.RegisterXSClass(ENDistributionAgreeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistributionAgreeShort');
  RemClassRegistry.RegisterXSClass(ENDistributionAgreeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistributionAgreeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDistributionAgreeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDistributionAgreeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDistributionAgreeControllerSoapPort), 'http://ksoe.org/ENDistributionAgreeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDistributionAgreeControllerSoapPort), 'http://ksoe.org/ENDistributionAgreeController/action/ENDistributionAgreeController.%operationName%');


end.
